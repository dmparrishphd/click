function ( pathname ) {

    Env <- new.env (
        parent = as.environment ( "package:grDevices" ) )

    source.object <- function ( file )
            source ( file = paste0 ( pathname , "/" , file ) , local = Env ) [[ 1 ]]

    Env $ grEvtEnv  <- source.object ( "grEvtEnv.R" )

    Env $ HANDLERS  <- source.object ( "handlers.R" )

    environment ( Env $ grEvtEnv  ) <- Env

    Env }
