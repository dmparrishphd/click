function ( pathname ) {

    `%//%` <- paste0

    source.object <- function ( ... ) source ( ... ) [[ 1 ]]

    # At this stage, the device information is not available.
    # therefore, we cannot provide a complete left-click function.
    # But we can define some of the functionality of a
    # left-click function:
    grEvtEnvMakeEnv <- source.object (
        pathname %//% "/lib/grEvtEnvMakeEnvLoad.R" ) ( pathname )

    env. <- source.object (
        pathname %//% "/lib/envMake.R" ) ( pathname )

    # (See earlier comment.)
    partial. <- source.object ( pathname %//% "/lib/partial.R" )
    partial <- function ( ... ) partial. ( env = env. , ... )

    list (
        grEvtEnvMakeEnv = grEvtEnvMakeEnv ,
        FUN = partial ) }
