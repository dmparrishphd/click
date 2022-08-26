# leftClickGrEvtEnvMakeLoad
# ID: {id}
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
function ( pathname ) {

    Env <- new.env ( parent = as.environment ( "package:grDevices" ) )

    `%//%` <- paste0

    source.object <- function ( file )
            source ( file = file , local = Env ) [[ 1 ]]

    Env $ grEvtEnv  <- source.object ( pathname %//% "/lib/grEvtEnv.R" )

    Env $ HANDLERS  <- source.object ( pathname %//% "/lib/handlers.R" )
    Env $ HANDLERS $ onMouseMove <- NULL

    environment ( Env $ grEvtEnv  ) <- Env

    Env }
