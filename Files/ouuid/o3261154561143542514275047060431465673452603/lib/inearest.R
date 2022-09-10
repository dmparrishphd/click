function ( X , x ) {
    stopifnot (
        is.matrix ( X ) ,
        is.numeric ( X ) ,
        is.vector ( x ) ,
        is.numeric ( x ) ,
        ncol ( X ) == length ( x ) )
    DIFFS <- vapply (
        USE.NAMES = FALSE ,
        X = seq_len ( ncol ( X ) ) ,
        FUN.VALUE = numeric ( nrow ( X ) ) ,
        FUN = function ( j ) X [ , j ] - x [ j ] )
    QUADRANCES <- Reduce ( `+` , as.data.frame ( DIFFS * DIFFS ) )
    MIN <- min ( Inf , QUADRANCES , na.rm = TRUE )
    which ( QUADRANCES == MIN ) }
