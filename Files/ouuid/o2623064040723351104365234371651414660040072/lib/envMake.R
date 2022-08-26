# leftClickEnvMake
# ID: {id}
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
function ( pathname ) {

    Env <- new.env ( parent = as.environment ( "package:grDevices" ) )

    `%//%` <- paste0

    source.object <- function ( file )
            source ( file = file , local = Env ) [[ 1 ]]

    Env $ grEvt   <- source.object ( pathname %//%  "/lib/grEvt.R" )
    Env $ nullEvt <- source.object ( pathname %//% "/lib/nullEvt.R" )

    environment ( Env $ nullEvt ) <- Env
    environment ( Env $ grEvt   ) <- Env

    Env }
