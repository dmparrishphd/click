\name{buttons.click}

\alias{buttons.click}
\alias{xy.click}

\title{Extract information from a click.}
\description{Extract the (x, y) pair or buttons of a click}
\usage{
buttons.click(x)
xy.click(x)
}
\arguments{
    \item{x}{An object returned from \code{click}}}
    \value{
        A \code{vector} containing elements corresponding with
        the x-y coordinates of the click or the buttons of the
        click.
}
\author{
    D. Michael Parrish
}
\section{Warning}{
    Using the return of \code{xy.click} after a device is
    resized or otherwise altered will likely have a result that
    is difficult to interpret.}
\examples{
mock.click <- c(x=1, y=2)
xy.click(mock.click)
mock.click2 <- c(b0=0, b1=1, b2=0)
buttons.click(mock.click2)
}
\seealso{
\code{\link{clicks-package}},
\code{\link{click-package}}
}
\keyword{ device }
\keyword{ IO }
