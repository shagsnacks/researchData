### Change to whatever directory ###
setwd("~/TerrorismData/TIF")

### Load the libraries ###
library(raster)
library(usdm)

### Create a list of rasters in the working directory ###
rlist=list.files(getwd(), pattern="tif$", full.names=FALSE)
for(i in rlist) { assign(unlist(strsplit(i, "[.]"))[1], raster(i)) }

### Stack the rasters ###
rstack <- stack(rlist)

### Run Variance Inflation Factor on the stacked raster ###
vifSoil <- vif(rstack)