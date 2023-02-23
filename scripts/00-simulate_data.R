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
agecomp_data = read_dta(here::here("inputs/data/pop/agecomp-seer.dta"))
birth1 = read_dta(here::here("inputs/data/nchs/nchs_births_pop_1990_2019.dta"))
pop1 = read_dta(here::here("inputs/data/pop/age_race_comp_seer.dta"))
rentcost_0419 = read_dta(here::here("inputs/data/long_term/longdiff-rentcost-0419.dta"))
rhs_1519 = read_dta(here::here("inputs/data/long_term/longdiff-RHS-1519.dta"))
rhs_0408 = read_dta(here::here("inputs/data/long_term/longdiff-RHS-0408.dta"))
std_loan = read_dta(here::here("inputs/data/long_term/nyfed-student-debt-per-capita-0419.dta"))

# Create datasets from dta files
write_csv(x = agecomp_data, file = here::here("Inputs/Data/agecomp_data.csv"))
write_csv(x = birth1, file = here::here("Inputs/Data/birth1.csv"))
write_csv(x = pop1, file = here::here("Inputs/Data/pop1.csv"))
write_csv(x = rentcost_0419, file = here::here("Inputs/Data/rentcost_0419.csv"))
write_csv(x = rhs_1519, file = here::here("Inputs/Data/rhs_1519.csv"))
write_csv(x = rhs_0408, file = here::here("Inputs/Data/rhs_0408.csv"))
write_csv(x = std_loan, file = here::here("Inputs/Data/std_loan.csv"))

