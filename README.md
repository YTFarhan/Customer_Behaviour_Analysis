# Customer Behaviour Analysis

### Project Overview
This project analyzes customer shopping behavior using transactional and demographic data to uncover insights into spending patterns, customer segments, and purchasing trends. The goal is to demonstrate a complete data analytics workflow, from raw data ingestion to business-ready insights and visualization. The project showcases skills in Python, SQL (PostgreSQL), and Power BI, along with structured analytical thinking and clear communication through reporting.

#

### Tools & Technologies
Python (Jupyter Notebook) – Data loading, cleaning, and exploratory data analysis

PostgreSQL – Data storage and analytical SQL queries

Power BI – Interactive dashboard and data visualization

Pandas, NumPy, Matplotlib/Seaborn – Python data analysis libraries

#

### Dataset Overview

- <a href="https://github.com/YTFarhan/Customer_Behaviour_Analysis/blob/main/customer_shopping_behavior.csv">View Dataset</a>

Records: ~3,900 customer purchases

Features include:
Customer demographics (age, gender, location, subscription status)

Purchase details (category, item, purchase amount)

Shopping behavior (discount usage, frequency, ratings, shipping type)

#

### Python Code
- <a href="https://github.com/YTFarhan/Customer_Behaviour_Analysis/blob/main/Customer%20Shopping%20Behavior%20Analysis.ipynb">View Code</a>

### Project Workflow

1. Data Preparation (Python)

- Loaded the dataset using pandas

- Inspected schema, data types, and summary statistics

- Standardized column names for readability and SQL compatibility

- Handled missing review ratings using median imputation by product category

- Performed feature engineering (e.g., age grouping, purchase behavior metrics)

#

2. Exploratory Data Analysis

- Analyzed distributions of purchase amounts and ratings

- Explored customer demographics and subscription behavior

- Identified trends in discounts, shipping types, and repeat purchases

- Validated data integrity before database insertion

#

3. SQL Analysis (PostgreSQL)

- Loaded cleaned data into PostgreSQL

- Wrote SQL queries to answer key business questions, including:

- Revenue by gender

- Subscriber vs. non-subscriber spending

- High-spending customers using discounts

- Top-rated and most-purchased products

- Customer segmentation based on purchase history

- Revenue contribution by age group

#

### Dashboard

- Built an interactive Power BI dashboard to visualize key insights

Includes:

1. Key KPIs (total customers, total revenue, average rating)

2. Revenue by category and age group
      
3. Sales and customer behavior trends

#

### Results

- Identified high-revenue customer segments by age and subscription status

- Observed stronger average spending among subscribed customers

- Highlighted top-performing products and categories

- Found meaningful differences in purchase behavior based on discounts and shipping type

These insights can support targeted marketing, subscription growth, and product positioning strategies.


#


## Dashboard w/ Insights
<img width="1954" height="1064" alt="Screenshot 2026-02-23 170302" src="https://github.com/user-attachments/assets/55ba1bba-69dd-40ac-b286-957a4abc1d99" />


