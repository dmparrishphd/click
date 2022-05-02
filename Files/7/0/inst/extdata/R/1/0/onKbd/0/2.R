onKbd <- function ( key )
        `[<-` (
            TEMPLATE ,
            1L ,
            c ( "event" , "key" ) ,
            list ( "keybd" , key ) )
