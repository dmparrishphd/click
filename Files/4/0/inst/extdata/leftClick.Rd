\name{leftClick}

\alias{leftClick}
\alias{leftClick1}

\title{Capture a specific mouse event from a graphics window.}

\description{
    Capture combinations of a "press" and "release" mouse
    events.}
\usage{
leftClick(which=dev.cur(), env=clickenv())
leftClick1(which=dev.cur(), env=clickenv())
}
\arguments{
    \item{which}{the device from which to capture the event}
    \item{env}{
        an \code{environment} compatible with
        \code{setGraphicsEventEnv}.}
}
\value{
    A \code{double matrix} containing
    one (in the case of \code{leftClick1}) or
    two (in the case of \code{leftClick}) rows,
    whose columns correspond to
    the x- and y-coordinates of the event.

    If some other type of event was captured,
    the return will contain \code{NA_real_} values.
}
\details{
    \code{leftClick1} is designed to capture a single point.
    If mouse movement is detected,
    the return will contain \code{NA_real_} values.
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
dev.new()
plot(1)
env <- clickenv()
leftClick(env=env)
leftClick1(env=env)
}
\seealso{
\code{\link{clicks-package}}
\code{\link{click-package}}
\code{\link{getGraphicsEvent}},
}
\keyword{ device }
\keyword{ IO }
