library(sp)

getClass("Spatial")
getClass("CRS")

# Building a spatial object

m=matrix(c(0,0,1,1), 
         ncol = 2, 
         dimnames = list(NULL,c("min","max")))

crs = CRS(projargs = as.character(NA))
crs

s = Spatial(bbox = m, proj4string = crs)
s

## Spatial points

CRAN_df = read.table("CRAN051001a.txt",header = T)

CRAN_mat = cbind(CRAN_df$long, CRAN_df$lat)

rownames(CRAN_mat) = 1:nrow(CRAN_mat)

str(CRAN_mat)

getClass("SpatialPoints")

llCRS = CRS("+proj=longlat +ellps=WGS84")

CRAN_sp = SpatialPoints(CRAN_mat, proj4string = llCRS)

summary(CRAN_sp)

# Methods

bbox(CRAN_sp)

proj4string(CRAN_sp)

proj4string(CRAN_sp)=CRS(as.character(NA))

proj4string(CRAN_sp)
proj4string(CRAN_sp) = llCRS

brazil = which(CRAN_df$loc == "Brazil")
brazil

# getting coordinates of brazil

coordinates(CRAN_sp)[brazil,]

summary(CRAN_sp[brazil,])

# south of equator
south_of_equator = which(coordinates(CRAN_sp)[,2] < 0)

summary(CRAN_sp[-south_of_equator,])

# Data Frames for Spatial Point Data

str(row.names(CRAN_df))

CRAN_spdf1 = SpatialPointsDataFrame(CRAN_mat, CRAN_df,proj4string = llCRS, match.ID = TRUE)

CRAN_spdf1[4,]

str(CRAN_spdf1$loc)


library(maps)
library(maptools)

japan = map("world","japan",plot = FALSE)

p4s = CRS("+proj=longlat +ellps=WGS84")

SLjapan = map2SpatialLines(japan,proj4string = p4s)

str(SLjapan, max.level = 2)

lines_len = sapply(slot(SLjapan, "lines"), function(x) length(slot(x, "Lines")))

table(lines_len)

volcan_sl = ContourLines2SLDF(contourLines(volcano))
t(slot(volcan_sl, "data"))

llCRS <- CRS("+proj=longlat +ellps=WGS84")
auck_shore <- MapGen2SL("auckland_mapgen.dat", llCRS)
summary(auck_shore)
































