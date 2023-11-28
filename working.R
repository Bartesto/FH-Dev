library(FireHistory)
library(terra)
library(fs)


# standard query workflow -------------------------------------------------

aoi <- user_aoi("./vectors/albany_ten_diss.shp", name = "albany")

# data <- assemble_dataNEW(fire_path = "./corp_data/DBCA_Fire_History_DBCA_060.shp",
#                          from = 1988, to = 2022, aoi = aoi, accessed_on = "24/04/23")

data <- assemble_data(fire_path = "./dbca_060/DBCA_Fire_History_DBCA_060.shp",
                      FYfrom = 1900, FYto = 2023, aoi = aoi, accessed_on = "02/09/2024")
