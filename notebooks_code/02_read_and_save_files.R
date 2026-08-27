# Force project root in GitHub Actions
if (nzchar(Sys.getenv("GITHUB_WORKSPACE"))) {
  setwd(Sys.getenv("GITHUB_WORKSPACE"))
}

getwd() |> message()


library(readxl)
library(writexl)
library(here)
library(readr)
library(dplyr)

# Read the vocabulary data

# Directly from the server

df_vocabulary_general <- read_excel(path = here("data/raw_results/lanupro_vocabulary_general.xlsx"), sheet = "vocabulary")
df_vocabulary_fatty_acids <- read_excel(path = here("data/raw_results/lanupro_vocabulary_fatty_acids.xlsx"), sheet = "vocabulary")
df_vocabulary_incubations <- read_excel(path = here("data/raw_results/lanupro_vocabulary_incubations.xlsx"), sheet = "vocabulary")



# Processing If needed

# Drop columns that are entirely empty (all NA, or all blank strings)
# so no empty columns get saved to the processed data
drop_empty_columns <- function(df) {
  is_empty_col <- function(col) {
    all(is.na(col) | (is.character(col) & trimws(col) == ""))
  }
  df |> select(where(~ !is_empty_col(.x)))
}

#df_vocabulary_general <- drop_empty_columns(df_vocabulary_general)
#df_vocabulary_fatty_acids <- drop_empty_columns(df_vocabulary_fatty_acids)
#df_vocabulary_incubations <- drop_empty_columns(df_vocabulary_incubations)


# Save the vocabulary data to .tsv files
# For excel power query and for version control

write_tsv(df_vocabulary_general, "data/processed/lanupro_vocabulary_general.tsv")
write_tsv(df_vocabulary_fatty_acids, "data/processed/lanupro_vocabulary_fatty_acids.tsv")
write_tsv(df_vocabulary_incubations, "data/processed/lanupro_vocabulary_incubations.tsv")
