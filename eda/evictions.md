South Carolina evictions
================
Sara Altman
2020-01-23

  - [Which city had the most evictions in
    2016?](#which-city-had-the-most-evictions-in-2016)

``` r
# Libraries
library(tidyverse)

# Parameters
file_data <- here::here("data/evictions.rds")
#===============================================================================

df <- read_rds(file_data)
```

## Which city had the most evictions in 2016?

``` r
df %>% 
  top_n(1, wt = evictions)
```

    ## # A tibble: 1 x 4
    ##     geoid  year name             evictions
    ##     <int> <dbl> <chr>                <dbl>
    ## 1 4550875  2010 North Charleston     2038.
