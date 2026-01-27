# Force project root in GitHub Actions
if (nzchar(Sys.getenv("GITHUB_WORKSPACE"))) {
  setwd(Sys.getenv("GITHUB_WORKSPACE"))
}

getwd() |> message()


library(readxl)
library(writexl)
library(here)

# Read the vocabulary data

# Directly from the server

df_vocabulary_general <- read_excel(path = here("data/raw_results/lanupro_vocabulary_general.xlsx"), sheet = "vocabulary")
df_vocabulary_fatty_acids <- read_excel(path = here("data/raw_results/lanupro_vocabulary_fatty_acids.xlsx"), sheet = "vocabulary")
df_vocabulary_incubations <- read_excel(path = here("data/raw_results/lanupro_vocabulary_incubations.xlsx"), sheet = "vocabulary")



# Processing If needed


# Save the vocabulary data to .csv files
# For excel power query and for version control


write.csv(df_vocabulary_general, "data/processed/lanupro_vocabulary_general.csv", row.names = FALSE)
write.csv(df_vocabulary_fatty_acids, "data/processed/lanupro_vocabulary_fatty_acids.csv", row.names = FALSE)
write.csv(df_vocabulary_incubations, "data/processed/lanupro_vocabulary_incubations.csv", row.names = FALSE)
