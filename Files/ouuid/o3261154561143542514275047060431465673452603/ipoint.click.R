function ( pathname ) {

    `%//%` <- paste0

    LIB <- pathname %//% "/lib"

    En <- new.env ( parent = baseenv() )
    Ex <- new.env ( parent = En )

    En $ inearest <- source ( LIB %//% "/inearest.R" ) [[ 1 ]]
    environment ( En $ inearest ) <- baseenv()

    En $ usr.indie <- source ( LIB %//% "/usr.indie.R" ) [[ 1 ]]
    environment ( En $ usr.indie ) <-
            as.environment ( "package:graphics" )

    PATHMLC <- LIB %//% "/o26230640"

    En $ metaLeftClickList <- source (
        PATHMLC %//% "/lib/protoLeftClick.R" ) [[ 1 ]] ( PATHMLC )

    ipoint.click <- source ( LIB %//% "/ipoint.click.R" ) [[ 1 ]]
    environment ( ipoint.click ) <- En

    En $ envMake <- function () with (
        metaLeftClickList $ grEvtEnvMakeEnv ,
        grEvtEnv ( HANDLERS ) )
    environment ( En $ envMake ) <- En

    ipoint.click }
