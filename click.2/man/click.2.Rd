\name{click}
\alias{click}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Wait for a mouse or keyboard event from a graphics window.}
\description{Capture a "press" or "release" mouse event or keyboard event from a device.}
\usage{click(which=dev.cur(), option="")}
\arguments{
    \item{which}{the device from which to capture the event}
    \item{option}{
        an \code{environment} compatible with \code{setGraphicsEventEnv},
        the \code{character} string \code{""}, or
        the \code{character} string \code{"handler"}.} }
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    Provided that \code{which} is valid: if \code{option} is a valid \code{environment} or \code{""},
    A \code{vector} containing elements corresponding with
    \item{event}{
        a code indicating the event type: 0: NULL, 1: UP, 2: DOWN, 4: MOVE, "8": KEYBOARD.
    }
    \item{key}{
        the character string received from the underlying keyboard event handler or \code{NA}
        if the event was not a keyboard event.
    }
    \item{x and y}{
        The x- and y-coords returned from the underlying mouse event handler or
        \code{NA} if the event was not a mouse event.
    }
    \item{b0, b1, and b2}{
        Codes indicating whether, at the event, mouse buttons 0, 1, and 2 were in the pressed (1) or released (0) state, or
        \code{NA} if the event was not a mouse event.
    }
    if \code{option} is \code{"handler"}, the default \code{environment} suitable for use as the \code{option} argument in future calls.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
D. Michael Parrish
}

\section{Warning}{Using the return after a device is resized or
otherwise altered will likely have a result that is difficult to
interpret.}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as 
\code{\link{click.2-package}}
\code{\link{getGraphicsEvent}},
}
\examples{
dev.new()
plot(1)
click()
list(click(), click())
env <- click(o="handler")
click(o=env)
}
\keyword{ device }
\keyword{ IO }
