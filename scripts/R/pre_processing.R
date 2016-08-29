source(file.path("scripts", "R", "globals.R"))

library(feather)
library(readr)

data <- read_csv(file.path(RAW_DATA_DIR, "mtcars.csv"))
write_feather(data, file.path(TIDY_DATA_DIR, "mtcars.feather"))