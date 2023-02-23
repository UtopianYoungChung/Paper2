#### Preamble ####
# Purpose: Clean and prepare Dataset for Paper2
# Author: Joseph Chung
# Date: 22 February 2023
# Contact: yj.chung@mail.utoronto.ca
# License: MIT


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(knitr)
library(lubridate)
library(patchwork)
library(janitor)
library(reshape2)

#### Simulate data ####
fig1_data <- read.csv(here::here("inputs/data/fig_1.csv"))



