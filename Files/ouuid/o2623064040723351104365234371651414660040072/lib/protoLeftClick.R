function ( pathname ) {

    `%//%` <- paste0

    source.object <- function ( ... ) source ( ... ) [[ 1 ]]

    # AT THIS STAGE, THE DEVICE INFORMATION IS NOT AVAILABLE.
    # THEREFORE, WE CANNOT PROVIDE A COMPLETE LEFT-CLICK FUNCTION.
    grEvtEnvMakeEnv <- source.object ( pathname %//% "/lib/grEvtEnvMakeEnvLoad.R" ) ( pathname )

    env. <- source.object ( pathname %//% "/lib/envMake.R" ) ( pathname )

    # AT THIS STAGE, THE DEVICE INFORMATION IS NOT AVAILABLE.
    # THEREFORE, WE CANNOT PROVIDE A COMPLETE LEFT-CLICK FUNCTION.
    partial. <- source.object ( pathname %//% "/lib/partial.R" )
    partial <- function ( ... ) partial. ( env = env. , ... )

    list (
        grEvtEnvMakeEnv = grEvtEnvMakeEnv ,
        FUN = partial ) }
