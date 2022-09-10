function ( env ) {
    ENVIR0 <- setGraphicsEventEnv ( env = env )
    EVENT.DESCRIPTION <- getGraphicsEvent ()
    if ( is.null ( ENVIR0 ) ) {
        do.call ( setGraphicsEventHandlers , list () )
    } else {
        setGraphicsEventEnv ( env = ENVIR0 )
    }
    EVENT.DESCRIPTION }
