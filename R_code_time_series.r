# Time series analysis: analisi multitemporale dei cambiamenti nel tempo tramite map overlay
# Greenland increase of temperature
# Data and code from Emanuela Cosma

# install.packages("raster")
library(raster)

# install.packages("rasterVis")
library("rasterVis")

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
import

# Creare uno stack: pacchetto di dati raster originariamente separati, in questo caso multitemporali
# Ogni strato rappresenta una stima della temperatura della superficie terrestre che deriva dal programma Corpernicus
TGr<-stack(import)
plot(TGr)

# Plot RGB
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")

# levelplot
# Funzione "levelplot": levelplot di oggetti raster. Riporta in un grafico un raster multilayer con una legenda e organizzazione grafica migliore rispetto alla funzione "plot"
levelplot(TGr)

# levelplot di un singolo strato dello stack unico richiamato con $
levelplot(TGr$lst_2000)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

# Cambiare la color ramp palette
# Riplottare il levelplot specificando altri argomenti della funzione
# Argomento "col.regions": per indicare la color ramp palette da applicare
# Argomento "names.attr": riporta nel grafico il nome di ogni attributo del file raster
# Argomento "main": attribuisce un titolo al plot
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
levelplot(TGr, col.regions=cl)
levelplot(TGr,col.regions=cl, names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))
levelplot(TGr,col.regions=cl, main="LST variation in time",
          names.attr=c("July 2000","July 2005", "July 2010", "July 2015"))

# Analisi dati raster sullo scioglimento dei ghiacci in Groenlandia
# Creare una lista di file
mlist<-list.files(pattern="melt")
mlist

# lapply per applicare la funzione raster alla lista di file
lapply(mlist, raster)
melt_greenland<-lapply(mlist, raster)
melt_greenland

# Creare uno stack in cui ogni livello rappresenta il livello di scioglimento dei ghiacci in un determinato anno sulla base dell'assorbimento delle microonde
melt <- stack(melt_greenland)
melt

# Plot e levelplot
plot(melt)
levelplot(melt)

melt_amount <- melt$X2007annual_melt - melt$X1979annual_melt
melt_amount
clb <- colorRampPalette(c("blue","white","red"))(100)
plot(melt_amount, col=clb)
levelplot(melt_amount, col.regions=clb)
 

