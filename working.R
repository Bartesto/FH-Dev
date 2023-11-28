library(FireHistory)
library(terra)
library(fs)
library(here)


# standard query workflow -------------------------------------------------

aoi <- user_aoi("./vectors/albany_ten_diss.shp", name = "albany")

# data <- assemble_dataNEW(fire_path = "./corp_data/DBCA_Fire_History_DBCA_060.shp",
#                          from = 1988, to = 2022, aoi = aoi, accessed_on = "24/04/23")

data <- assemble_data(fire_path = "./dbca_060/DBCA_Fire_History_DBCA_060.shp",
                      FYfrom = 1900, FYto = 2023, aoi = aoi, accessed_on = "02/09/2024")


# new work ----------------------------------------------------------------

# function to construct annual raster product folders
bq_create_folders <- function(aoi, choice = 1:3){
  cli::cli_progress_step("Creating Folder Structure")
  # set up folder names
  aoi_n <- aoi$aoi_name
  anf_fol <-here::here(aoi_n, "01_annual_fires")
  yob_fol <- here::here(aoi_n,"02_year_of_burn")
  yslb_fol <- here::here(aoi_n,"03_year_since_last_burn")
  wfm_fol <- here::here(aoi_n,"04_wild_fire_masks")
  ofm_fol <- here::here(aoi_n,"04_other_fire_masks")
  wffa_fol <- here::here(aoi_n,"05_wild_fire_fuel_age")
  offa_fol <- here::here(aoi_n,"05_other_fire_fuel_age")
  
  # vector of names
  fols <- c(anf_fol, yob_fol, yslb_fol, wfm_fol, ofm_fol, wffa_fol, offa_fol)
  fols_to_do <- fols[choice]
  fs::dir_create(fols_to_do)
  return(fols_to_do)
}

folders <- bq_create_folders(aoi, choice = c(1:7))


