function ( graphicsEventHandlers ) {
    hSet <- setGraphicsEventHandlers
    ENVIR.ORIG <- do.call ( hSet , graphicsEventHandlers )
    ENVIR      <- do.call ( hSet , graphicsEventHandlers )
    # RESTORE STATE:---
    if ( is.null ( ENVIR.ORIG ) ) do.call (
        hSet , list ()
    ) else setGraphicsEventEnv (
        which = dev.cur () , env = ENVIR.ORIG
    )
    ENVIR }
