Installation
============

Download
--------

Download one or more
[packages or protopackages](https://github.com/dmparrishphd/click/blob/master/Files/1/0/index.md).
 
Install
-------

The download (or extracted download) should be in the directory `SOURCE`,
where `SOURCE` is a path, _including) the final path separator (e.g., `/`).

Start a fresh R session. Execute

    install.packages(
	      pkgs=paste0(SOURCE, "click"),
	      lib=LIB,
	      repos=NULL,
	      method="internal",
	      type="source",
	      verbose=T)

where `LIB` is a value that makes sense on your system (see `?install.packages`).

Usage
-----

    library(package="click", lib=LIB, character.only=T)

    ?click

(Read the Examples.)
