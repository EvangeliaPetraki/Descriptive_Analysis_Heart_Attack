# Heart Attack Prediction Analysis in R

## Overview
This R script analyzes a dataset for heart attack prediction based on a variety of health and demographic factors. It uses the [HARP](https://www.kaggle.com/datasets/iamsouravbanerjee/heart-attack-prediction-dataset) dataset (heart_attack_prediction_dataset.csv), which contains attributes such as age, cholesterol levels, triglycerides, and lifestyle factors (e.g., smoking, diet, exercise). This analysis includes descriptive statistics, data visualization, and simple logistic regression modeling for different features to explore their relationships with heart attack risk.

## R packages used
* tidyverse: For data manipulation and visualization.
* vcd: For advanced visualization of categorical data.
* polycor: For polychoric correlation calculations.

## Data Exploration and Preparation


### 1. **Dataset Import and Structure** :

  * The dataset is loaded into the HARP data frame.
  * Basic structure information (dim, str, summary) is used to inspect the number of patients and attributes.
  * Relevant columns are converted to factors for categorical analysis.


### 2. **Descriptive Statistics** :

  * Calculates min, max, and mean values for numeric columns (e.g., Age, Cholesterol, Heart Rate).
  * Summarizes key statistics across demographic and health metrics.


## Visualizations
Visualizations are performed to examine trends and distributions for various health indicators and demographic factors:

  * Gender Analysis:
    * A bar plot shows the distribution of male and female patients.
    * A chi-square test assesses the association between gender and heart attack risk.
  * Age Analysis:
      * Histogram and density plots visualize age distributions and age-related heart attack risk.
      * A logistic regression model (modelAge) is used to examine the relationship between age and heart attack risk.
  * Cholesterol Levels:
      * Histogram and density plots show cholesterol level distributions.
      * A logistic regression model (modelChol) assesses cholesterol's effect on heart attack risk.
  * Triglycerides:
    * Histogram and density plots display triglyceride levels, with density colored by heart attack risk.

  * Diabetes, Obesity, Smoking, Family History:
    * Each factor is visualized using bar plots and mosaic plots to explore their association with heart attack risk.
    * Chi-square tests assess statistical associations for each factor.

  * Diet:
    * Bar plot and mosaic plot show diet distributions and potential associations with heart attack risk.
  
  * Exercise Hours Per Week:
    * Histogram and density plots show the number of exercise hours and related heart attack risk.
    * A logistic regression model (modelEx) assesses the relationship between exercise frequency and heart attack risk.


## Modeling
Logistic regression models are used to evaluate the impact of age, cholesterol levels, and exercise hours on heart attack risk. Each model is summarized to identify significant predictors.
