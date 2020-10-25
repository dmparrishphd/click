\name{click}

\alias{click}

\title{Wait for a mouse click or keypress event from a graphics window.}

\description{
    Capture a keypress event or a "press" or "release" mouse event
    from a device.}
\usage{click(which=dev.cur(), env=clickenv(which))}
\arguments{
    \item{which}{
        the device from which to capture the event}
    \item{env}{
        an \code{environment} compatible with \code{setGraphicsEventEnv}}}
\value{
    A \code{vector} containing elements corresponding with
    \item{event}{
        a code indicating the event type:
        1 ("mouseUp", mouse button release),
        2 ("mouseDown", mouse button press),
        3 ("mouseMove", mouse move), 
        "4" "keybd" (keypress).
        See also \code{clickEventDescr}.}
    \item{key}{
        the character string received from the underlying
        keyboard event handler or
        \code{NA} if the event was not a keypress event.
    }
    \item{x and y}{
        The x- and y-coords returned from the underlying mouse event handler or
        \code{NA} if the event was not a mouse event.
    }
    \item{b0, b1, and b2}{
        1) Codes indicating whether, at the event, mouse buttons 0,
        1, and 2 were in the pressed (1) or released (0) state,
        or 2) \code{NA} if the event was not a mouse event.
    }
}
\details{
    The return will be a \code{double vector} for a mouse event
    and a \code{character vector} for a keypress event.
}
\references{
}
\author{
D. Michael Parrish
}

\section{Warning}{
    Using the return after a device is resized or otherwise
    altered will likely have a result that is difficult to
    interpret.}
\examples{
}
\seealso{
\code{\link{click-package}}
\code{\link{getGraphicsEvent}},
}
\keyword{ device }
\keyword{ IO }
