library(tidyverse)
library(ggplot2)


fig1_data <- read.csv("data/fig_1.csv")
fig1_data %>%
  ggplot(aes(x = year,
             y = brate_all)) +
  geom_line() +
  scale_y_continuous(limits = c(50, 80), breaks = seq(50, 80, by = 5)) +
  labs(
    title = "Trend in US Birth Rates",
    x = "Years",
    y = "Births per 1,000 women age 15-44",
    caption = "Source: Birth Rates collected from CDC Vital Statistics Births Reports for 2015, 2019 and 2020.") +
  geom_vline(xintercept = 2007,
             linetype = "dashed") +
  geom_text(aes(x = 2007, y = 70), nudge_x = 2, nudge_y = 1, label = "2007") +
  theme_light()
