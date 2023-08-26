# Laptop Price Prediction

# Introduction
The dataset we chose for is “Laptop Price Prediction” and it is obtained from <a href = "https://www.kaggle.com/datasets/mohidabdulrehman/laptop-price-dataset">Kaggle</a>.
The columns present in the dataset are,
1. Laptop_Id:	Unique Id of the laptop
2. Company :	The manufacturer of the laptop
3. TypeName :	Type (Notebook, Ultrabook, Gaming, etc)
4. Inches :	Screen Size
5. ScreenResolution :	Screen Resolution of the laptop
6. Cpu : CPU brand, Cpu type and CPU Speed
7. Ram :	Laptop RAM
8. Memory :	Hard Disk / SSD Memory
9. Gpu :	Graphics Processing Units (GPU)
10. OpSys :	Operating System
11. Weight :	Weight of the laptop in kg
12. Price :	Price of the laptop in INR

# Questions
•	What aspects affect the final cost of a laptop?
•	Which model provides the most accurate laptop price prediction?

# Methods performed
•	Multiple Linear Regression
•	Ridge Regression
•	Lasso Regression

# EDA

1. Number of companies

2. Mean laptop price with respect to company

3. Distribution of laptop prices

# Multiple Linear Regression
To determine the relationship between two or more independent variables and a dependent variable, utilize multiple linear regression. In this instance, we can examine how the columns are affecting the "Price" column. We can determine which factors contribute to a laptop's overall cost using this model. However, this model has limitations of its own, which is where regularized models come into play.


# Ridge Regression
Ridge regression adds a regularization factor to the common linear regression equation to handle multicollinearity. As a penalty for high regression coefficient values, this regularization term works to reduce the coefficients towards zero and avoid overfitting.
•	It shrinks the parameters. 
•	It uses coefficient shrinking to lessen the complexity of the model.

# LASSO Regression
Lasso regression is a method of regularization that is preferred over other regression techniques for more precise predictions. The approach involves shrinkage, whereby data values are pulled towards a central point, typically the mean. The lasso procedure is designed to favor simpler models that rely on fewer parameters.
The second question that we seek to answer is which of these three models will provide us with the accurate prediction.

