# setwd("C:/Users/amith.gurumallapal/Documents/AIHackathon")

library(readr)
HURdat_ExtremeWeatherEvents <- read_csv("HURdat_ExtremeWeatherEvents.csv", 
                                        col_types = cols(ID = col_character(), 
                                                         Initial.Max = col_number(), Jday = col_number(), 
                                                         Latitude = col_number(), Latitude_p = col_number(), 
                                                         Longitude = col_number(), Longitude_p = col_number(), 
                                                         Maximum.Wind = col_number(), Maximum.Wind_p = col_number(), 
                                                         Name = col_character(), Status = col_character(), 
                                                         X1 = col_number(), date_time = col_datetime(format = "%m/%d/%Y %H:%M"), 
                                                         diff = col_number(), i = col_number(), 
                                                         n = col_number(), persistence = col_number(), 
                                                         product = col_number(), rapid_int = col_number(), 
                                                         speed = col_number(), speed_m = col_number(), 
                                                         speed_z = col_number()))


demo <- HURdat_ExtremeWeatherEvents

## Clear view of the dataframe
library(dplyr)
dplyr::glimpse(demo)

##,Feature,enginnering/,Renaming,the,variables

colnames(demo) <- c("X",
                    "ID",
                    "Name",
                    "Status",
                    "Latitude",
                    "Longitude",
                    "Maximum.Wind",
                    "date_time",
                    "diff",
                    "rapid_int",
                    "i",
                    "n",
                    "persistence",
                    "product",
                    "Initial.Max",
                    "speed",
                    "speed_z",
                    "speed_m",
                    "Jday",
                    "Maximum.Wind_p",
                    "Latitude_p",
                    "Longitude_p")

## statistical view of the data
library(psych)
psych::describe(x = demo)

## Plotting the graph

library(leaflet)

m <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=demo$Longitude, lat=demo$Latitude, popup="R")
m  # Print the map

p <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=demo$Longitude_p, lat=demo$Latitude_p, popup="R")
p  # Print the map


s <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng=-84.2, lat=23.2, popup="Danger")
s  # Print the map


library(Amelia)
AmeliaView()
