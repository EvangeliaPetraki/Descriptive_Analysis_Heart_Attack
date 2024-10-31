library(tidyverse)
library(vcd)
library(polycor)
HARP <- read.csv("heart_attack_prediction_dataset.csv")

#First, I want to see the number of patients and the number of
attributes
dim(HARP)
str(HARP)
summary(HARP)

#I convert some columns to factors
HARP$Sex <- factor(HARP$Sex)
HARP$Diabetes <- factor(HARP$Diabetes)
HARP$Family.History <- factor(HARP$Family.History)
HARP$Smoking <- factor(HARP$Smoking)
HARP$Obesity <- factor(HARP$Obesity)
HARP$Alcohol.Consumption <- factor(HARP$Alcohol.Consumption)
HARP$Diet <- factor(HARP$Diet)
HARP$Previous.Heart.Problems <-
factor(HARP$Previous.Heart.Problems)
HARP$Medication.Use <- factor(HARP$Medication.Use)
HARP$Continent <- factor(HARP$Continent)
HARP$Country <- factor(HARP$Country)
HARP$Hemisphere <- factor(HARP$Hemisphere)
HARP$Heart.Attack.Risk <- factor(HARP$Heart.Attack.Risk)

#I find the min, the max and the mean value of the columns with
numeric data
apply(HARP, 2, min)
apply(HARP, 2, max)
mean(HARP$Age)
mean(HARP$Cholesterol)
mean(HARP$Heart.Rate)
mean(HARP$Exercise.Hours.Per.Week)
mean(HARP$Stress.Level)
mean(HARP$Sedentary.Hours.Per.Day)
mean(HARP$Income)
mean(HARP$BMI)
mean(HARP$Triglycerides)
mean(HARP$Physical.Activity.Days.Per.Week)
mean(HARP$Sleep.Hours.Per.Day)

#~~~~~VISUALISATION

#GENDER
plot(HARP$Sex,
 col= 'pink',
 main= 'Number of Men and Women in the dataset',
 xlab= 'Gender',
 ylab = 'Frequency')
length(which(HARP$Sex=='Male'))
length(which(HARP$Sex=='Female'))
ggplot(HARP, aes(Heart.Attack.Risk,
fill=factor(Heart.Attack.Risk))) +
 geom_bar() +
 facet_wrap(~Sex)+
 scale_y_continuous( limits=c(0,4000),breaks=seq(0,4000,200))+
 labs(title = 'Heart Attack risk for Males and Females', x=
'Heart Attack Risk', y= 'Number', fill = '0 = No Risk of HA
1 = Risk of HA')
chisq.test(HARP$Heart.Attack.Risk, HARP$Sex)
assocstats(table(HARP$Heart.Attack.Risk, HARP$Sex))

#~~~~AGE
table(HARP$Age) #I see the number of people in each age
ggplot(HARP, aes(Age, fill = factor(Age), col= 'black'))+
 geom_histogram()+
 labs(title = 'Number of Persons in each age', x='Age',
y='Frequency')+
 scale_x_continuous(breaks = seq(18,93, by=5))+
 scale_y_continuous(breaks = seq(0,400, by=25))

ggplot(HARP, aes(x = Age, fill = factor(Heart.Attack.Risk))) +
 geom_density(alpha = 0.7)+
 scale_x_continuous(breaks = seq(18,93, by=5)) +
 labs( title= 'Risk and No Risk of having a Heart Attack accross
age', x= 'Age', y='Density', fill = '0 = No Risk of HA
1 = Risk of HA')
modelAge <- glm(Heart.Attack.Risk~Age, family = binomial,
data=HARP)
summary(modelAge)

#~~~ CHOLESTEROL
ggplot(HARP, aes(Cholesterol))+
 geom_histogram(fill = 'orange', color = 'black')+
 scale_x_continuous(limits = c(120,400), breaks=seq(120,400,40))+
 labs(title = 'Cholesterol Levels frequency')
ggplot(HARP, aes(x = Cholesterol, fill =
factor(Heart.Attack.Risk))) +
 geom_density(alpha = 0.7)+
 scale_x_continuous(breaks = seq(120,400, by=20)) +
 labs( title= 'Risk and No Risk of having a Heart Attack accross
Cholesterol Levels', x= 'Cholesterol', y='Density', fill = '0 = No
Risk of HA
1 = Risk of HA')
modelChol <- glm(Heart.Attack.Risk~Cholesterol, family = binomial,
data=HARP)
summary(modelChol)

#~~~~ Triglycerides
ggplot(HARP, aes(
 Triglycerides))+
 geom_histogram(color = 'black', fill = 'yellow')+
 scale_x_continuous(limits = c(30,800), breaks=seq(30,830,50))+
 labs(title = 'Triglyceride Levels frequency')
 ggplot(HARP, aes(x = Triglycerides, fill =
factor(Heart.Attack.Risk))) +
 geom_density(alpha = 0.7)+
 scale_x_continuous(limits = c(30,800), breaks=seq(30,830,50))+
 labs( title= 'Triglyceride Levels for different diets', x=
'Triglycerides', y='Density')

#~~~~~~ DIABETES

 plot(HARP$Diabetes,
 col = 'darkred',
 main = 'Number of patients with diabetes in the dataset',
 xlab = 'Diabetes or no diabetes',
 ylab = 'Frequency',
 )


 mosaicplot(table(HARP$Diabetes, HARP$Heart.Attack.Risk),
 main = "Mosaic Plot of Diabetes and Heart Attack
Risk",
 xlab = 'Diabetes',
 ylab = 'Heart Attack risk',
 color = T)
 chisq.test(HARP$Heart.Attack.Risk, HARP$Diabetes)

 #~~~~~~ OBESITY

 plot(HARP$Obesity,
 col = 'purple',
 main = 'Number of patients with Obesity in the dataset',
 xlab = 'Obesity or no Obesity',
 ylab = 'Frequency',
 )


 mosaicplot(table(HARP$Obesity, HARP$Heart.Attack.Risk),
 main = "Mosaic Plot of Obesity and Heart Attack
Risk",
 xlab = 'Obesity',
 ylab = 'Heart Attack risk',
 color = T)

 chisq.test(HARP$Heart.Attack.Risk, HARP$Obesity)

 #~~~~~~ SMOKING

 plot(HARP$Smoking,
 col = 'blue',
 main = 'Number of patients that Smoke in the dataset',
 xlab = 'Smoker or nor Smoker',
 ylab = 'Frequency',
 )


 mosaicplot(table(HARP$Smoking, HARP$Heart.Attack.Risk),
 main = "Mosaic Plot of Smoking and Heart Attack
Risk",
 xlab = 'Smoker or not Smoker',
 ylab = 'Heart Attack risk',
 color = T)

 chisq.test(HARP$Heart.Attack.Risk, HARP$Smoking)

 #~~~~~~ FAMILY HISTORY

 plot(HARP$Family.History,
 col = 'gold',
 main = 'Number of patients that have a Family History of
Heart Problems in the dataset',
 xlab = 'Family History or no Family History',
 ylab = 'Frequency',
 )


 mosaicplot(table(HARP$Family.History, HARP$Heart.Attack.Risk),
 main = "Mosaic Plot of Family History of Heart
Problems and Heart Attack Risk",
 xlab = 'Family History or no Family History',
 ylab = 'Heart Attack risk',
 color = T)

 chisq.test(HARP$Heart.Attack.Risk, HARP$Family.History)

 #~~~~DIET

 ggplot(HARP, aes(x=Diet, fill = factor(Diet)))+
 geom_bar()+
 labs(title = 'Frequency of the different diets', x= 'Types
of Diet', y= 'Frequency', fill = 'Diets')+
 scale_y_continuous(limits = c(0,3000), breaks = seq(0,3000,
by=200))

 mosaicplot(table(HARP$Diet, HARP$Heart.Attack.Risk),
 main = "Mosaic Plot of Diet and Heart Attack Risk",
 xlab = 'Diet',
 ylab = 'Heart Attack risk',
 color = T)

 chisq.test(HARP$Heart.Attack.Risk, HARP$Diet)

#~~~~ EXERCISE HOURS

 hist(HARP$Exercise.Hours.Per.Week, col = 'lightblue',
 main= 'Exercise hours accross the dataset',
 xlab= 'Exercise Hours',
 ylab = 'Frequency')
 ggplot(HARP, aes(x = Exercise.Hours.Per.Week, fill =
factor(Heart.Attack.Risk))) +
 geom_density(alpha = 0.7)+
 scale_x_continuous(breaks = seq(0,20, by=1)) +
 labs( title= 'Risk and No Risk of having a Heart Attack
accross the number of Exercise Hours per day', x= 'Exercise
Hours', y='Density', fill = '0 = No Risk of HA
1 = Risk of HA')

 modelEx <- glm(Heart.Attack.Risk~Exercise.Hours.Per.Week,
family = binomial, data=HARP)
 summary(modelEx)
