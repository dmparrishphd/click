( function () {
with ( GRID <- new.env () , {
    DIM <- c ( 16 , 16 )
    N   <- prod ( DIM )
    IND <- seq_len ( N )
    IJ  <- arrayInd ( ind = IND , .dim = DIM )
    II  <- IJ [ , 1 ]
    JJ  <- IJ [ , 2 ]
    LO  <- c ( 1L , 0L )
    XY  <- IJ - 0.5
    XX  <- XY [ , 1 ]
    YY  <- XY [ , 2 ]
    ROWNOS <- seq_len ( nrow ( XY ) )

    redraw <- function () {
        dev.hold ()
        image (
            x = range ( II ) - LO ,
            y = range ( JJ ) - LO ,
            z = matrix ( 1 ) ,
            asp = 1 ,
            col = NA ,
            xlab = "" , ylab = "" )
        text ( XX , YY ,
            labels = ROWNOS ,
            font = 2 ,
            col = "darkgrey" )
        points ( XY , pch = 4 , cex = 2 )
        points ( IJ , pch = 3 , cex = 2 )
        dev.flush () 
        invisible () }

    GRID } ) } ) ()
