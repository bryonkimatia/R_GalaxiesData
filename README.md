# Galaxies Data
## Introduction
The galaxies data contains 80 variables that characterise the demographic and socio-economic situation in 181 galaxies over a period of at most 26 years. The data consists of two sets of data: train and validation datasets.
## Objectives
In determining what makes the galaxies better off, we’d like to determine:
# 
• Variables which best explain the variance of the well-being index
#
• The future well-being values of the galaxies
## Analysis
In my analysis of the train data, I used R programming to determine the determinants of the galaxies’ well-being i.e. a positive and negative correlation between the variables and wellbeing index or no correlation. Further, through the visualisation, I determine the type of frequency distribution curve the determinants exhibited i.e. normal distribution, right skewed and left skewed.
The following variables exhibited a positive correlation with respect to the wellbeing index:
# 
• Income Index.
#
• Education Index.
#
• Population, Urban (%).
#
• Existence expectancy at birth.
#
• Gross income per capita.
#
• Intergalactic Development Index (IDI).
#
• Population using at least basic drinking water services (%).
#
•Population using at least basic sanitation services (%).

The following variables exhibited a negative correlation with respect to the wellbeing index:
#
• Unemployment, total (% of labour force).
#
• Natural resource depletion.
#
• Intergalactic Development Index (IDI), Rank

Some of the variables that exhibited zero correlation with respect to the wellbeing index include:
# 
• Gross Capital Formation.
# 
• Galactic Year.

A report of my analysis is shown here: https://drive.google.com/file/d/1lJ8DfU9HL59W1dty3fzDeM6X8oHNBeon/view?usp=sharing


## Predict
In the Prediction of the future wellbeing index, I loaded the Train dataset and cleaned it to remain with variables that are numbers, for me to establish multicollinearity of the variables that relate with the wellbeing index (Coefficients).

After checking multicollinearity, I used the following variables to create a wellbeing index model: Income Index, Education Index, Population, urban (%), Unemployment total (% of labour force), Natural resource depletion, Existence expectancy at birth, Gross income per capita, Intergalactic Development Index (IDI), Intergalactic Development Index (IDI), Rank, Population using at least basic drinking-water services and Population using at least basic sanitation services (%)

After training the wellbeing index model, we can predict the future wellbeing index using variables in the validation dataset. The model settled on is suitable because:
# 
• The F-statistic of the model shows a p-value of less than 2.2e-16, which is tiny, indicating that the p-values significantly relate to the wellbeing index (at least one of our 12 predictors is related to the wellbeing index, hence a Good Model).
# 
• The model has a Multiple R Squared of 0.7057 indicating that 70.57% of the variance in the dependent variable is explained by the independent variables (70% of the variance can be explained by the model).

The model created is as follows:
Well-BeingIndex = 0.142 + (0.07184 * Education Index) - (0.0008711 * Unemployment, total (% of labour force)) - (0.000478 * Natural resource depletion) + (0.0000008094 * Gross income per capita) - (0.0005719906 * Intergalactic Development Index (IDI), Rank) - (0.0006463 * Population using at least basic drinking-water services (%))

Using the validation dataset, the above model was used to predict the future Well-Being Index. The prediction had 720 variables with columns with missing values leading to NA values of the future Well-Being Index.

The prediction analysis report is as shown here: https://drive.google.com/file/d/1RnV3tuGxioVlT31ig-cPnEFILYYjfsYk/view?usp=sharing

The predicted well-being index values: https://docs.google.com/spreadsheets/d/1kH8fyYdLEfR2eapOg-y7RPLm_8ao0Z3g/edit?usp=sharing&ouid=100119395011002891015&rtpof=true&sd=true
