#!usr/bin/make -f

# TODO: check if required packages are availble

all: R_packages data/tidy/mtcars.feather reports/report.html reports/report.pdf

clean: clean_data clean_results clean_reports

clean_data:
	Rscript -e 'setwd(file.path("data", "raw")); suppressWarnings(file.remove(list.files()))'
	Rscript -e 'setwd(file.path("data", "tidy")); suppressWarnings(file.remove(list.files()))'

clean_results:
	Rscript -e 'setwd(file.path("results")); suppressWarnings(file.remove(list.files()))'

clean_reports:
	Rscript -e 'setwd("reports"); suppressWarnings(file.remove("report.html", "report.pdf", "report.md", "report.Rmd"))'
	Rscript -e 'setwd("reports"); unlink("figure", recursive = TRUE)'


.PHONY: all clean clean_data clean_results clean_reports
.DELETE_ON_ERROR:
.SECONDARY:

# Step -1: Check if required packages are installed
R_packages:
	Rscript -e 'stopifnot(c("readr", "feather") %in% installed.packages())'

# Step 0: Download raw data
data/raw/mtcars.csv: scripts/R/get_raw_data.R
	Rscript -e $<

# Step 1: Pre-processing
data/tidy/mtcars.feather: scripts/R/pre_processing.R data/raw/mtcars.csv
	Rscript $<

# Step 2: Validate data

# Step 3: Produce results

# Step 4: Produce reports
reports/report.html: reports/report.md
	Rscript -e 'setwd("reports"); rmarkdown::render("report.md", output_format = "html_document")'

reports/report.pdf: reports/report.md
	Rscript -e 'setwd("reports"); rmarkdown::render("report.md", output_format = "pdf_document")'

reports/report.md: reports/report.Rmd
	Rscript -e 'setwd("reports"); knitr::knit("report.Rmd")'
    
reports/report.Rmd: scripts/R/report.R
	Rscript -e 'file.rename(knitr::spin("$<", knit = FALSE), "$@")'