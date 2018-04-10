suppressPackageStartupMessages(library("googlesheets"))
suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("readr"))


main <- function() {

my_sheets <- gs_ls()
title <- gs_title(my_sheets$sheet_title)
responses <- gs_read(title)
write_csv(x = responses, path = "data/survery_responses.csv")
names(responses) <- c("timestamp", "agreement", "academics", "experience", "attitude", "first_language", "preference", "task", "active_use")
write_csv(x = responses, path = "docs/survery_responses.csv")

}

# call main function
main()