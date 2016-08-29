source(file.path("scripts", "R", "globals.R"))

require(readr)
data(mtcars)
write_csv(mtcars, file.path(RAW_DATA_DIR, "mtcars.csv"))
