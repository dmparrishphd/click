onMouse <- function ( event , buttons , x , y )
        replace (
            MOUSE.TEMPLATE ,
            c ( 1 , 3 : 4 , 5 + buttons ) ,
            c ( event , x , y , rep ( 1 , length ( buttons ) ) ) )
