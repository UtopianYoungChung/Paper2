library(tidyverse)
library(ggplot2)
library(haven)

nch_cohot_data <- read_dta("data/nchs/nchs_cohort_analysis.dta")
agecomp_data <- read_dta("data/pop/agecomp-seer.dta")

pop_by_cohort<- agecomp_data %>%
  select(1:32) %>%
  group_by(year) %>%
  select(-c(stname)) %>%
  summarise(across(everything(),sum)) %>%
  pivot_longer(-c(year), names_to = "mage", values_to = "pop") %>%
  mutate(mage = as.numeric(str_replace(mage, "fem", ""))) %>%
  mutate(birthyear = year - mage) %>%
  mutate(cohort2 = case_when(birthyear >= 1968 & birthyear <=1972 ~ 1,
                            birthyear >= 1973 & birthyear <=1977 ~ 2,
                            birthyear >= 1978 & birthyear <=1982 ~ 3,
                            birthyear >= 1983 & birthyear <=1987 ~ 4,
                            birthyear >= 1988 & birthyear <=1992 ~ 5,
                            birthyear >= 1993 & birthyear <=1997 ~ 6)) %>% 
  group_by(cohort2,mage) %>%
  summarise(pop = sum(pop))


fig5_data <- right_join(nch_cohot_data, pop_by_cohort, by=c("mage", "cohort2"))
fig5_data <- fig5_data %>%
  mutate(birthrate=numbirth/pop*1000,
         age_2024_year = case_when(cohort2 == 1 ~ 1992,
                                   cohort2 == 2 ~ 1997,
                                   cohort2 == 3 ~ 2002,
                                   cohort2 == 4 ~ 2007,
                                   cohort2 == 5 ~ 2012,
                                   cohort2 == 6 ~ 2017))

fig5_data <- fig5_data %>% 
  group_by(age_2024_year) %>% 
  mutate(cum_birthrate = cumsum(birthrate)/1000, 
         cohort = case_when(cohort2 == 1 ~ "1968-1972",
                                  cohort2 == 2 ~ "1973-1977",
                                  cohort2 == 3 ~ "1978-1982",
                                  cohort2 == 4 ~ "1983-1987",
                                  cohort2 == 5 ~ "1988-1992",
                                  cohort2 == 6 ~ "1993-1997"))

fig5_data <-  na.omit(fig5_data)
fig5_data %>%
  ggplot(aes(x = mage,
             y = cum_birthrate,
             color = cohort)) +
  geom_line()  +
  labs(
    title = "Children Ever Born by Mother’s Age and Birth Cohort",
    x = "ages",
    y = "cumulative birthrate",
    caption = "Source: Authors’ calculations based on NCHS Vital Statistics birth microdata and CDC SEER population
data. See the Data Appendix for specific details.",
    color = "Birth cohorts"
  ) +
  scale_x_continuous(limits=c(15, 44), breaks=seq(15, 44, by = 2)) +
  theme_light()
