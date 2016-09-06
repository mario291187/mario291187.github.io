library(data.table)
library(RJSONIO)

## Read in data
#data <- fread("Refugiosgeoref-Sonora.csv")
data <- fread("Refugiosgeoref-Sinaloa.csv")
## Clean data
data_clean <- data[,c(2, 5, 18, 19), with = FALSE]
data_clean <- na.omit(data_clean)

## Construct map body
map <- list("type" = "geojson",
           "data" = list("type" = "FeatureCollection"))

## Construct features
features <- list()
for(i in 1:nrow(data_clean)){
    name    <- paste0("<strong>", data_clean$Refugio[i], "</strong>")
    direcc  <- paste0("<p>", data_clean$Dirección[i], "</p>")
    desc    <- paste0(name, direcc)
    feature <- list("type" = "Feature",
                   "properties" = list(
                       "description" = desc,
                       "icon" = "circle"
                   ),
                   "geometry" = list(
                       "type" = "Point",
                       "coordinates" = c(data_clean$longitude[i], data_clean$latitude[i])
                   )
                   )
    features[[i]] <- feature
}

## Add to map
map$data$features <- features

## Save results
exportJson <- toJSON(map)
write(exportJson, "sinaloa.json")
