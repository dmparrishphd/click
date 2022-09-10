function ( pathname ) {
    SRC <- paste0 ( pathname , "/lib/protoLeftClick.R" )
    LIST <- source ( SRC ) [[ 1 ]] ( pathname )
    grEvtEnv <- with (
        LIST $ grEvtEnvMakeEnv ,
        grEvtEnv ( HANDLERS ) )
    function ( ... ) LIST $ FUN ( grEvtEnv , ... ) }
