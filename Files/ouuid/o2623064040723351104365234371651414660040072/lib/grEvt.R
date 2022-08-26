# event
# ID: [___]
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
function ( env ) {
    ENVIR0 <- setGraphicsEventEnv ( env = env )
    EVENT.DESCRIPTION <- getGraphicsEvent ()
    if ( is.null ( ENVIR0 ) ) {
        do.call ( setGraphicsEventHandlers , list () )
    } else {
        setGraphicsEventEnv ( env = ENVIR0 )
    }
    EVENT.DESCRIPTION }
