#

# Author: Name
# Version: 2020-01-23

# Libraries
library(tidyverse)

# Parameters
  # URL of cities data
url_data <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"
  # Path for raw data
file_raw <- here::here("data-raw/evictions.csv")
  # Path to write cleaned data to
file_out <- here::here("data/evictions.rds")
  # Minimum year to include
YEAR <- 2016
#===============================================================================

# Download raw data
download.file(url_data, file_raw)

file_raw %>%
  read_csv(
    col_types =
      cols_only(
        GEOID = col_integer(),
        year = col_double(),
        name = col_character(),
        evictions = col_double()
      )
  ) %>%
  filter(year == YEAR_MIN) %>%
  rename(geoid = GEOID) %>%
  write_rds(file_out)

