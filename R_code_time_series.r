# Time series analysis: analisi multitemporale dei cambiamenti nel tempo tramite map overlay
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
library(raster)

# Impostazione della directory di lavoro
setwd("C:/lab/greenland")

# Funzione "raster" per caricare un pacchetto di dati, creare un oggetto formato da diversi layer di dati raster
lst_2000<-raster("lst_2000.tif")

# Visualizzare caratteristiche file
lst_2000

# Visualizzare il file
plot(lst_2000)

# Caricare tutti i dati raster della cartella "greenland"
lst_2000<-raster("lst_2000.tif")
lst_2005<-raster("lst_2005.tif")
lst_2010<-raster("lst_2010.tif")
lst_2015<-raster("lst_2015.tif")

# Creare un multipanel con le 4 immagini con la funzione "par"
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Creare una lista di file con la funzione list.files
# Argomento "pattern" della funzione: permette di cercare i file di interesse tramite il loro nome
rlist<-list.files(pattern="lst")
rlist

# Importare i file tutti insieme
# Funzione "lapply": permette di applicare una certa funzione a una lista di file (rlist)
# Applicare la funzione raster a tutti i file della lista rlist
lapply(rlist, raster)
import<-lapply(rlist, raster)

# Creare uno stack: pacchetto di dati raster originariamente separati, in questo caso multitemporali
# Ogni strato rappresenta una stima della temperatura della superficie terrestre che deriva dal programma Corpernicus
TGr<-stack(import)
plot(TGr)

# Plot RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
