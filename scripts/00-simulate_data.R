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



#### Workspace setup ####
library(gridExtra)
library(cdlTools)
library(RGraphics)
library(tidyverse)
library(palmerpenguins)
library(knitr)
library(ggplot2)
library(haven)
library(dplyr)
options(dplyr.summarise.inform = FALSE)

#### Simulate data ####
fig1_data <- read.csv(here::here("inputs/data/fig_1.csv"))



