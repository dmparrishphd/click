# grEvtEnv
# ID: [___]
# Copyright 2022 D. Michael Parrish
# This work is licensed under AGPL-3,
# <https://www.gnu.org/licenses/agpl-3.0.html>
function ( graphicsEventHandlers ) {
    hSet <- setGraphicsEventHandlers
    ENVIR.ORIG <- do.call ( hSet , graphicsEventHandlers )
    ENVIR      <- do.call ( hSet , graphicsEventHandlers )
    # RESTORE STATE:---
    if ( is.null ( ENVIR.ORIG ) ) do.call (
        hSet , list ()
    ) else setGraphicsEventEnv (
        which = dev.cur () , env = ENVIR.ORIG
    )
    ENVIR }
