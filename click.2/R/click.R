.GR.EVENT.NULL       <- 0
.GR.EVENT.MOUSE.UP   <- 1
.GR.EVENT.MOUSE.DOWN <- 2
.GR.EVENT.MOUSE.MOVE <- 4
.GR.EVENT.KBD        <- "8"

.GR.BUTTONS.NULL <- rep(NA_real_, 3)
.GR.XY.NULL  <- .GR.BUTTONS.NULL[-1]
.GR.KEY.NULL <- .GR.BUTTONS.NULL[1]

.NAMES <- c("event", "key", "x", "y", paste0("b", 0:2))

.onMouse <- function(event, buttons, x, y) `names<-`(
	c(event, .GR.KEY.NULL, x, y, replace(c(0, 0, 0), buttons + 1, 1)),
	.NAMES)

.fnOnMouseEvent <- function(event)
		function(buttons, x, y) .onMouse(event, buttons, x, y)

.onMouseUp   <- .fnOnMouseEvent(.GR.EVENT.MOUSE.UP)
.onMouseDown <- .fnOnMouseEvent(.GR.EVENT.MOUSE.DOWN)

.onKbd <- function(key) `names<-`(c(
	.GR.EVENT.KBD, key, .GR.XY.NULL, .GR.BUTTONS.NULL),
	.NAMES)

.makeGraphicsEventHandlerStd <- function(
        prompt="**** READY. ****",
        onIdle=NULL,
        consolePrompt=prompt) {

    # SAVE ENVIRONMENT FOR LATER RESTORATION
    ENV.SAVED <- getGraphicsEventEnv()
    
        setGraphicsEventHandlers(
            prompt        = prompt,
            onMouseDown   = .onMouseDown,
            onMouseUp     = .onMouseUp,
            onKeybd       = .onKbd,
            onIdle        = onIdle,
            consolePrompt = consolePrompt)
    
        GRAPHICS.EVENT.HANDLERS <- getGraphicsEventEnv()

    # RESTORE ENVIRONMENT
    if (!is.null(ENV.SAVED)) setGraphicsEventEnv(env=ENV.SAVED)

    GRAPHICS.EVENT.HANDLERS }

click <- function(which=dev.cur(), option="") {
    dev.set(which)
    if (class(option) == "environment") {
        env <- option
    } else if (class(option) == "character") {
        if (!nchar(option) || option == "handler") {
            env <- .makeGraphicsEventHandlerStd()
            if (option == "handler") return(env)
        }
    } else return ()
    ENV.SAVED <- getGraphicsEventEnv(which=which)
    setGraphicsEventEnv(which=which, env=env)
    EVENT <- getGraphicsEvent()
    if (!is.null(ENV.SAVED)) setGraphicsEventEnv(
        which=which, env=ENV.SAVED)
    EVENT }
