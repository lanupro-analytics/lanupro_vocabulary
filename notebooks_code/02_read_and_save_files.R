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

# Discover vocabulary files -----------------------------------------------
# Any file matching lanupro_vocabulary_*.xlsx is picked up automatically,
# so new vocabulary files don't require code changes.

raw_dir <- here("data/raw_results")
processed_dir <- here("data/processed")
vocabulary_sheet <- "vocabulary"
key_column <- "lanupro_ontology" # shared row-key column, not a real variable

vocabulary_files <- list.files(
  path = raw_dir,
  pattern = "^lanupro_vocabulary_.*\\.xlsx$",
  full.names = TRUE
)

if (length(vocabulary_files) == 0) {
  stop("No files matching 'lanupro_vocabulary_*.xlsx' found in ", raw_dir)
}

message("Found ", length(vocabulary_files), " vocabulary file(s): ",
        paste(basename(vocabulary_files), collapse = ", "))


# Check for duplicate variables across all vocabulary files ---------------
# Each variable (column header, excluding the shared key column) may only
# be defined once, in a single file. If a variable is duplicated - either
# within one file or across multiple files - stop before writing anything.

read_column_names <- function(path) {
  names(read_excel(path = path, sheet = vocabulary_sheet, n_max = 0, .name_repair = "minimal"))
}

variable_index <- do.call(rbind, lapply(vocabulary_files, function(path) {
  data.frame(file = basename(path), variable = read_column_names(path), stringsAsFactors = FALSE)
}))
variable_index <- variable_index[variable_index$variable != key_column, ]

variable_counts <- table(variable_index$variable)
duplicate_variables <- names(variable_counts[variable_counts > 1])

if (length(duplicate_variables) > 0) {
  offending <- variable_index[variable_index$variable %in% duplicate_variables, ]
  offending <- offending[order(offending$variable, offending$file), ]

  message("Duplicate vocabulary variable(s) found:")
  for (variable in duplicate_variables) {
    files_with_variable <- offending$file[offending$variable == variable]
    message(" - '", variable, "' appears in: ", paste(files_with_variable, collapse = ", "))
  }

  stop(
    "Duplicate variable name(s) detected in the lanupro_vocabulary_ files: ",
    paste(duplicate_variables, collapse = ", "),
    ". Fix the vocabulary files before the processed .tsv files can be written."
  )
}


# Read, process and save each vocabulary file ------------------------------

# Drop columns that are entirely empty (all NA, or all blank strings)
# so no empty columns get saved to the processed data
drop_empty_columns <- function(df) {
  is_empty_col <- function(col) {
    all(is.na(col) | (is.character(col) & trimws(col) == ""))
  }
  df |> select(where(~ !is_empty_col(.x)))
}

for (path in vocabulary_files) {
  df_vocabulary <- read_excel(path = path, sheet = vocabulary_sheet)

  # df_vocabulary <- drop_empty_columns(df_vocabulary)

  out_file <- file.path(processed_dir, sub("\\.xlsx$", ".tsv", basename(path)))
  write_tsv(df_vocabulary, out_file)
  message("Wrote ", out_file)
}
