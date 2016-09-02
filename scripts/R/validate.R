library(magrittr)
library(dplyr)
library(assertr)

source(file.path("scripts", "R", "globals.R"))

# Load data
data <- read_csv(file.path(RAW_DATA_DIR, "mtcars.csv"))

# Validate data
data <- data %>% 
        # Admissible values
        assert(not_na(everything())) %>% 
        assert(within_bounds(0, Inf), everything()) %>% 
        assert(in_set(c(0, 1)), vs, am)