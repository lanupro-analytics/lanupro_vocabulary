library(readxl)
library(writexl)
library(here)

# Read the vocabulary data

# Directly from the server

df_vocabulary_general <- read_excel(path = here("data/raw_results/lanupro_vocabulary_general.xlsx"), sheet = "vocabulary")
df_vocabulary_fatty_acids <- read_excel(path = here("data/raw_results/lanupro_vocabulary_fatty_acids.xlsx"), sheet = "vocabulary")
df_vocabulary_incubations <- read_excel(path = here("data/raw_results/lanupro_vocabulary_incubations.xlsx"), sheet = "vocabulary")



# Processing If needed


# Save the vocabulary data to .cvs
# For excel power query and
# For version control


write.csv(df_vocabulary_general, file = here("data/processed/lanupro_vocabulary_general.csv"))
write.csv(df_vocabulary_fatty_acids, file = here("data/processed/lanupro_vocabulary_fatty_acids.csv"))
write.csv(df_vocabulary_incubations, file = here("data/processed/lanupro_vocabulary_incubations.csv"))
