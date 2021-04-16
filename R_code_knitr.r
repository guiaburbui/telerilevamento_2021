# R_code_knitr.r
# Impostazione della working directory
setwd("C:/lab")

# Caricare il pacchetto knitr
library(knitr)

# Funzione stitch 
# Contiene vari argomenti: nome del file con il codice da utilizzare; directory che contiene il codice; template da utilizzare; nome del pacchetto da utilizzare
stitch("R_code_greenland.r", template=system.file("misc", "knitr-template.Rnw", package="knitr"))
