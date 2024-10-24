
# Clipping rasters (.tiff) to vectors (.shp)
# Create function
mask.function <- function(raster, shapefile){ dat <- mask(raster, shapefile)}

# Upload monitoring site polygons (.shp)
s1160115 <- vect("D:/Core data/site polygons/GDA1994/1160115_GDA1994.shp")
s1160118 <- vect("D:/Core data/site polygons/GDA1994/1160118_GDA1994.shp")
s1160119 <- vect("D:/Core data/site polygons/GDA1994/1160119_GDA1994.shp")
s1160120 <- vect("D:/Core data/site polygons/GDA1994/1160120_GDA1994.shp")
s1160121 <- vect("D:/Core data/site polygons/GDA1994/1160121_GDA1994.shp")
s1160122 <- vect("D:/Core data/site polygons/GDA1994/1160122_GDA1994.shp")
s1160124 <- vect("D:/Core data/site polygons/GDA1994/1160124_GDA1994.shp")
s1160126 <- vect("D:/Core data/site polygons/GDA1994/1160126_GDA1994.shp")
s1160127 <- vect("D:/Core data/site polygons/GDA1994/1160127_GDA1994.shp")
s1160129 <- vect("D:/Core data/site polygons/GDA1994/1160129_GDA1994.shp")
s1160130 <- vect("D:/Core data/site polygons/GDA1994/1160130_GDA1994.shp")
s1160131 <- vect("D:/Core data/site polygons/GDA1994/1160131_GDA1994.shp")
s1160133 <- vect("D:/Core data/site polygons/GDA1994/1160133_GDA1994.shp")
s1160134 <- vect("D:/Core data/site polygons/GDA1994/1160134_GDA1994.shp")

# Upload riparian vegetation layer (.tiff)
rast <- rast("D:/DES data/herbert_monthly_fractional cover/lztmre_herbert_202012_dp5a2.tif")

#Upload riparian vegetation buffer (.shp)
riparian <- vect("D:/DES data/Herbert_riparianArea_50m/Herbert_riparianArea_50m.shp")

# Create a list of monitoring site polygons (.shp)
gauge_shp <- list(s1160115, s1160118, s1160119, s1160120, s1160121, s1160122, s1160124, s1160126, s1160127, s1160129, s1160130, s1160131, s1160133, s1160134)

# Mask rast to riparian vegetation buffer
fc <- mask(rast,riparian)

# Mask above to the listed monitoring sites 
herb_fpc <- lapply(gauge_shp, mask.function, raster=fc)

# Save to working directory (number applies to list order of gauge_shp)
writeRaster(herb_fpc[[1]], "202012_1160115.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[2]], "202012_1160118.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[3]], "202012_1160119.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[4]], "202012_1160120.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[5]], "202012_1160121.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[6]], "202012_1160122.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[7]], "202012_1160124.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[8]], "202012_1160126.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[9]], "202012_1160127.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[10]], "202012_1160129.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[11]], "202012_1160130.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[12]], "202012_1160131.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[13]], "202012_1160133.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[14]], "202012_1160134.tiff", overwrite=TRUE)