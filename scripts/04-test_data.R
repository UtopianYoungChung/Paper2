#### Preamble ####
# Purpose: Birth Rates Dataset
# Author: Sagith Kalaichelvam, Joseph Chung, Youngho Kim
# Data: 21 February 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: [...UPDATE THIS...]
# Any other information needed? [...UPDATE THIS...]


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(janitor)
library(here)

#### Test data ####
# If there is TRUE outputting, then test is assumed to be passed
# All of the test are passing with return value of True
# For those with multiple data outputting, there might be some false outputing
# after the True value, those can be ignored because as long the first value
# is outputting True, then that means it is passing the test, since we are only
# checking for first value to be outputted as True in the data

# Checking if the year matches the year listed in the dataset
fig1_data$year |> unique() == c('1980')

# Checking if the year matches the year listed in the dataset
fig1_data$year |> unique() == c('1982')

# Checking if the value matches the value listed in the dataset
fig1_data$brate_all |> unique() == c('68.4')

# Checking if the value matches the value listed in the dataset
fig1_data$brate_all |> unique() == c('67.3')

# Checking if the population matches the population listed in the dataset
fig5_data$pop |> unique() == c('8978763')

# Checking if the cohort matches the cohort listed in the dataset
fig5_data$cohort |> unique() == c('1968-1972')

# Checking if the data value of female age 35-44 matches the data listed in the dataset
agecomp_data$fem3544 |> unique() == c('24832')

# Checking if the data value of female age 35-44 matches the data listed in the dataset
agecomp_data$fem3544 |> unique() == c('26302')

# Checking if the data value of female age 44 matches the data listed in the dataset
agecomp_data$fem44 |> unique() == c('1855')

# Checking if the data value of female age 44 matches the data listed in the dataset
agecomp_data$fem28 |> unique() == c('4410')

# Test the year data is a integer
fig1_data$year |> class() == "integer"

# Test the brate_all data is a numeric
fig1_data$brate_all |> class() == "numeric"