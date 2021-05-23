################################################////////--------
# CONFIGURE click, clicks

MIRROR <- # "~/Mirrors/GitHub/dmparrishphd/click/Files"
stop ( "The MIRROR directory must be specified " ,
    "according to the location of the " ,
    'installation directory of the "click" and ' ,
    '"clicks" packages. The present code ' ,
    "provides one of many possible paths. " ,
     "See the installation instructions for " ,
    '"click" and "clicks" for more information.' )

new.env.parent.eq.pos.2 <- function ( ... )
        new.env ( parent = as.environment (
            search() [[ 2 ]] ) , ... )

( function () {
    Env <- new.env.parent.eq.pos.2 ()
    source (
        paste0 ( MIRROR , "/3/0/R/click.R" ) ,
        local = Env )
    attach ( what = Env , name = "click" ) } ) ()

( function () {
    Env <- new.env.parent.eq.pos.2 ()
    source (
        paste0 ( MIRROR , "/4/0/R/clicks.R" ) ,
        local = Env )
    attach ( what = Env , name = "clicks" ) } ) ()

################################################////////--------

# "The coordinates x and y will be passed to mouse event
# handlers in device independent coordinates"
# (`help(getGraphicsEvent)`).
inch.indieCoord <- function ( indieCoord )
        t ( t ( indieCoord ) * par ( "din" ) )

inch_origin.indieCoord <- function ( indieCoord )
        t (
            t ( inch.indieCoord ( indieCoord ) ) -
            par ( "mai" ) [ 2 : 1 ] )

xy.indieCoord <- function ( indieCoord ) {
    ORIGIN.INCH <- inch_origin.indieCoord ( indieCoord )
    ORIGIN.USR  <- par ( "usr" ) [ c ( 1 , 3 ) ]
    SIZE.INCH   <- par ( "pin" )
    SIZE.USR    <- diff ( par ( "usr" ) ) [ -2 ]
    t (
        ORIGIN.USR +
        t ( ORIGIN.INCH ) * SIZE.USR / SIZE.INCH ) }

leftClick1Fuzzy <- function ( toleranceInch = c ( Inf , Inf ) ) {
    repeat {
        indieCoord <- leftClick ()
        MEANS <- c (
            mean ( indieCoord [ , 1 ] ) ,
            mean ( indieCoord [ , 2 ] ) )
        ERROR <- .5 * diff ( indieCoord )
        MATRIX <- rbind ( MEANS , ERROR )
        rownames ( MATRIX ) <- c ( "CENTER" , "ERROR" ) 
        ERROR.INCH <- abs ( inch.indieCoord (
            MATRIX [ "ERROR" , ] ) )
        if ( ! any ( toleranceInch < ERROR.INCH ) ) break }
    MATRIX }

################################################////////--------

# GATHER CLICKS FROM USER
plot(1)
ListInch <- list ()
repeat {
    Indie <- leftClick1Fuzzy ()
    Usr   <- xy.indieCoord ( Indie [ "CENTER" , , drop = FALSE ] )
    Inch <- inch.indieCoord ( Indie [ "ERROR" , , drop = FALSE ] )
    ListInch <- list ( Inch , ListInch )
    LOWER.LEFT <- par ( "usr" ) [ c ( 1 , 3 ) ]
    if (
        ! any ( is.na ( Usr ) ) &&
        all ( Usr [ 1 , ] < LOWER.LEFT )
    ) break # LOOP SHOULD END WHEN USER CLICK IN LOWER-LEFT CORNER
}

# POST-PROCESS TEST RESULTS
xy <- matrix ( unlist ( ListInch ) , ncol = 2 )
x <- sort ( abs ( xy [ , 1 ] ) )
y <- sort ( abs ( xy [ , 2 ] ) )

# DISPLAY RESULTS TO USER
dev.new ( width = 11 , height = 8.5 )
par ( mai = c ( 1.5 , 1.5 , 1.5 , .5 ) )
plot ( c ( 1 , length ( x ) ) , c ( 0 , max ( x , y ) ) , col = NA ,
    main = "Test Results" ,
    ylab = "along-axis distance\nduring click (inches)" ,
    xlab = "rank of along-axis distance" )
mtext( line = 2 : 0 , c (
    "showing intra-click mouse-movement" ,
    "" ,
    'x-direction marked with an ex, y-direction marked with "+"' ) )
points ( seq_along ( x ) , x , pch = 4 )
points ( y , col = NA ) ;
points ( seq_along ( y ) , y , pch = 3 )
