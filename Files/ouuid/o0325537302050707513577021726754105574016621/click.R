# click
# ID: o0325537302050707513577021726754105574016621
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
( function () {

    En <- new.env ( parent = as.environment ( "package:graphics" ) )
    Ex <- new.env ( parent = En )

    Ex $ HANDLERS <- list (
	    prompt = "**** READY ****" ,
	    # consolePrompt FAILED TO HAVE AN EFFECT DURING TESTING
	    onMouseDown = function ( buttons , x , y )
			    data.frame (
				    event = "mouseDown" ,
				    key = NA_character_ ,
				    t = as.double ( Sys.time() ) ,
				    x = x ,
				    y = y ,
				    b0 = 0 %in% buttons ,
				    b1 = 1 %in% buttons ,
				    b2 = 2 %in% buttons ) ,
	    onMouseMove = function ( buttons , x , y )
			    data.frame (
				    event = "mouseMove" ,
				    key = NA_character_ ,
				    t = as.double ( Sys.time() ) ,
				    x = x ,
				    y = y ,
				    b0 = 0 %in% buttons ,
				    b1 = 1 %in% buttons ,
				    b2 = 2 %in% buttons ) ,
	    onMouseUp = function ( buttons , x , y )
			    data.frame (
				    event = "mouseUp" ,
				    key = NA_character_ ,
				    t = as.double ( Sys.time() ) ,
				    x = x ,
				    y = y ,
				    b0 = 0 %in% buttons ,
				    b1 = 1 %in% buttons ,
				    b2 = 2 %in% buttons ) ,
	    onKeybd = function ( key )
			    data.frame (
				    event = "keybd" ,
				    key = key ,
				    t = as.double ( Sys.time() ) ,
				    x = NA_real_ ,
				    y = NA_real_ ,
				    b0 = NA ,
				    b1 = NA ,
				    b2 = NA ) )



    Ex $ envir <- function ( graphicsEventHandlers ) {
	    hSet <- setGraphicsEventHandlers
	    ENVIR.ORIG <- do.call ( hSet , graphicsEventHandlers )
	    ENVIR      <- do.call ( hSet , graphicsEventHandlers )
	    # RESTORE STATE:---
	    if ( is.null ( ENVIR.ORIG ) ) do.call (
		    hSet , list ()
	    ) else setGraphicsEventEnv (
		    which = dev.cur () , env = ENVIR.ORIG
	    )
	    ENVIR }



    En $ event <- function ( env , which = dev.cur () ) {
	    ENVIR0 <- setGraphicsEventEnv ( which = which , env = env )
	    EVENT.DESCRIPTION <- getGraphicsEvent ()
	    if ( is.null ( ENVIR0 ) ) {
		    do.call ( setGraphicsEventHandlers , list () )
	    } else {
		    setGraphicsEventEnv ( which = which , env = ENVIR0 )
	    }
	    EVENT.DESCRIPTION }



    En $ onTimeout <- function ()
		    data.frame (
			    event = "timeout" ,
			    key = NA_character_ ,
			    t = as.double ( Sys.time() ) ,
			    x = NA_real_ ,
			    y = NA_real_ ,
			    b0 = NA_character_ ,
			    b1 = NA_character_ ,
			    b2 = NA_character_ )



    En $ unnest <- function ( List ) {
	    Length <- 0L
	    Rest <- List
	    while ( length ( Rest ) ) {
		    Length <- Length + 1L
		    Rest <- Rest [[ 2 ]] }
	    if ( ! Length ) return ( list () )
	    Template <- rep ( list ( NULL ) , Length )
	    Rest <- List
	    i <- 1L
	    while ( length ( Rest ) ) {
		    Template [[ i ]] <- Rest [[ 1 ]]
		    i <- i + 1L
		    Rest <- Rest [[ 2 ]] }
	    Template }



    Ex $ stream <- function (
		    env ,
		    which = dev.cur () ,
		    endStreaming = function ( X ) {
			    identical ( X [[ 1 ]] $ key , "Q" ) } ,
		    timeout = 10 ,
		    FUN = function ( X ) { FALSE } ) {
	    List <- list (
		    event ( env , which = which ) ,
		    list () )
	    START.TIME <- List [[ 1 ]] [ 1 , "t" ]
	    if ( ! FUN ( List ) ) while ( ! endStreaming ( List ) ) {
		    Elapsed <- List [[ 1 ]] [ 1 , "t" ] - START.TIME
		    Dc <- dev.cur()
		    DevInfo <- paste0 (
			    Dc , " (" , names ( Dc ) , ")" )
		    if ( timeout < Elapsed ) {
			    List [[ 1 ]] <- onTimeout() # REPLACE LATE RESPONSE
			    break }
		    cat ( "T: " , Elapsed - timeout , "\n" , sep = "" )
		    flush.console()
		    List <- list ( event ( env , which = which ) , List )
		    if ( FUN ( List ) ) break }
	    do.call ( rbind , rev ( unnest ( List ) ) ) }

    environment ( Ex $ envir     ) <- Ex
    environment ( En $ event     ) <- En
    environment ( En $ onTimeout ) <- En
    environment ( En $ unnest    ) <- En
    environment ( Ex $ stream    ) <- Ex

    Ex } ) ()
