# R_code_copernicus.r
# Visualizzare dati copernicus

# Library necessarie
# install.packages("raster")
# install.packages ("ncdf4")
library(raster)
library(ncdf4)

# Impostazione della directory di lavoro
setwd("C:/lab/")

# Importare i dati con la funzione raster perché si importa un singolo layer
# Raggruppare i dati di Lake Water Quality in LWQ
# Digitare LWQ per visualizzare le informazioni relative allo strato caricato
LWQ<-raster("c_gls_LWQ1km_201808210000_GLOBE_OLCI_V1.2.nc")
LWQ

# Scegliere la scala di colori 
# Plot della variabile
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(LWQ, col=cl)

# Resampling: aggregare i pixel dell'immagine in un pixel più grande, di dimensioni definite, per ridurre il numero di pixel dell'immagine, facendo una media di tutti i valori dei pixel all'intero del nuovo pixel 
# Argomento "fact" per ridefinire il numero di pixel
LWQres<-aggregate(LWQ, fact=100)

# Plot del dato ricampionato
plot(LWQres, col=cl)
