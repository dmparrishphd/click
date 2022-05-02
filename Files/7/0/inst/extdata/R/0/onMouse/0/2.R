onMouse <- function ( event , buttons , x , y ) {
    Df <- TEMPLATE
    Df [ , c ( "event" , "x" , "y" ) ] <- list (
        eventDescr ( event ) , x , y )
    Df [ , c ( "b0" , "b1" , "b2" ) [ 1 + buttons ] ] <- TRUE
    Df }
