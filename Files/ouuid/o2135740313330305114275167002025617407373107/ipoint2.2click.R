function ( pathname ) {

    `%//%` <- paste0

    LIB <- pathname %//% "/lib"

    En <- new.env ( parent = baseenv() )

    En $ inearest <- source ( LIB %//% "/inearest.R" ) [[ 1 ]]
    environment ( En $ inearest ) <- baseenv()

    En $ usr.indie <- source ( LIB %//% "/usr.indie.R" ) [[ 1 ]]
    environment ( En $ usr.indie ) <-
            as.environment ( "package:graphics" )

    En $ metaLeftClickList <- source (
        LIB %//% "/protoLeftClick.R" ) [[ 1 ]] ( LIB )

    En $ ipoint.click <- source ( LIB %//% "/ipoint.click.R" ) [[ 1 ]]
    environment ( En $ ipoint.click ) <- En

    En $ envMake <- function () with (
        metaLeftClickList $ grEvtEnvMakeEnv ,
        grEvtEnv ( HANDLERS ) )
    environment ( En $ envMake ) <- En
    
    ipoint2.2click <- source ( LIB %//% "/ipoint2.2click.R" ) [[ 1 ]]
    environment ( ipoint2.2click ) <- En

    ipoint2.2click }
