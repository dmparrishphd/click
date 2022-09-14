function ( xy ) {
    stopifnot (
        is.vector ( xy ) ,
        is.numeric ( xy ) ,
        length ( xy ) == 2 ,
        dev.cur() != 1 ,
        identical ( par ( "mfcol" ) , c ( 1L , 1L ) ) ,
        identical ( par ( "mfrow" ) , c ( 1L , 1L ) ) )
    USR <- par ( "usr" )
    DIN <- par ( "din" )
    PIN <- par ( "pin" )
    MAI <- par ( "mai" )
    USR.DIM <- diff ( USR ) [ -2 ]
    SCALE <- USR.DIM / PIN
    IN.ORIGIN <- MAI [ 2 : 1 ]
    USR.ORIGIN <- USR [ c ( 1 , 3 ) ]
    IN.DEV <- xy * DIN
    ( IN.DEV - IN.ORIGIN ) * SCALE + USR.ORIGIN }
