# Load necessary libraries
library(survival)
library(readxl)
library(coin)

# Load the data from Excel file
data_xls <- read_excel("H2a-H3b_McNemar_GroupwiseComparisons.xlsx", na = "NA")

# Convert data to matrix excluding the ID column
responses <- as.matrix(data_xls[, -1])  # Remove the first column (IDs) and convert the rest to a matrix
column_names <- colnames(data_xls)[-1]  # Extracting the original column headers from the source data

# Conduct Cochran's Q test
result <- symmetry_test(as.factor(t(responses)) ~ factor(rep(1:9, each=100)), 
                        data = as.data.frame(responses), 
                        teststat = "quad")
print(result)
