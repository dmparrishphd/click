\name{clickenv}

\alias{clickenv}

\title{Get a Graphics Event Environment for Capturing Mouse
    Clicks and Keypress Events.}

\description{(See title)}
\usage{clickenv(which=dev.cur())}
\arguments{
    \item{which}{
        the device to make current and to use in creating a
        graphics event environment.} }
\details{
}
\value{
    The default \code{environment} suitable for use as the
    \code{env} argument of future calls to \code{click} on the
    specified device.
}
\references{
}
\author{
D. Michael Parrish
}
\seealso{
\code{\link{click-package}}
\code{\link{getGraphicsEvent}},
}
\examples{
# (See Examples in click-package)
}
\keyword{ device }
\keyword{ IO }
