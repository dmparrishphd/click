function (
        env ,
        grEvtEnv ,
        retryMessage = paste0 (
            "Oops! Try again:---\n" ,
            "1) click (press and release the primary pointer-",
            "button only) or\n" ,
            "2) press a keyboard-key to cancel.\n" ) ,
        button = list (
            X11cairo = c ( TRUE , TRUE ) ,
            windows = c ( TRUE , FALSE ) ) [[ names ( dev.cur() ) ]] ) {

    repeat {

        E1 <- env $ grEvt ( grEvtEnv )
        if ( identical ( E1 $ event , "keybd" ) )
                return ( env $ nullEvt () )
        if ( with ( E1 ,
            ! identical ( event , "mouseDown" ) ||
            ! identical ( b0 , button [[ 1 ]]  ) ||
            ! identical ( b1 , FALSE ) ||
            ! identical ( b2 , FALSE ) ) ) {
                cat ( retryMessage , file = stderr() )
                next }

        E2 <- env $ grEvt ( grEvtEnv )
        if ( identical ( E2 $ event , "keybd" ) )
                return ( env $ nullEvt () )
        if ( with ( E2 ,
            ! identical ( event , "mouseUp" ) ||
            ! identical ( b0 , button [[ 2 ]] ) ||
            ! identical ( b1 , FALSE ) ||
            ! identical ( b2 , FALSE ) ) ) {
                cat ( retryMessage , file = stderr() )
                next }

        break }

        rbind ( E1 , E2 ) }
