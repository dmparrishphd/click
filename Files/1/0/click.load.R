function(mirrors, versiondir="3/0/") {    
    clickEnv <- new.env(parent=as.environment("package:stats"))
    source(local=clickEnv, file=paste0(mirrors,
        "GitHub/dmparrishphd/click/Files/", versiondir,
        "R/click.R"))
    attach(clickEnv) }
