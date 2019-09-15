# click
Capture mouse clicks in R

## Installation

Download the .tar.gz file.

Unzip the tar file.

Extract the contents of the tar file to the directory `SOURCE`, where `SOURCE` is a path, including the final path separator.

Start a fresh R session.

Execute

    install.packages(
	      pkgs=paste0(SOURCE, "click"),
	      lib=LIB,
	      repos=NULL,
	      method="internal",
	      type="source",
	      verbose=T)
  
where `LIB` is a value that makes sense on your system (see `?install.packages`).

## Usage

    library(package="click", lib=LIB, character.only=T)

    ?click

(Read the Examples.)
