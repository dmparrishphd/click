function (
        xy ,
        leftClick = ipoint.click ( out = "leftClick" ) ,
        msgPrefix = "ipoint2.2click: " ,
        quiet = FALSE
        ) {
    DEFAULT <- rep ( NA_integer_ , 2 )
    msg <- function ( characterString ) is.null ( cat (
        characterString ,
        sep = "\n" ,
        file = stderr () ) )
    msgCancel <- function () msg ( paste0 (
        msgPrefix , "CANCELED" ) )
    msgColocated <- function () msg ( paste0 (
        msgPrefix , "ERROR: Colocated Points") )
    `cancel?` <- function ( x ) ifelse (
        test = length ( x ) ,
        yes = FALSE ,
        no = ifelse ( quiet , TRUE , msgCancel() ) )
    `colocated?` <- function ( x ) ifelse (
        test = 1 < length ( x ) ,
        yes = ifelse ( quiet , TRUE , msgCancel () ) ,
        no = FALSE )
    `quit?` <- function ( x )
            `cancel?`    ( x ) ||
            `colocated?` ( x )            
    click. <- function () ipoint.click (
        xy , leftClick = leftClick )
    if (
        `quit?` ( From <- click. () ) ||
        `quit?` ( To   <- click. () ) ) return ( DEFAULT )
    c ( From , To ) }
