
library(gridExtra)
library(cdlTools)
library(tidyverse)
library(ggplot2)
library(haven)
#04~19 birthrate data
birth1 = read_dta("data/nchs/nchs_births_pop_1990_2019.dta")
pop1 = read_dta("data/pop/age_race_comp_seer.dta")
birth1 <- birth1 %>% 
  filter((year>=2004 & year<=2008) | (year>=2015 & year<=2019))

birth1 <- birth1 %>% 
  subset(select=c(stname,year,numbirth1544))


pop1<-pop1 %>% 
  mutate(pop1544 = pop1519 + pop2034 + pop3544)%>% 
  filter((year>=2004 & year<=2008) | (year>=2015 & year<=2019)) %>%
  group_by(year,stname) %>%
  select(pop1544) %>% 
  summarise(across(everything(),sum))
  
fig4_data <- right_join(birth1, pop1, by=c("stname","year"))
fig4_data <- fig4_data %>% 
  mutate(year = case_when(year=2004 & year<=2008 ~ 2004,
                           year>=2015 & year<=2019 ~ 2019)) %>%
  group_by(year,stname) %>%
  select(numbirth1544,pop1544) %>% 
  summarise(across(everything(),sum)) %>% 
  mutate(birthrate=numbirth1544/pop1544*1000) %>% 
  select(-c(numbirth1544,pop1544))

fig4_data <- fig4_data %>% 
  group_by(stname) %>% 
  mutate(birthrate = birthrate[year == 2019] - birthrate[year == 2004])

#04~19 childcare cost for fig4b
childcare_aesc=read_dta("data/long_term/childcare_asec_09_1519.dta")
childcare_aesc <- childcare_aesc %>% 
  mutate(childcare_cost=child_asec)
childcare_aesc <- childcare_aesc %>% 
  select(year,stname,childcare_cost)
fig4_data <- right_join(fig4_data, childcare_aesc, by=c("stname","year"))
fig4_data <- fig4_data %>% 
  group_by(stname) %>% 
  mutate(childcare_cost = childcare_cost[year == 2019] - childcare_cost[year == 2004])


#04~19 rentcost data for fig4c
rentcost_0419=read_dta("data/long_term/longdiff-rentcost-0419.dta")

rentcost_0419 <- rentcost_0419 %>% 
  mutate(stname = fips(rentcost_0419$statefip, to='Abbreviation')) %>%
  group_by(stname) %>% 
  mutate(avg_grossrent = avg_grossrent[year == 2019] - avg_grossrent[year == 2004]) %>% 
  select(year,stname,avg_grossrent)

fig4_data <- right_join(fig4_data, rentcost_0419, by=c("stname","year"))


#04~19 wage ratio data for fig4d
rhs_1519=read_dta("data/long_term/longdiff-RHS-1519.dta")
rhs_0408=read_dta("data/long_term/longdiff-RHS-0408.dta")
rhs<-rbind(rhs_1519, rhs_0408)
rhs <- rhs %>% 
  mutate(stname = fips(rhs$statefip, to='Abbreviation')) %>% 
  mutate(fem_male_ratio=p50wage_all/p50wage_male_all) %>% 
  select(year,stname,fem_male_ratio) %>% 
  group_by(stname) %>% 
  mutate(fem_male_ratio = fem_male_ratio[year == 2019] - fem_male_ratio[year == 2004])

fig4_data <- right_join(fig4_data, rhs, by=c("stname","year"))

#04~19 student loan data for fig4e
std_loan=read_dta("data/long_term/nyfed-student-debt-per-capita-0419.dta")

std_loan<- std_loan %>% 
  group_by(stname) %>% 
  mutate(stud_loan_cap = stud_loan_cap[year == 2019] - stud_loan_cap[year == 2004])

fig4_data <- right_join(fig4_data, std_loan, by=c("stname","year"))



fig4_data <- fig4_data %>% 
  head(51) %>% 
  select(-c(year))


#drawing
fig4b<-fig4_data %>% 
  ggplot(aes(x=childcare_cost*1000, y=birthrate)) +
  geom_point(size=0)+
  labs(
    title = "Change in (real) childcare expenditurest",
    x = "US dollar",
    y = "birthrate") +
  geom_text(aes(label = stname),size=2) +
  scale_x_continuous(limits=c(0, 5000), breaks=seq(0, 5000, by = 1000),labels = paste0("$",seq(0, 5000, by=1000))) +
  scale_y_continuous(limits = c(-20,10), breaks = seq(-20,10, by=5)) +
  geom_smooth(method="lm",se=FALSE)  +
  theme_light()

fig4c <-fig4_data %>% 
  ggplot(aes(x=avg_grossrent, y=birthrate)) +
  geom_point(size=0)  +
  labs(
    title = "Change in (real) rental housing costs",
    x = "US dollar",
    y = "birthrate") +
  geom_text(aes(label = stname),size=2) +
  scale_x_continuous(limits=c(0, 400), breaks=seq(0, 400, by = 50),labels = paste0("$",seq(0, 400, by=50))) +
  scale_y_continuous(limits = c(-20,10), breaks = seq(-20,10, by=5)) +
  geom_smooth(method="lm",se=FALSE)  +
  theme_light()

fig4d<-fig4_data %>% 
  ggplot(aes(x=fem_male_ratio, y=birthrate)) +
  geom_point(size=0)  +
  labs(
    title = "Change in female-male wage ratio",
    x = "fem to male wage ratio",
    y = "birthrate")+
  geom_text(aes(label = stname),size=2) +
  scale_x_continuous(limits=c(-0.08, 0.12), breaks=seq(-0.08, 0.12, by = 0.04)) +
  scale_y_continuous(limits = c(-20,10), breaks = seq(-20,10, by=5)) +
  geom_smooth(method="lm",se=FALSE)  +
  theme_light()

fig4e<-fig4_data %>% 
  ggplot(aes(x=stud_loan_cap*1000, y=birthrate)) +
  geom_point(size=0)  +
  labs(
    title = "Change in (real) per capita student loan debt",
    x = "US dollar",
    y = "birthrate") +
  geom_text(aes(label = stname),size=2) +
  scale_x_continuous(limits=c(1000, 4500), breaks=seq(1000, 4500, by = 500),labels = paste0("$",seq(1000, 4500, by=500))) +
  scale_y_continuous(limits = c(-20,10), breaks = seq(-20,10, by=5)) +
  geom_smooth(method="lm",se=FALSE)  +
  theme_light()


grid.arrange(fig4b,fig4c,fig4d,fig4e,ncol=2,nrow=2)
