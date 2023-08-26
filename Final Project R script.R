#install.packages("plyr")
library(plyr)
#install.packages("tidyverse")
library(tidyverse)
#install.packages("stringr")
library(stringr)
#install.packages("janitor")
library(janitor)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("glmnet")
library(glmnet)
#install.packages("Metrics")
library(Metrics)
#install.packages("caret")
library(caret)

#Import the data set
cars <- read.table(file.choose(), sep="," , header = TRUE)

#The first 6 observations of the data set
head(cars)

#Summary of data set
summary(cars)

#Data Cleaning
#Convert all the 'NA' values to '0'
cars[is.na(cars)] <- 0

#Remove the 'km' from 'Mileage' column
cars$Mileage <- gsub("km", " ", cars$Mileage)
str_trim(cars$Mileage)

#Remove the 'Turbo' from 'Engine.volume' column
cars$Engine.volume <- gsub("Turbo" , "", cars$Engine.volume)
str_trim(cars$Engine.volume)

#Replace '4x4' to 'All' in 'Drive.wheels' column
cars$Drive.wheels <- gsub("4x4" , "All", cars$Drive.wheels)

#Convert the appropriate categorical columns to numeric
cars$Levy <- as.numeric(cars$Levy)
cars$Engine.volume <- as.numeric(cars$Engine.volume)
cars$Mileage <- as.numeric(cars$Mileage)

#Convert all the 'NA' values into '0'
cars[is.na(cars)] <- 0

#Summary of the final data set after cleaning
summary(cars)

#Exploratory Data Analysis
options(scipen = 999)
#Histogram for number of cars in each category
ggplot(cars, aes(x=Category)) + geom_histogram(stat="count", fill = "lightblue") +
  theme_classic() + ggtitle("Number of cars in each category")

#Bar plot for car prices according to the color of the car
ggplot(cars, aes(x=Color, y = Price)) + geom_bar(stat = "identity") +
  ggtitle("Car prices according to color of the car")

fuel_type<- table(cars$Fuel.type)
fuel_type<-as.data.frame(fuel_type)
#Bar plot for fuel type
ggplot(fuel_type, aes(x=Var1, y=Freq))+ geom_bar(stat="identity", fill = "black")+
  ggtitle("Types of fuels in cars") + xlab("Fuel Type") + ylab("Frequency")

#Multiple Linear Regression
lm_model <- lm(formula = Price ~ Levy + Engine.volume + Cylinders + 
                 Mileage + Airbags,data=cars)
#summary of linear model
summary(lm_model)

#Chi-square goodness of fit
#Creating a vector consisting of decades (10 years)
cars$Prod..year <- cars$Prod..year - (cars$Prod..year %% 10)

#Data frame consisting of decades and mean of car prices in each decade
decade_sales <- cars %>% group_by(Prod..year) %>% 
  summarize(Price = round(mean(Price),2))%>% as_tibble()

#observed mean of car prices by decade
observed <- c(171.33, 59661.00, 15693.60, 29103.80, 5554.50,
              5003.65, 35716.38, 11305.05, 19440.48, 63006.11)

#expected probabilities of mean of car prices by decade
expected <- c(1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10, 1/10)

#Performing chi square goodness of fit test
res <- chisq.test(x=observed, p=expected)
res

#Two-way ANOVA
cars$Category<- as.factor(cars$Category)
cars$Gear.box.type<- as.factor(cars$Gear.box.type)

levels(cars$Gear.box.type)
levels(cars$Category)

anova<- aov(Price~Category + Gear.box.type + Category:Gear.box.type,data=cars)
summary(anova)

