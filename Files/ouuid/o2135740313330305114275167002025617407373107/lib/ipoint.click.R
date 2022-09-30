function ( XY , leftClick , env ,
        out = c ( "i" , "leftClick" , "env" ) ) {
    out = match.arg ( out )
    if ( missing ( leftClick ) ) {
        Env <- parent.env ( environment () )
        if ( missing ( env ) ) env <- Env $ envMake ()
        leftClick <- function ( ... )
                Env $ metaLeftClickList $ FUN ( env , ... ) }
    if ( out == "env" ) return ( env )
    if ( out == "leftClick" ) return ( leftClick )
    # THE match.arg CALL GUARANTEES out == "i"
    stopifnot (
        is.matrix ( XY ) ,
        ncol ( XY ) == 2 ,
        is.numeric ( XY ) )
    if ( ! length ( XY ) ) return ( integer () )
    Evt <- leftClick ()
    if ( Evt $ event [[ 1 ]] == "null" ) return ( integer () )
    xy <- unlist ( Evt [ 2 , c ( "x" , "y" ) ] )
    uv <- usr.indie ( xy ) # USE ONLY THE mouseUp-COORDS
    inearest ( XY , uv ) }
