# Description

# Author: Sara Altman
# Version: 2020-01-23

# Libraries
library(tidyverse)

# Parameters
  # URL of cities data
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"
  # Path for raw data
file_raw <- here::here("data-raw/boundaries.csv")
  # Path to write cleaned data to
file_out <- here::here("data/boundaries.rds")
#===============================================================================

download.file(url_data, destfile = file_raw)

sf::read_sf(url_geojson) %>%
  mutate(GEOID = as.integer(GEOID)) %>%
  select(geoid = GEOID, name = n) %>%
  write_rds(file_out)


