setwd("E:/Exe lesson -3")
getwd()
datdir <- file.path("data")
datdir <- "data"
library(rasta)

## Packages for Reading/Writing/Manipulating Spatial Data
library(rgdal) 
library(rgeos) # vector manipulations
library(maptools) # mapping
library(spdep) # useful spatial stat functions
library(spatstat) # functions for generating random points
library(raster) # raster data analysis
## Packages for Data Visualization and Manipulation
library(ggplot2) # plotting
library(reshape2) # preparing your data
library(scales)
library(raster)

## download the kenya shape file 
download.file("http://rasta.r-forge.r-project.org/kenyashape.zip",
              file.path(datdir, "kenyashape.zip"))
unzip(file.path(datdir, "kenyashape.zip"), exdir= datdir)
kenya <- readOGR(dsn = datdir, layer = "kenya")
plot(kenya)
##READ RASTER
gc<- raster("data/croppedkenya.tif")
plot(gc)
## GENERATE RANDOM POINTS
##create boundary box of the kenya raster
win <- bbox(kenya)
win
#the bounding box around the Kenya raster
win <- t(win)
win
#transpose the bounding box matrix
win <- as.vector(win)
win
########################### randon #########################################################
dran1 <- runifpoint(30, win = as.vector(t(bbox(kenya))))
plot(dran1)
####################################### sample ##########################################################
## generate random sample of size 30
dra1<-sampleRandom(gc, 25, na.rm=TRUE, win = as.raster(t(win)))
plot(dra1)
######################################### random ###########################################################
plot(kenya)
win <- extent(kenya)
dran1 <- runifpoint(n = 30, win = as.vector(win))
plot(dran1, add = TRUE, col = "red")
###
dran2 <- runifpoint(n = 30, win = as.vector(win))
plot(dran2, add = TRUE, col = "blue", pch = 19, cex = 0.5)
##CONVERT RANDOM POINTS TO DATA.FRAME
dp <- as.data.frame(dran2)
################################# sample ###############################################################
plot(gc)
win <- extent(kenya)
dra1 <- runifpoint(n = 30, win = as.vector(win))
plot(dran1, add = TRUE, col = "red")
###
dra2 <- runifpoint(n = 30, win = as.vector(win))
plot(dra2, add = TRUE, col = "blue", pch = 19, cex = 0.5)
##CONVERT RANDOM POINTS TO DATA.FRAME
dp <- as.data.frame(dra2)
