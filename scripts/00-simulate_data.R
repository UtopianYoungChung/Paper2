#### Preamble ####
# Purpose: Load the data from the data section of "The Puzzle of Falling US Birth Rates since the Great Recession", from  the American Economic Journal 
# Author: Joseph Chung, Youngho Kim, Sagith Kalaichelvam
# Data: 22 February 2023
# Contact: yj.chung@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have installed the tidyverse, haven and tidyr packages. 



#### Workspace setup ####

library(haven)
library(tidyverse)

# Reading in the data
fig1_data = read.csv(here::here("inputs/data/fig_1.csv"))
agecomp_data = read_dta(here::here("inputs/data/pop/agecomp-seer.dta"))
birth1 = read_dta(here::here("inputs/data/nchs/nchs_births_pop_1990_2019.dta"))
pop1 = read_dta(here::here("inputs/data/pop/age_race_comp_seer.dta"))
rentcost_0419 = read_dta(here::here("inputs/data/long_term/longdiff-rentcost-0419.dta"))
rhs_1519 = read_dta(here::here("inputs/data/long_term/longdiff-RHS-1519.dta"))
rhs_0408 = read_dta(here::here("inputs/data/long_term/longdiff-RHS-0408.dta"))
std_loan = read_dta(here::here("inputs/data/long_term/nyfed-student-debt-per-capita-0419.dta"))

# Create datasets from dta files
write_csv(fig1_data, "Inputs/Data/fig1_data.csv")
write_csv(agecomp_data, "Inputs/Data/agecomp_data.csv")
write_csv(birth1, "Inputs/Data/birth1.csv")
write_csv(pop1, "Inputs/Data/pop1.csv")
write_csv(rentcost_0419, "Inputs/Data/rentcost_0419.csv")
write_csv(rhs_1519, "Inputs/Data/rhs_1519.csv")
write_csv(rhs_0408, "Inputs/Data/rhs_0408.csv")
write_csv(std_loan, "Inputs/Data/std_loan.csv")

