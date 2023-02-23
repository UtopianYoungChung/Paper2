#### Preamble ####
# Purpose: Clean and prepare Dataset for Paper2
# Author: Joseph Chung
# Date: 22 February 2023
# Contact: yj.chung@mail.utoronto.ca
# License: MIT


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



