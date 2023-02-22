---
  title: "Birth Rates"
author: "Joseph Chung, Sagith Kalaichelvam, and Youngho Kim"
date: "`r Sys.time()`"
date-format: "D MMMM YYYY"
format: 
  pdf:
  documentclass: article
geometry: margin = 1in
abstract: "Blah Blah Blah."
toc: true
number-sections: true
colorlinks: true
lot: true
lof: true
thanks: "Code and data is available at: github.com/UtopianYoungChung/Paper2"
editor: visual
---
  
  ## Introduction
  
  blah blah blah

## Data

blah blah blah

```{r}
#| messages: false
#| echo: false
#| warning: false

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
```

```{r}
#| messages: false
#| echo: false
#| warning: false

birth = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/birth.csv"))
numbirth = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/numbirth.csv"))
student_debt = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/student_debt.csv"))
rent = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/rent.csv"))
religion = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/religion.csv"))
childcare = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/childcare.csv"))
birth2 = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/birth2.csv"))
birth1 = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/birth1.csv"))
race = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/race.csv"))
policy = read_csv(here::here("/Users/sagithkalaichelvam/Downloads/Inputs/Data/policy.csv"))
```

```{r}
#| messages: false
#| echo: false
#| warning: false

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

# getting total number of births for white people from 25 to 34 years old
birth1$numbirthwhite25 = birth1$numbirth_lesshs_whitenh_2534 + birth1$numbirth_educ_miss_whitenh_2534 + birth1$numbirth_gtc_whitenh_2534 + birth1$numbirth_somecoll_whitenh_2534 + birth1$numbirth_hsgrad_whitenh_2534 + birth1$numbirth_ba_whitenh_2534

# getting total number of births for black people from 25 to 34 years old
birth1$numbirthblack25 = birth1$numbirth_lesshs_blacknh_2534 + birth1$numbirth_educ_miss_blacknh_2534 + birth1$numbirth_gtc_blacknh_2534 + birth1$numbirth_somecoll_blacknh_2534 + birth1$numbirth_hsgrad_blacknh_2534 + birth1$numbirth_ba_blacknh_2534

# getting total number of births for hispanics from 25 to 34 years old  
birth1$numbirthhisp25 = birth1$numbirth_lesshs_hisp_2534 + birth1$numbirth_educ_miss_hisp_2534 + birth1$numbirth_gtc_hisp_2534 + birth1$numbirth_somecoll_hisp_2534 + birth1$numbirth_hsgrad_hisp_2534 + birth1$numbirth_ba_hisp_2534

# getting total number of births for white people from 35 to 44 years old
birth1$numbirthwhite35 = birth1$numbirth_lesshs_whitenh_3544 + birth1$numbirth_educ_miss_whitenh_3544 + birth1$numbirth_gtc_whitenh_3544 + birth1$numbirth_somecoll_whitenh_3544 + birth1$numbirth_hsgrad_whitenh_3544 + birth1$numbirth_ba_whitenh_3544

# getting total number of births for black people from 35 to 44 years old
birth1$numbirthblack35 = birth1$numbirth_lesshs_blacknh_3544 + birth1$numbirth_educ_miss_blacknh_3544 + birth1$numbirth_gtc_blacknh_3544 + birth1$numbirth_somecoll_blacknh_3544 + birth1$numbirth_hsgrad_blacknh_3544 + birth1$numbirth_ba_blacknh_3544

# getting total number of births for hispanics from 35 to 44 years old  
birth1$numbirthhisp35 = birth1$numbirth_lesshs_hisp_3544 + birth1$numbirth_educ_miss_hisp_3544 + birth1$numbirth_gtc_hisp_3544 + birth1$numbirth_somecoll_hisp_3544 + birth1$numbirth_hsgrad_hisp_3544 + birth1$numbirth_ba_hisp_3544

# gets the total number of births by year, compiled nationally
birthhist = birth1 %>%
  filter(year >= 2000) %>%
  group_by(year) %>% 
  select(year,pop1544, numbirthwhite15,numbirthwhite20,numbirthwhite25,numbirthwhite35,numbirthhisp15,numbirthhisp20,numbirthhisp25,numbirthhisp35,numbirthblack15,numbirthblack20,numbirthblack25,numbirthblack35) %>%
  summarize(sumpop = sum(pop1544),white15 = sum(numbirthwhite15), white20 = sum(numbirthwhite20), white25 = sum(numbirthwhite25), white35 = sum(numbirthwhite35), black15 = sum(numbirthblack15), black20 = sum(numbirthblack20), black25= sum(numbirthblack25), black35 = sum(numbirthblack35), hisp15 = sum(numbirthhisp15), hisp20 = sum(numbirthhisp20), hisp25=sum(numbirthhisp25), hisp35=sum(numbirthhisp35))

```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts1a
#| fig-cap: Distribution of Number of Births for the 15 to 19 age group from 2000 to 2020

# converts the columns to rows and creates the histogram
birthhist %>%
  pivot_longer(cols = c("white15", "black15","hisp15"),
               names_to = "Race",
               values_to = "value"
  ) %>%
  ggplot(data =., aes(x=value, fill = Race)) +
  geom_histogram()+ 
  theme_minimal()+
  xlab("Number of births") +
  ylab("Number of Years") +
  scale_fill_brewer(palette = "Set10", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)"))
```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts1b
#| fig-cap: Distribution of Number of Births for the 20 to 24 age group from 2000 to 2020

# converts the columns to rows and creates the histogram
birthhist %>%
  pivot_longer(cols = c("white20", "black20","hisp20"),
               names_to = "Race",
               values_to = "value"
  ) %>%
  ggplot(data =., aes(x=value, fill = Race)) +
  geom_histogram()+ 
  theme_minimal()+
  xlab("Number of births") +
  ylab("Number of Years") +
  scale_fill_brewer(palette = "Set10", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)"))
```


```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts1c
#| fig-cap: Distribution of Number of Births for the 25 to 34 age group from 2000 to 2020

# converts the columns to rows and creates the histogram
birthhist %>%
  pivot_longer(cols = c("white25", "black25","hisp25"),
               names_to = "Race",
               values_to = "value"
  ) %>%
  ggplot(data =., aes(x=value, fill = Race)) +
  geom_histogram()+ 
  theme_minimal()+
  xlab("Number of births") +
  ylab("Number of Years") +
  scale_fill_brewer(palette = "Set10", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)"))
```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts1d
#| fig-cap: Distribution of Number of Births for the 35 to 44 age group from 2000 to 2020

# converts the columns to rows and creates the histogram
birthhist %>%
  pivot_longer(cols = c("white35", "black35","hisp35"),
               names_to = "Race",
               values_to = "value"
  ) %>%
  ggplot(data =., aes(x=value, fill = Race)) +
  geom_histogram()+ 
  theme_minimal()+
  xlab("Number of births") +
  ylab("Number of Years") +
  scale_fill_brewer(palette = "Set10", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)"))
```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts2all
#| fig-cap: Trend in birth rates by race from 2000 to 2020 of all age category

# gets the birth rate for each race by adding the number of births from all age groups for each race, then multiplying by 10,000 and dividing by the female population
birthhist %>%
  mutate(whiteall = white15*10000/sumpop + white20*10000/sumpop + white25*10000/sumpop + white35*10000/sumpop, blackall= black15*10000/sumpop + black20*10000/sumpop + black25*10000/sumpop + black35*10000/sumpop, hispall = hisp15*10000/sumpop + hisp20*10000/sumpop + hisp25*10000/sumpop + hisp35*10000/sumpop) %>% 
  select(year, whiteall, blackall, hispall) %>%
  pivot_longer(cols = c("whiteall", "blackall", "hispall"),
               names_to = "racegroup",
               values_to = "value"
  ) %>%
  ggplot(mapping = aes(x = year, y = value, color = racegroup)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2000,2020, by=2))+
  labs(x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
```


```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts2
#| fig-cap: Trend in birth rates by age 15-19, and race from 2000 to 2020

# gets the birth rate for each race by adding the number of births from the 15 to 19 and 25 to 34 age group for each race, then multiplying by 10,000 and dividing by the female population
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
  labs(x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts3
#| fig-cap: Trend in birth rates by age 20-24, and race from 2000 to 2020

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
  labs(x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
```


```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts4
#| fig-cap: Trend in birth rates by age 25 to 34, and race from 2000 to 2020 

# gets the birth rate for each race by adding the number of births from 25 to 34 age group for each race, then multiplying by 10,000 and dividing by the female population
birthhist %>%
  mutate(whiteall = white25*10000/sumpop, blackall= black25*10000/sumpop, hispall = hisp25*10000/sumpop) %>% 
  select(year, whiteall, blackall, hispall) %>%
  pivot_longer(cols = c("whiteall", "blackall", "hispall"),
               names_to = "racegroup",
               values_to = "value"
  ) %>%
  ggplot(mapping = aes(x = year, y = value, color = racegroup)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2000,2020, by=2))+
  labs(x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
```

```{r}
#| messages: false
#| echo: false
#| warning: false
#| label: fig-charts5
#| fig-cap: Trend in birth rates by age 35 to 44, and race from 2000 to 2020 

# gets the birth rate for each race by adding the number of births from 35 to 44 age group for each race, then multiplying by 10,000 and dividing by the female population
birthhist %>%
  mutate(whiteall = white35*10000/sumpop, blackall= black35*10000/sumpop, hispall = hisp35*10000/sumpop) %>% 
  select(year, whiteall, blackall, hispall) %>%
  pivot_longer(cols = c("whiteall", "blackall", "hispall"),
               names_to = "racegroup",
               values_to = "value"
  ) %>%
  ggplot(mapping = aes(x = year, y = value, color = racegroup)) +
  geom_line() +
  theme_minimal() +
  scale_x_continuous(breaks = seq(2000,2020, by=2))+
  labs(x = "Year",
       y = "Birth Rate",
       color = "Race") +
  scale_color_brewer(palette = "Set1", labels = c("Black (Non-Hispanic)", "Hispanic", "White (Non-Hispanic)")) +
  theme(legend.position = "bottom")
```


```{r}
#| messages: false
#| echo: false
#| warning: false

# mean student debt by year
studentdebttable = student_debt %>%
  group_by(year) %>%
  summarize(meandebt = mean(stud_loan_cap)*10000)
# mean rent by year, actually recorded monthly
renttable = rent %>%
  group_by(year) %>%
  summarize(meanrent = mean(avg_grossrent)) %>%
  mutate(meanrent = round(meanrent,1))
# getting the percentage of people who believe religion is important
religiontable = religion %>%
  group_by(year) %>%
  mutate(important = very_important+somewhat_important/(very_important+somewhat_important + not_too_important + not_at_all_important )) %>%
  summarize(meanpercentimportant = mean(important)) %>%
  select(year, meanpercentimportant) %>%
  mutate(meanpercentimportant =round(meanpercentimportant,1))
# mean child care cost by year
childcare = childcare[complete.cases(childcare), ]
childtable = childcare %>%
  group_by(year) %>%
  summarize(meanchildcare = mean(coll_c3)) %>%
  mutate(meanchildcare = round(meanchildcare,1))
# joining the previous datasets into one and removing unnecessary variables
explanatory_table = cbind(studentdebttable,renttable,religiontable,childtable)
explanatory = explanatory_table %>%
  select(-c(3,5,7)) 
explanatory %>%
  knitr::kable(col.names = c("Year","Average Student Debt", "Average Rent", "Percentage of Religious People","Average Child Care Cost"), caption = "Changes in Variables that may Explain Decline in Birth Rates") %>% 
  kable_styling(latex_options = "HOLD_position")
```

