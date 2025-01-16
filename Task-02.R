# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the Titanic dataset
titanic <- read.csv("C:/Users/ASUS/Downloads/Titanic-Dataset.csv")

# 1. Data Cleaning

# Check for missing values
colSums(is.na(titanic))

# Impute missing values (example: Age)
titanic$Age[is.na(titanic$Age)] <- median(titanic$Age, na.rm = TRUE)

# Remove duplicates if any
titanic <- distinct(titanic)

# Convert columns to appropriate data types
titanic$Survived <- as.factor(titanic$Survived)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Sex <- as.factor(titanic$Sex)
titanic$Embarked <- as.factor(titanic$Embarked)

# 2. Exploratory Data Analysis (EDA)

# Summary statistics
summary(titanic)

# Univariate Analysis
# Plot distribution of Age
ggplot(titanic, aes(x = Age)) +
  geom_histogram(bins = 30, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Passenger Ages", x = "Age", y = "Count")

# Bar chart for Sex
ggplot(titanic, aes(x = Sex)) +
  geom_bar(fill = c("blue", "pink")) +
  labs(title = "Gender Distribution", x = "Sex", y = "Count")

# Count of Pclass
ggplot(titanic, aes(x = Pclass)) +
  geom_bar(fill = "lightgreen") +
  labs(title = "Passenger Class Distribution", x = "Class", y = "Count")

# Bivariate Analysis
# Survival by Gender
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Gender", x = "Gender", y = "Count")

# Survival by Class
ggplot(titanic, aes(x = Pclass, fill = Survived)) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Passenger Class", x = "Class", y = "Count")

# Relationship between Age and Survival
ggplot(titanic, aes(x = Age, fill = Survived)) +
  geom_histogram(bins = 30, position = "dodge") +
  labs(title = "Age Distribution by Survival", x = "Age", y = "Count")

# Survival by Class and Gender
ggplot(titanic, aes(x = Sex, fill = Survived)) +
  facet_wrap(~Pclass) +
  geom_bar(position = "dodge") +
  labs(title = "Survival by Gender and Class", x = "Gender", y = "Count")

# Correlation Heatmap (if numeric columns exist)
# library(corrplot)
# numeric_data <- titanic %>% select_if(is.numeric)
# corrplot(cor(numeric_data, use = "complete.obs"), method = "color")

