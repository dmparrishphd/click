list (
    prompt = "**** READY ****" ,
    # consolePrompt FAILED TO HAVE AN EFFECT DURING TESTING
    onMouseDown = function ( buttons , x , y )
        data.frame (
            event = "mouseDown" ,
            key = NA_character_ ,
            t = as.double ( Sys.time() ) ,
            x = x ,
            y = y ,
            b0 = 0 %in% buttons ,
            b1 = 1 %in% buttons ,
            b2 = 2 %in% buttons ) ,
    onMouseMove = NULL ,
    onMouseUp = function ( buttons , x , y )
        data.frame (
            event = "mouseUp" ,
            key = NA_character_ ,
            t = as.double ( Sys.time() ) ,
            x = x ,
            y = y ,
            b0 = 0 %in% buttons ,
            b1 = 1 %in% buttons ,
            b2 = 2 %in% buttons ) ,
    onKeybd = function ( key )
        data.frame (
            event = "keybd" ,
            key = key ,
            t = as.double ( Sys.time() ) ,
            x = NA_real_ ,
            y = NA_real_ ,
            b0 = NA ,
            b1 = NA ,
            b2 = NA ) )
