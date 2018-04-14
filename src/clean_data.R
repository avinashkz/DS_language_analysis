suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("stringr"))

# Read in raw data
survey <- read.csv("data/survey_responses.csv", stringsAsFactors = FALSE)[-c(1,2)] 

# Change column names
names(survey) <- c("background", "coding_experience", "coding_love", "first_language", 
                   "language_preference", "task_preference", "active_languages")

# Aggregate background and first_language variables
survey <- survey %>% 
  rowwise() %>% 
  mutate(background = ifelse(background %in% c("Computer Science / Computer Engineering", "Mathematics / Statistics"), background, 
                             ifelse(sum((str_detect(tolower(background), c("economics", "business", "finance")))) > 0 , "Business / Economics",
                                    ifelse((str_detect(tolower(background), "eng")), "Engineering", "Other")
                             ))) %>% 
  mutate(first_language = ifelse(first_language %in% c("Python", "R", "Matlab", "SAS", "C", "Java"), first_language, "Other"))

# Write cleaned data into csv file
write.csv(survey, "docs/survey_results_clean.csv", row.names = FALSE)