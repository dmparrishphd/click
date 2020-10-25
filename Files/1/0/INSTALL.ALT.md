Installation Alternative
=======================

Installation (in the sense of `install.packages`) is not necessary.
Rather, you may load and attach `click` from source using a process such as:

    (function(mirrors, versiondir) source(paste0(mirrors, "GitHub/",
        "dmparrishphd/click/Files/1/0/click.load.R"))[[1]](mirrors, versiondir)	
    )("~/Mirrors/", "3/0/")
    
where `"~/Mirrors/"` is the path to `"GitHub/dmparrishphd/click/"`.

See also
[click.load.R](https://github.com/dmparrishphd/click/blob/master/Files/1/0/click.load.R).
