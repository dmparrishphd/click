makeGraphicsEventHandlerStd <- function (
        prompt = "**** READY. ****" ,
        onIdle = NULL ,
        consolePrompt = prompt ) {
    if ( is.null ( getGraphicsEventEnv () ) )
            setGraphicsEventHandlers ()
    CURRENT <- setGraphicsEventHandlers (
        prompt        = prompt ,
        onMouseDown   = onMouseDown ,
        onMouseUp     = onMouseUp ,
        onKeybd       = onKbd ,
        onIdle        = onIdle ,
        consolePrompt = consolePrompt )
    NEW <- getGraphicsEventEnv ()
    setGraphicsEventEnv ( env = CURRENT ) # RESTORE EVENT ENV.
    NEW }
