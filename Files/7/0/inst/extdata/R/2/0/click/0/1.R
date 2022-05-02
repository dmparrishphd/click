click <- function (
        which = dev.cur () ,
        Env = env ( which ) ,
        query = "" ,
        queryArgs = list () ) {
    if ( is.character ( query ) && length ( query ) == 1 && nchar ( query ) ) {
        Env <- parent.env ( parent.env ( environment ( function () {} ) ) )
        return ( do.call ( Env [[ query ]] , queryArgs ) ) }
    dev.set ( which )
    ENV.SAVED <- getGraphicsEventEnv ( which = which )
    setGraphicsEventEnv ( which = which , env = Env )
    EVENT <- getGraphicsEvent ()
    if ( ! is.null ( ENV.SAVED ) )
            setGraphicsEventEnv (
                which = which ,
                env = ENV.SAVED )
    EVENT }
