.clickNAMES <- strsplit("event key x y b0 b1 b2", " ")[[1]]

.clickNNAMES <- length(.clickNAMES)

.clickPROTO <- `names<-`(
    rep(NA_real_, .clickNNAMES),
    .clickNAMES)

.clickEVENTDESCR <- strsplit(
    "mouseUp mouseDown mouseMove keybd", " ")[[1]]

clickEventCode <- function(h) match(h, .clickEVENTDESCR)

.clickMOUSE.TEMPLATE <- replace(.clickPROTO, 5:7, rep(0, 3))



.clickOnMouse <- function(event, buttons, x, y)
        replace(
            .clickMOUSE.TEMPLATE,
            c(1, 3:4, 5 + buttons),
            c(event, x, y, rep(1, length(buttons))))

.clickFnOnMouseEvent <- function(event)
		function(buttons, x, y)
                .clickOnMouse(event, buttons, x, y)

.clickOnMouseUp   <-
        .clickFnOnMouseEvent(clickEventCode("mouseUp"))
.clickOnMouseDown <-
        .clickFnOnMouseEvent(clickEventCode("mouseDown"))



.clickKB.TEMPLATE <- replace(
        .clickPROTO, 1, clickEventCode("keybd"))

.clickOnKbd <- function(key) replace(.clickKB.TEMPLATE, 2, key)



.clickMakeGraphicsEventHandlerStd <- function(prompt=
        "**** READY. ****", onIdle=NULL, consolePrompt=prompt) {
    if (is.null(getGraphicsEventEnv()))
            setGraphicsEventHandlers()
    CURRENT <- setGraphicsEventHandlers(
        prompt        = prompt,
        onMouseDown   = .clickOnMouseDown,
        onMouseUp     = .clickOnMouseUp,
        onKeybd       = .clickOnKbd,
        onIdle        = onIdle,
        consolePrompt = consolePrompt)
    NEW <- getGraphicsEventEnv()
    setGraphicsEventEnv(env=CURRENT) # RESTORE EVENT ENV.
    NEW }



clickEventDescr <- function(i)
        if (missing(i)) {
            .clickEVENTDESCR
        } else {
            .clickEVENTDESCR[as.integer(i)] }

clickenv <- function(which=dev.cur()) {
    dev.set(which)
    .clickMakeGraphicsEventHandlerStd() }

click <- function(which=dev.cur(), env=clickenv(which)) {
    dev.set(which)
    ENV.SAVED <- getGraphicsEventEnv(which=which)
    setGraphicsEventEnv(which=which, env=env)
    EVENT <- getGraphicsEvent()
    if (!is.null(ENV.SAVED)) setGraphicsEventEnv(
        which=which, env=ENV.SAVED)
    EVENT }

clickNullEvent <- function() .clickPROTO
