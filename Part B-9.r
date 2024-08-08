# Load the necessary libraries
library(readr)
library(dplyr)
library(ggplot2)

# Task 1: Load the Dataset
# Read the dataset into a data frame
purchase_data <- read_csv("customer_purchases.csv")

# Task 2: Data Summary
# Calculate and display the total number of records in the dataset
total_records <- nrow(purchase_data)
cat("Total number of records:", total_records, "\n")

# Calculate and display the total number of unique customers in the dataset
total_customers <- n_distinct(purchase_data$CustomerID)
cat("Total number of unique customers:", total_customers, "\n")

# Task 3: Calculate Statistical Measures
# Calculate and display the mean, median, and standard deviation for PurchaseAmount
mean_purchase <- mean(purchase_data$PurchaseAmount, na.rm = TRUE)
median_purchase <- median(purchase_data$PurchaseAmount, na.rm = TRUE)
std_dev_purchase <- sd(purchase_data$PurchaseAmount, na.rm = TRUE)

cat("Mean Purchase Amount:", mean_purchase, "\n")
cat("Median Purchase Amount:", median_purchase, "\n")
cat("Standard Deviation of Purchase Amount:", std_dev_purchase, "\n")

# Task 4: Customer Segmentation
# Create a new column 'Segment' based on the purchase amount
purchase_data <- purchase_data %>%
  mutate(Segment = ifelse(PurchaseAmount < median_purchase, "Low Spender", "High Spender"))

# Task 5: Visualize Data
# Plot the distribution of PurchaseAmount
ggplot(purchase_data, aes(x = PurchaseAmount)) +
  geom_histogram(binwidth = 10, fill = "blue", color = "black") +
  ggtitle("Distribution of Purchase Amounts") +
  xlab("Purchase Amount") +
  ylab("Frequency")

# Plot the count of Low Spenders vs High Spenders
ggplot(purchase_data, aes(x = Segment)) +
  geom_bar(fill = "orange", color = "black") +
  ggtitle("Count of Low Spenders vs High Spenders") +
  xlab("Segment") +
  ylab("Count")
