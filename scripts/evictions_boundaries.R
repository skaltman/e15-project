# Joins boundary and evictions data for South Carolina cities in 2016

# Author: Sara Altman
# Version: 2020-01-23

# Libraries
library(tidyverse)

# Parameters
  # File with city boundaries
file_boundaries <- here::here("data/boundaries.rds")
  # File with evictions data
file_evictions <- here::here("data/evictions.rds")
  # Output file
file_out <- here::here("data/evictions_boundaries.rds")
#===============================================================================

read_rds(file_boundaries) %>%
  select(-name) %>%
  left_join(
    read_rds(file_evictions),
    by = "geoid"
  ) %>%
  select(geoid, year, name, evictions) %>%
  write_rds(file_out)

