build <- function ( lib , collate = "0/1.csv" ) {
	Envv <- list ( Endo = new.env ( parent = as.environment ( "package:graphics" ) ) )
	Envv $ Exo <- new.env ( parent = Envv $ Endo )
	EXDAT <- "/inst/extdata"
	COLLATE <- read.csv ( paste0 ( lib , EXDAT ,"/csv/0/collate/", collate ) )
	for ( i in seq_len ( nrow ( COLLATE ) ) ) {
		Row <- COLLATE [ i , ]
		source (
			file = paste0 ( lib , EXDAT , "/R/" , Row $ WHAT ) ,
			local = Envv [[ Row $ WHERE ]] ) }
	Envv $ Exo }
