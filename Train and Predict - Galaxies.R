#Loading Train Dataset
galaxy_wellbeing_set <- read_excel("D:/Portfolio/R PROGRAMMING/STRATHMORE/Data/Train_data.xls")

galaxy_wellbeing_set1 <- galaxy_wellbeing_set[-1:-3] %>% 
  drop_na(`Income Index`, `Education Index`, `Population, urban (%)`, `Unemployment, total (% of labour force)`, `Natural resource depletion`, `existence expectancy at birth`, `Gross income per capita`, `Intergalactic Development Index (IDI)`, `Intergalactic Development Index (IDI), Rank`, `Population using at least basic drinking-water services (%)`, `Population using at least basic sanitation services (%)`, `Gross fixed capital formation (% of GGP)`)

#Getting familiar
head(galaxy_wellbeing_set1)
summary(galaxy_wellbeing_set1)

#Check for multicollinearity
cor_matrix <- cor(galaxy_wellbeing_set1[, c("Income Index", "Education Index","Population, urban (%)", "Unemployment, total (% of labour force)", "Natural resource depletion", "existence expectancy at birth", "Gross income per capita", "Intergalactic Development Index (IDI)", "Intergalactic Development Index (IDI), Rank", "Population using at least basic drinking-water services (%)", "Population using at least basic sanitation services (%)", "Gross capital formation (% of GGP)")])
print(cor_matrix)

colnames(galaxy_wellbeing_set1)

#Create wellbeing index model
wellbeingindexmodel <- lm(`Well-Being Index` ~ `Income Index` + `Education Index` + `Population, urban (%)`  + `Unemployment, total (% of labour force)` + `Natural resource depletion` + `existence expectancy at birth` + `Gross income per capita` + `Intergalactic Development Index (IDI)` + `Intergalactic Development Index (IDI), Rank` + `Population using at least basic drinking-water services (%)` + `Population using at least basic sanitation services (%)`, data = galaxy_wellbeing_set1)

summary(wellbeingindexmodel)

#My model is going to be:
#well-BeingIndex = 0.142 + (0.07184 * Education Index) - (0.0008711 * Unemployment, total (% of labour force)) - (0.000478 * Natural resource depletion) + (0.0000008094 * Gross income per capita) - (0.0005719906 * Intergalactic Development Index (IDI), Rank) - (0.0006463 * Population using at least basic drinking-water services (%))

#Now Predicting the future well-being index
predict(wellbeingindexmodel)
#Loading the validatiob dataset
galaxy_wellbeing_Val <- read_excel("D:/Portfolio/R PROGRAMMING/STRATHMORE/Data/Validation.xls")

predict(wellbeingindexmodel, galaxy_wellbeing_Val)