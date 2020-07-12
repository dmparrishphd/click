\name{click}
\alias{click}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Wait for a mouse or keyboard event from a graphics window.
}
\description{
Capture a "press" or "release" mouse event or keyboard event from a device.
}
\usage{
click(which=dev.cur(), env=NULL, getHandler=F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{which}{the device from which to capture the event
  }
  \item{env}{an environment compatible with
      \code{setGraphicsEventEnv}. Such an environment is produced internally by
      \code{click::makeGraphicsEventHandlersStd}.
  }
  \item{getHandler}{setting to \code{TRUE} will cause \code{click} to return the default GraphicsEventHandler
      rather than capture an event. The return can be used later as the \code{env} argument.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
    A \code{vector} containing elements corresponding with
    \item{EVENT}{
        a code indicating the event type: 0: NULL, 1: UP, 2: DOWN, 4: MOVE, "8": KEYBOARD.
    }
    \item{KBD}{
        the character string received from the underlying keyboard event handler or \code{NA_real_}
        if the event was not a keyboard event.
    }
    \item{X and Y}{
        The x- and y-coords returned from the underlying mouse event handler.
        \code{NA_real_} if the event was not a mouse event.
    }
    \item{B0, B1, and B2}{
        Codes indicating whether, at the event, mouse buttons 0, 1, and 2 were in the pressed (1) or released (0) state.
        \code{NA_real_} if the event was not a mouse event.
    }
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
}
\keyword{ device }
\keyword{ IO }
