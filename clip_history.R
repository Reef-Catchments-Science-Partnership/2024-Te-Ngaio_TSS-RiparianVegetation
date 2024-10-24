
# Clipping rasters (.tiff) to vectors (.shp)
# Create function
mask.function <- function(raster, shapefile){ dat <- mask(raster, shapefile)}
# Upload monitoring site polygons (.shp)

# Upload riparian vegetation layer (.tiff)
rast <- rast("D:/DES data/herbert_monthly_fractional cover/lztmre_herbert_202012_dp5a2.tif")

#Upload riparian vegetation buffer (.shp)
riparian <- vect("D:/DES data/Herbert_riparianArea_50m/Herbert_riparianArea_50m.shp")

# Create a list of monitoring site polygons (.shp)
gauge_shp <- list(s1160122, s1160126, s1160127)

# Mask rast to riparian vegetation buffer
fc <- mask(rast,riparian)

# Mask above to the listed monitoring sites 
herb_fpc <- lapply(gauge_shp, mask.function, raster=fc)

# Save to working directory (number applies to list order of gauge_shp)
writeRaster(herb_fpc[[1]], "202012_1160122.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[2]], "202012_1160126.tiff", overwrite=TRUE)
writeRaster(herb_fpc[[3]], "202012_1160127.tiff", overwrite=TRUE)
