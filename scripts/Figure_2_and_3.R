# Define all required libraries for this paper
library(opendatatoronto)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(knitr)
library(kableExtra)
library(scales)
library(haven)
library(here)

birth1 = read_dta("data/nchs/nchs_births_pop_1990_2019.dta")

birth1 <- birth1 %>%
  group_by(year) %>%
  select(-c(stname)) %>% 
  summarise(across(everything(),sum))

# getting total number of births for white people from 15 to 19 years old
birth1$numbirthwhite15 = birth1$numbirth_lesshs_whitenh_1519 + birth1$numbirth_educ_miss_whitenh_1519 + birth1$numbirth_gtc_whitenh_1519 + birth1$numbirth_somecoll_whitenh_1519 + birth1$numbirth_hsgrad_whitenh_1519 + birth1$numbirth_ba_whitenh_1519

# getting total number of births for black people from 15 to 19 years old  
birth1$numbirthblack15 = birth1$numbirth_lesshs_blacknh_1519 + birth1$numbirth_educ_miss_blacknh_1519 + birth1$numbirth_gtc_blacknh_1519 + birth1$numbirth_somecoll_blacknh_1519 + birth1$numbirth_hsgrad_blacknh_1519 + birth1$numbirth_ba_blacknh_1519

# getting total number of births for hispanics from 15 to 19 years old  
birth1$numbirthhisp15 = birth1$numbirth_lesshs_hisp_1519 + birth1$numbirth_educ_miss_hisp_1519 + birth1$numbirth_gtc_hisp_1519 + birth1$numbirth_somecoll_hisp_1519 + birth1$numbirth_hsgrad_hisp_1519 + birth1$numbirth_ba_hisp_1519

# getting total number of births for white people from 20 to 24 years old
birth1$numbirthwhite20 = birth1$numbirth_lesshs_whitenh_2024 + birth1$numbirth_educ_miss_whitenh_2024 + birth1$numbirth_gtc_whitenh_2024 + birth1$numbirth_somecoll_whitenh_2024 + birth1$numbirth_hsgrad_whitenh_2024 + birth1$numbirth_ba_whitenh_2024

# getting total number of births for black people from 20 to 24 years old
birth1$numbirthblack20 = birth1$numbirth_lesshs_blacknh_2024 + birth1$numbirth_educ_miss_blacknh_2024 + birth1$numbirth_gtc_blacknh_2024 + birth1$numbirth_somecoll_blacknh_2024 + birth1$numbirth_hsgrad_blacknh_2024 + birth1$numbirth_ba_blacknh_2024

# getting total number of births for hispanics from 20 to 24 years old  
birth1$numbirthhisp20 = birth1$numbirth_lesshs_hisp_2024 + birth1$numbirth_educ_miss_hisp_2024 + birth1$numbirth_gtc_hisp_2024 + birth1$numbirth_somecoll_hisp_2024 + birth1$numbirth_hsgrad_hisp_2024 + birth1$numbirth_ba_hisp_2024

# gets the total number of births by year, compiled nationally
birthhist = birth1 %>%
  filter(year >= 2000) %>%
  group_by(year) %>% 
  select(year,pop1544, numbirthwhite15,numbirthwhite20,numbirthhisp15,numbirthhisp20,numbirthblack15,numbirthblack20) %>%
  summarize(sumpop = sum(pop1544),white15 = sum(numbirthwhite15), white20 = sum(numbirthwhite20), black15 = sum(numbirthblack15), black20 = sum(numbirthblack20), hisp15 = sum(numbirthhisp15), hisp20 = sum(numbirthhisp20))

# gets the birth rate for each race by adding the number of births from the 15 to 19for each race, then multiplying by 10,000 and dividing by the female population
birthhist %>%
  mutate(whiteall = white15*10000/sumpop, blackall= black15*10000/sumpop, hispall = hisp15*10000/sumpop) %>% 
  select(year, whiteall, blackall, hispall) %>%
  pivot_longer(cols = c("whiteall", "blackall", "hispall"),
               names_to = "racegroup",
               values_to = "value"
  ) %>%
  ggplot(mapping = aes(x = year, y = value, color = racegroup)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2000,2020, by=2))+
  labs(title = "birthrate for each race in age group 15 to 19",
       x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")

# gets the birth rate for each race by adding the number of births from the 20 to 24 age group for each race, then multiplying by 10,000 and dividing by the female population
birthhist %>%
  mutate(whiteall = white20*10000/sumpop, blackall= black20*10000/sumpop, hispall = hisp20*10000/sumpop) %>% 
  select(year, whiteall, blackall, hispall) %>%
  pivot_longer(cols = c("whiteall", "blackall", "hispall"),
               names_to = "racegroup",
               values_to = "value"
  ) %>%
  ggplot(mapping = aes(x = year, y = value, color = racegroup)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2000,2020, by=2))+
  labs(title="birthrate for each race in age group 20 to 24",
       x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
