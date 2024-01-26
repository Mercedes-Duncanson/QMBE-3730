#this is my script for assignment 0

library(tidyverse)
library(ggplot2)
library(purrr)

Loan_Default_Data = read_csv("loan_default_data_set.csv")

#Question 1) Shape: How big is my data set?, What models can you run?
glimpse(Loan_Default_Data)

##There are 21 columns and 20,000 rows. Based on the size of the dataset, you could run either a regression model or a classification model. It depends what you're trying to find.


#Questions 2) What are the column names?
colnames(Loan_Default_Data)

#Questions 3) What are the data types? Modules, techniques for analysis, and storage
str(Loan_Default_Data)

##The data type is mainly numeric except for the re_education column which is characters. 


#Question 4) How much of my data set is missing? Can I drop values from my data set?
sum(is.na(Loan_Default_Data))
Loan_Default_Data %>% keep(~all(is.na(.x))) %>% names
na_rows_count <- sum(!complete.cases(Loan_Default_Data))
print(na_rows_count)

##There are 3,518 missing values, though there no empty columns, but there are 3,347 rows with missing values. We can drop these rows since they contain no data.
Loan_Data_filtered <- Loan_Default_Data[apply(Loan_Default_Data, 1, function(row) any(!is.na(row))), ]
print(Loan_Data_filtered)


#Question 5) Visualization, visualize the data
ggplot(Loan_Data_filtered, aes(x = tot_balance, y = rep_income)) +
  geom_point() +
  labs(title = "Scatter Plot with Linear Regression Line",
       x = "Total Balance",
       y = "Income")

#Not necessarily the best visual but it lets us see the data and visually detect any correlations.


#Questions 6) Summary statistics. Mean, variance, max, standard deviation
summary(Loan_Default_Data)
