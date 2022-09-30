function ( xy , n = 7 , ipoint2.2click ) {

    Env <- new.env ( parent = as.environment ( "package:graphics" ) )
    Env $ ipoint2.2click <- ipoint2.2click
    Env $ .XY <- xy
    Env $ .N <- nrow ( Env $ .XY )
    n <- min ( max ( 1L , n ) , Env $ .N )
    Env $ .II <- seq_len ( Env $ .N )
    Env $ .M <- length ( Env $ .II )
    Env $ .i <- Env $ .II [ order ( runif ( Env $ .N ) ) ] [ 1 : n ]
    Env $ .id <- seq_along ( Env $ .i )

    Env $ points <- function () {
            x <- .XY [ .i , 1 ]
            y <- .XY [ .i , 2 ]
            graphics :: points ( x , y, cex = 3 , col = "royalblue" , pch = 16 )
            text ( x , y , labels = .id , col = "white" , font = 2 ) }
    environment ( Env $ points ) <- Env

    Env $ move <- function (
            which ,
            where ,
            wordiness = c ( "verbose" , "quiet" , "silent" ) ) {
        wordiness = match.arg ( wordiness )
        ecat <- function ( ... ) cat ( file = stderr () , sep = "" , ... )
        stopifnot (
            is.integer ( which ) ,
            1L <= which ,
            which <= .N ,
            is.integer ( where ) ,
            1L <= where ,
            where <= .M )
        if ( any ( where == .i ) ) {
            if ( wordiness != "silent" ) ecat (
                "\nWARNING:" ,
                " Nothing moved---destination occupied.\n" )
        } else {
            .i [ which ] <<- where
            if ( wordiness == "verbose" ) ecat ( "\nINFO: Point " , which , " relocated.\n" ) } }
    environment ( Env $ move ) <- Env

    Env $ mmove <- function (
            redraw = function () {} ,
            wordiness = c ( "verbose" , "quiet" , "silent" ) ) {
        wordiness <- match.arg ( wordiness )
        DIRECTIONS <-  '
________________________________________________________________
 
Directions:

-   MOVE A POINT---click a point of origin,
    then a point of destination; or

-   STOP MOVING---press a keyboard-key while
    the keyboard focus is on the current device.\n\n'
        repeat {
            redraw ()
            points ()
            if ( wordiness == "verbose" ) cat (
                DIRECTIONS , sep = "" , file = stderr () )
            FromTo <- ipoint2.2click ( .XY , quiet = TRUE )
            cat ( "\n" , file = stderr () )
            if ( ! all ( is.finite ( FromTo ) ) ) {
                if ( wordiness == "verbose" ) cat (
                    "INFO: normal termination of mover.\n" )
                break }
            Which <- which ( FromTo [[ 1 ]] == .i )
            if ( ! length ( Which ) ) {
                if ( wordiness != "silent" ) cat (
                    "WARNING: Nothing to move---no point found.\n" ) 
                next }
            move ( Which , FromTo [[ 2 ]] , wordiness = wordiness )
        } }
    environment ( Env $ mmove ) <- Env
    
    Env }
