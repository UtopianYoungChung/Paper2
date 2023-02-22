#### Preamble ####
# Purpose: Load the data from the data section of "The Puzzle of Falling US Birth Rates since the Great Recession", from  the American Economic Journal 
# Author: Joseph Chung, Sagith Kalaichelvam, and Youngho Kim
# Data: 16 February 2023
# Contact: sagith.kalaichelvam@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have installed the tidyverse, haven and tidyr packages. 



#### Workspace setup ####

library(haven)
library(tidyverse)

# Reading in the data.
birth1 = read_dta("data/nchs/nchs_births_pop_1990_2019.dta")


birth1 <- birth1 %>%
  group_by(year) %>%
  select(-c(stname)) %>% 
  summarise(across(everything(),sum))

birth1 <- birth1 %>% 
  mutate(birthrate1519 = numbirth1519/pop1519*1000) %>% 
  mutate(birthrate2024 = numbirth2024/pop2024*1000) %>% 
  mutate(birthrate2529 = numbirth2529/(pop25+pop26+pop27+pop28+pop29)*1000) %>% 
  mutate(birthrate3034 = numbirth3034/(pop30+pop31+pop32+pop33+pop34)*1000) %>% 
  mutate(birthrate3539 = numbirth3539/(pop35+pop36+pop37+pop38+pop39)*1000) %>% 
  mutate(birthrate4044 = numbirth4044/(pop40+pop41+pop42+pop43+pop44)*1000)

birth1 <- birth1 %>% 
  select(year, birthrate1519, birthrate2024, birthrate2529, birthrate3034, birthrate3539, birthrate4044) %>%
  pivot_longer(-c(year),
               names_to = "agegroup",
               values_to = "birthrate"
  )

birth1<-birth1 %>% 
  mutate(agegroup = as.character(str_replace(agegroup, "birthrate", "")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "1519", "15~19")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "2024", "20~24")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "2529", "25~29")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "3034", "30~34")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "3539", "35~39")))
birth1<-birth1 %>%  mutate(agegroup=as.character(str_replace(agegroup, "4044", "40~44")))

birth1 %>% 
ggplot(mapping = aes(x = year, y = birthrate, color = agegroup)) + 
  geom_line()  +
  labs(
    title = "Trends in Birth Rates by Age Group",
    x = "Year",
    y = "birthrate",
    caption = "Source: CDC Vital Statistics Births Reports.",
    color = "Age Group"
  ) +
  scale_x_continuous(limits=c(1990, 2020), breaks=seq(1990, 2020, by = 2)) +
  scale_y_continuous(limits = c(0,125), breaks = seq(0,125, by=20)) +
  theme_light()
