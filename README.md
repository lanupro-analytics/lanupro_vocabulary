# lanupro-vocabulary

Welcome to the **lanupro vocabulary** repository! This project hosts lanupro naming conventions used in lab data templates.

Excel masterfile lab templates are linked via Power Query for streamlined integration of the existing naming conventions.

The vocabulary files do have the following rows:
- lanupro_ontology: variable name to be used within lanupro
- type: identifier, string, numeric, factor
- deprecated_names: any old names which are not used anymore, but can be used for mapping of historical data
- description: explanation on the variable
- default_unit: does the variable have any default unit (if there can be any confusion on units, the unit is included in the variable name
- fixed_levels: yes/no. In case of fixed levels you need to add your levels to the vocabulary when not present. If not this means that a user can use custom project factor levels which do not need to be present in the ontology (e.g. you have a treatment label "high_starch").

Note although you will see the dropdown menu below all variable names of the masterfile templates, the dropdown is only relevant and active when it concerns a factor with fixed levels.


## Getting Started

### Using the naming conventions

The naming conventions are integrated in the lanupro lab templates. Just use the lab templates for your data.

Current lab templates available:

-   **Rumen incubations** \
    [S:\\shares\\lanupro\\Rumen\\1_Methods\\Masterfile\\masterfile_incubations_template.xltx]("S:\shares\lanupro\Rumen\1_Methods\Masterfile\masterfile_incubations_template.xltx")

### Changing the naming conventions

*If a name is not present in the Lanupro lab template, you have to update the lanupro_vocabulary*

1.  Choose the right vocabulary file depending on your analysis and download the excel file from github:

| Download | Preview |
|------------------------------------|------------------------------------|
| [lanupro_vocabulary_general](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_general.xlsx) | [lanupro_vocabulary_general](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_general.tsv) |
| [lanupro_vocabulary_fatty_acids](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_fatty_acids.xlsx) | [lanupro_vocabulary_fatty_acids](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_fatty_acids.tsv) |
| [lanupro_vocabulary_incubations](https://github.com/lanupro-analytics/lanupro_vocabulary/raw/refs/heads/master/data/raw_results/lanupro_vocabulary_incubations.xlsx) | [lanupro_vocabulary_incubations](https://github.com/lanupro-analytics/lanupro_vocabulary/blob/master/data/processed/lanupro_vocabulary_incubations.tsv) |

2.  Edit locally: add your new names

3.  Upload the file on:\
    <https://github.com/lanupro-analytics/lanupro_vocabulary/upload/master/data/raw_results>

    Drag of choose the file, add an optional message and press "Commit"

    ![](docs/upload.png)

4.  Refresh the power query of your lab file to import the latest naming conventions: ready for use!

    ![](docs/refresh_query.png)

### Contribute to the coding

Only required when you want to actively contribute to the coding, not for the names in excel format

-   R (version 4.0 or higher recommended)\
-   RStudio\
-   Git\
-   Access to the `lanupro` GitHub organization\
-   Power Query-compatible software (e.g., Microsoft Excel)

How to contribute:

1.  Fork the repo

2.  Make a branch (e.g. feature/my-fix)

3.  Open a Pull Request back to themain branch
