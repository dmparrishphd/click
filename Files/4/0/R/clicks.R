buttons.click <- function(x) x[c("b0", "b1", "b2")]

xy.click <- function(x) x[c("x", "y")]

isMouseDownEvent.click <- function(x)
        identical("mouseDown", clickEventDescr(x[["event"]]))

isMouseUpEvent.click <- function(x)
        identical("mouseUp", clickEventDescr(x[["event"]]))

leftClick <- function(which = dev.cur(), env = clickenv()) {
    .MM <- matrix(NA_real_, 2, 2)
    Click1 <- click(which, env)
    if (!isMouseDownEvent.click(Click1) ||
        any(buttons.click(Click1) != c(1, 0, 0))) return (.MM)
    Click2 <- click(which, env)
    if (!isMouseUpEvent.click(Click2) ||
        any(!!buttons.click(Click2))) return (.MM)
    t(vapply(list(Click1, Click2), xy.click, double(2)))}

leftClick1 <- function(which = dev.cur(), env = clickenv()) {
    m <- leftClick(which, env)
    if (is.na(m[1]) || any(!!diff(m)))
        matrix(NA_real_, 1, 2) else
        m[1, , drop=F] }
