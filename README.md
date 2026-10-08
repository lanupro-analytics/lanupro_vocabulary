# lanupro-vocabulary

Naming conventions for lab data templates within the **lanupro** project.

Excel masterfile lab templates are linked via Power Query, so the latest naming conventions can be imported directly into your lab files.

## Table of contents

- [Vocabulary files](#vocabulary-files)
- [Getting started](#getting-started)
  - [Using the naming conventions](#using-the-naming-conventions)
  - [Changing the naming conventions](#changing-the-naming-conventions)
- [Contributing to the code](#contributing-to-the-code)

## Vocabulary files

Each vocabulary file contains the following columns:

| Column | Description |
|---|---|
| `lanupro_ontology` | Variable name to be used within lanupro |
| `type` | One of: `identifier`, `string`, `numeric`, `factor` |
| `deprecated_names` | Old names that are no longer used, but can be used to map historical data |
| `description` | Explanation of the variable |
| `default_unit` | Default unit of the variable, if any. If there can be any confusion about units, the unit is included in the variable name |
| `fixed_levels` | `yes`/`no`. With fixed levels, you must add any missing level to the vocabulary. Without fixed levels, users can use custom project factor levels that do not need to be present in the ontology (e.g. a treatment label `high_starch`) |

> [!NOTE]
> The masterfile templates show a dropdown menu below all variable names, but the dropdown is only relevant and active for factors with fixed levels.

## Getting started

### Using the naming conventions

The naming conventions are integrated in the lanupro lab templates. Just use the lab templates for your data.

| Lab template | Location |
|---|---|
| Rumen incubations | `S:\shares\lanupro\Rumen\1_Methods\Masterfile\masterfile_incubations_template.xltx` |

### Changing the naming conventions

> [!IMPORTANT]
> If a name is not present in the lanupro lab template, you have to update the lanupro vocabulary.

1. **Download** the vocabulary file that matches your analysis:

   | Vocabulary | Download (Excel) | Preview (TSV) |
   |---|---|---|
   | General | [lanupro_vocabulary_general](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_general.xlsx) | [preview](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_general.tsv) |
   | Fatty acids | [lanupro_vocabulary_fatty_acids](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_fatty_acids.xlsx) | [preview](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_fatty_acids.tsv) |
   | Incubations | [lanupro_vocabulary_incubations](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_incubations.xlsx) | [preview](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_incubations.tsv) |

2. **Edit locally**: add your new names.

3. **Upload** the file at <https://github.com/lanupro-analytics/lanupro_vocabulary/upload/master/data/raw_results>. Drag or choose the file, add an optional message and press **Commit**.

   ![Upload the vocabulary file](docs/upload.png)

4. **Check** that the upload was processed correctly. After the commit, an automated action runs, which usually takes a few minutes to finish.
   - Open the **Actions** tab of the repository and wait until the latest run shows a green check mark.
   - Open the TSV **preview** of your vocabulary (see the table above) and confirm that your new names are present.

   > [!WARNING]
   > If a name already exists in the vocabulary (duplicate), the action fails with an error. Remove or correct the duplicate in your Excel file and upload it again.

5. **Refresh** the Power Query in your lab file to import the latest naming conventions. Ready for use!

   ![Refresh the Power Query](docs/refresh_query.png)

> [!TIP]
> Upload the file under its original name, so it replaces the existing vocabulary file and the Power Query keeps working.

## Contributing to the code

> [!NOTE]
> Only required if you want to actively contribute to the code, not if you only want to update names in the Excel files.

### Requirements

- R (version 4.0 or higher recommended)
- RStudio
- Git
- Access to the `lanupro` GitHub organization
- Power Query-compatible software (e.g. Microsoft Excel)

### Workflow

1. Fork the repository.
2. Create a branch (e.g. `feature/my-fix`).
3. Open a Pull Request back to the `master` branch.
