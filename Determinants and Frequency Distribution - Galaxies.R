# Setting up my environment

library(tidyverse)
library(skimr)
library(janitor)
library(readxl)
library(ggplot2)
library(dplyr)

#We import data for this case in excel format
galaxy_wellbeing <- read_excel("D:/Portfolio/R PROGRAMMING/STRATHMORE/Data/Train_data.xls")

#Getting to know our data using functions
head(galaxy_wellbeing)
colnames(galaxy_wellbeing)
str(galaxy_wellbeing)

#We can determine the number of times each galaxy appears in the data as follows:
galaxy_wellbeing %>% 
  group_by(galaxy) %>% 
  tally() %>% 
  print(n = 181)

ggplot(data = galaxy_wellbeing)+  
  geom_bar(mapping = aes(x=galaxy, fill="slyblue", alpha=0.9))+
  labs(title= "Frequency of Galaxies")

#We plot the well-being index per galaxy
ggplot(data = galaxy_wellbeing) +
  geom_point(mapping = aes(x=galaxy, y=`Well-Being Index`, color=`Well-Being Index`))

#Distribution of well being index
mean(galaxy_wellbeing$`Well-Being Index`)
median(galaxy_wellbeing$`Well-Being Index`)

ggplot(data = galaxy_wellbeing) +   
  geom_density(mapping = aes(x =`Well-Being Index`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Well-Being Index`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.85))+
  annotate("text", x=0.25, y=22.5,label="Median Well Being Index = 0.05886427")+
  annotate("text", x=0.25, y=20,label="Mean Well Being Index = 0.08272363")+
  labs(title = "Distribution of Well Being Index")
#The well being index is right skewed with mean = 0.08272363 and median=0.05886427
#Meaning majority of galaxy's wellbeing index are clustered towards the left side of the distribution

#Distribution of income index
income_index_new <- galaxy_wellbeing %>% 
  drop_na(`Income Index`)

mean(income_index_new$`Income Index`)
median(income_index_new$`Income Index`)

ggplot(data = income_index_new) +   
  geom_density(mapping = aes(x =`Income Index`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Income Index`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=0.75, y=2.25,label="Median Income Index = 0.8211244")+
  annotate("text", x=0.75, y=2.0,label="Mean Income Index = 0.8190817")+
  labs(title = "Distribution of Income Index")
#Income index is exhibits a normal distribution curve with mean = 0.8190817 and median=0.8211244

#Now we plot income index vs well being index to determine the relationship
ggplot(data = income_index_new) +   
  geom_point(mapping = aes(x =`Income Index`, y=`Well-Being Index`, colour="grey"))+
  labs(title = "Income Index vs Well-Being Index")
#There is positive correlation between Income Index and Well-Being Index

#Distribution of Education index
Education_Index_new <- galaxy_wellbeing %>% 
  drop_na(`Education Index`)

mean(Education_Index_new$`Education Index`)
median(Education_Index_new$`Education Index`)

ggplot(data = Education_Index_new) +   
  geom_density(mapping = aes(x = `Education Index`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Income Index`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=0.85, y=2.25,label="Median Education Index = 0.7480341")+
  annotate("text", x=0.85, y=2.0,label="Mean Education Index = 0.7311239")+
  labs(title = "Distribution of Education Index")

#Relationship between Education Index and Wellbeing Index
ggplot(data = Education_Index_new) +   
  geom_point(mapping = aes(x =`Education Index`, y=`Well-Being Index`, colour="grey"))+
  labs(title = "Education Index vs Well-Being Index")
#There is positive correlation between Education Index and Well-Being Index

#Distribution of Population, Urban (%) vs Wellbeing Index
Population_Urban <- galaxy_wellbeing %>% 
  drop_na(`Population, urban (%)`)

mean(Population_Urban$`Population, urban (%)`)
median(Population_Urban$`Population, urban (%)`)

ggplot(data = Population_Urban) +   
  geom_density(mapping = aes(x = `Population, urban (%)`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Population, urban (%)`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=81, y=0.017,label="Median Education Index = 75.12952")+
  annotate("text", x=81, y=0.016,label="Mean Education Index = 75.19539")+
  labs(title = "Distribution of Population, Urban (%)")

#Relationship between Population, Urban (%) and Wellbeing Index
ggplot(data = Population_Urban) +   
  geom_point(mapping = aes(x =`Population, urban (%)`, y=`Well-Being Index`, colour="grey"))+
  labs(title = "Population, Urban (%) vs Well-Being Index")
#There is positive correlation between Population, Urban (%) and Well-Being Index

#Distribution of Unemployment, total (% of labour force)
Unemployment_of_labourforce <- galaxy_wellbeing %>% 
  drop_na(`Unemployment, total (% of labour force)`)

mean(Unemployment_of_labourforce$`Unemployment, total (% of labour force)`)
median(Unemployment_of_labourforce$`Unemployment, total (% of labour force)`)

ggplot(data = Unemployment_of_labourforce) +   
  geom_density(mapping = aes(x = `Unemployment, total (% of labour force)`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Unemployment, total (% of labour force)`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=25, y=0.095,label="Median Education Index = 13.13738")+
  annotate("text", x=23, y=0.085,label="Mean Education Index = 14.69586")+
  labs(title = "Distribution of Unemployment, % of Force")

#Relationship between Unemployment, total (% of labour force) and Wellbeing Index
ggplot(data = Unemployment_of_labourforce) +   
  geom_point(mapping = aes(x = `Unemployment, total (% of labour force)`, y=`Well-Being Index`, colour="grey"))+
  labs(title = "Unemployment, % vs Well-Being Index")
#There is a negative correlation between Unemployment, total (% of labour force) and Well-Being Index

#Distribution of Natural Resource Depletion
natural_resource_dep <- galaxy_wellbeing %>% 
  drop_na(`Natural resource depletion`)

median(natural_resource_dep$`Natural resource depletion`)
mean(natural_resource_dep$`Natural resource depletion`)
max(natural_resource_dep$`Natural resource depletion`)

ggplot(data = natural_resource_dep) +
  geom_density(mapping = aes(x = `Natural resource depletion`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Natural resource depletion`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=60, y=0.05,label="Median Resource Dep = 10.80581", angle=45, fontsize=1)+
  annotate("text", x=60, y=0.04, label="Mean Resource Dep = 13.48777", angle=45)+
  labs(title = "Distribution of Natural Resource Dep")

#Relationship between Natural Resource Depletion and Wellbeing Index
ggplot(data = natural_resource_dep) +
  geom_point(mapping = aes(x=`Natural resource depletion`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Resource Depletion vs Wellbeing Index")
#There is a negative correlation between Natural Resource Depletion and Well Being Index

#Distribution of Existence Expectancy at Birth
Expectancy_at_Birth <- galaxy_wellbeing %>% 
  drop_na(`existence expectancy at birth`)

median(Expectancy_at_Birth$`existence expectancy at birth`)
mean(Expectancy_at_Birth$`existence expectancy at birth`)

ggplot(data = Expectancy_at_Birth) +
  geom_density(mapping = aes(x = `existence expectancy at birth`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `existence expectancy at birth`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  annotate("text", x=52, y=0.035,label="Mdn Expectancy at Birth = 78.48289", angle=60, fontsize=1)+
  annotate("text", x=50, y=0.025, label="M Expectancy at Birth = 76.19778", angle=60)+
  labs(title = "Distribution of Expectancy at Birth")

#Relationship: Existence Expectancy at Birth vs Wellbeing Index
ggplot(data = Expectancy_at_Birth)+
  geom_point(mapping=aes(x = `existence expectancy at birth`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Expectancy at Birth vs Wellbeing Index")
#There is a positive correlation between existence expectancy at birth and wellbeing index.

#Relationship: Galactic Year vs Wellbeing Index
ggplot(data = galaxy_wellbeing)+
  geom_point(mapping=aes(x = `galactic year`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Galactic Year vs Wellbeing Index")
#There is no correlation between galactic year and wellbeing index

#Relationship between gross income per capita and Wellbeing index
gross_Inc_per_capita <- galaxy_wellbeing %>% 
  drop_na(`Gross income per capita`)

median(gross_Inc_per_capita$`Gross income per capita`)
mean(gross_Inc_per_capita$`Gross income per capita`)

ggplot(data = gross_Inc_per_capita)+
  geom_point(mapping=aes(x = `Gross income per capita`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Gross_Per_Capita vs Wellbeing Index")
#The is positive correlation between Gross Income per Capita and Wellbeing Index

#Distribution of gross income per capita
ggplot(data = gross_Inc_per_capita) +
  geom_density(mapping = aes(x = `Gross income per capita`, colour="grey", alpha=0.9))+
  geom_histogram(mapping = aes(x = `Gross income per capita`, y = after_stat(density), fill="blue", adjust=1.5, alpha=0.9))+
  labs(title = "Gross Income per Capita")
#The distribution curve is right skewed 

#Relationship between intergalactic development index and wellbeing Index
IDI <- galaxy_wellbeing %>% 
  drop_na(`Intergalactic Development Index (IDI)`)

median(IDI$`Intergalactic Development Index (IDI)`)
mean(IDI$`Intergalactic Development Index (IDI)`)

ggplot(data = IDI)+
  geom_point(mapping=aes(x = `Intergalactic Development Index (IDI)`, y=`Well-Being Index`, colour="grey"))+
  labs(title="IDI vs Wellbeing Index")
#The is positive correlation between Intergalactic Development Index and Wellbeing Index

#Relationship: Intergalactic Development Index (IDI), Rank and Wellbeing Index
IDI_Rank <- galaxy_wellbeing %>% 
  drop_na(`Intergalactic Development Index (IDI), Rank`)

median(IDI_Rank$`Intergalactic Development Index (IDI), Rank`)
mean(IDI_Rank$`Intergalactic Development Index (IDI), Rank`)

ggplot(data = IDI_Rank)+
  geom_point(mapping=aes(x = `Intergalactic Development Index (IDI), Rank`, y=`Well-Being Index`, colour="grey"))+
  labs(title="IDI Rank vs Wellbeing Index")
#There is a negative correlation between Intergalactic Development Index (IDI), Rank and Wellbeing Index

#Relationship: Population using atleast basic drinking-water services (%) and wellbeing
Population_water <- galaxy_wellbeing %>% 
  drop_na(`Population using at least basic drinking-water services (%)`)

median(Population_water$`Population using at least basic drinking-water services (%)`)
mean(Population_water$`Population using at least basic drinking-water services (%)`)

ggplot(data = Population_water)+
  geom_point(mapping=aes(x = `Population using at least basic drinking-water services (%)`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Population_water vs Wellbeing Index")
#There is a positive correlation between % Population using basic drinking water and wellbeing index.

#Relation: Population using atleast basic sanitation services (%) and wellbeing index
Population_sanitation <- galaxy_wellbeing %>% 
  drop_na(`Population using at least basic sanitation services (%)`)

median(Population_sanitation$`Population using at least basic sanitation services (%)`)
mean(Population_sanitation$`Population using at least basic sanitation services (%)`)

ggplot(data = Population_sanitation)+
  geom_point(mapping=aes(x = `Population using at least basic sanitation services (%)`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Population_sanitation vs Wellbeing Index") 
#There is a positive correlation between % Population using basic sanitation and wellbeing index

#Relationship: Gross Capital Formation(% of GGP) and Wellbeing Index
Gross_Capital_form <- galaxy_wellbeing %>% 
  drop_na(`Gross capital formation (% of GGP)`)

median(Gross_Capital_form$`Gross capital formation (% of GGP)`)
mean(Gross_Capital_form$`Gross capital formation (% of GGP)`)

ggplot(data = Gross_Capital_form)+
  geom_point(mapping=aes(x = `Gross capital formation (% of GGP)`, y=`Well-Being Index`, colour="grey"))+
  labs(title="Gross_Capital_Form vs Wellbeing Index") 
#There is zero correlation between Gross Capital Formation(%) and wellbeing Index
