Project Title
Exploratory Data Analysis and Data Cleaning on Layoff Trends

Description
This repository provides SQL scripts for performing data cleaning and exploratory analysis on a dataset tracking layoff trends across various companies, industries, and countries. The dataset reveals key patterns and insights into workforce reductions, identifying which sectors, companies, and regions are most affected.

Files
Exploratory Data Analysis.sql: This script conducts an in-depth analysis of the dataset, uncovering major trends in layoffs, including breakdowns by company, industry, and country.

Data_Cleaning 2.sql: This script performs data cleaning tasks, such as handling missing values, removing duplicates, and standardizing data formats to prepare for accurate analysis.

Prerequisites
SQL Database: A SQL-compatible database (e.g., MySQL, PostgreSQL, SQLite) where the dataset can be loaded and queried.
Dataset: Import the layoff dataset into your database, ensuring it aligns with the table structure referenced in the SQL scripts.
Findings from Exploratory Data Analysis
Based on the exploratory analysis, here are some key insights:

Companies with 100% Layoffs: Certain companies like Britishvolt and Quibi experienced complete workforce reductions, with 100% of employees laid off.

Company with the Highest Layoffs: Amazon had the largest number of layoffs, impacting approximately 18,150 employees.

Industry with the Highest Layoffs: The Consumer Industry recorded the highest number of layoffs, with a total of around 45,182 employees affected.

Country with the Most Layoffs: The United States saw the largest layoffs overall, totaling about 256,559.

Country with the Least Layoffs: Poland reported the lowest layoff numbers, with only 25 employees affected.

Usage
Load the Data: Import the layoff dataset into your SQL database.

Run Data Cleaning: Start by executing Data_Cleaning 2.sql to prepare and standardize the data.

Perform Exploratory Data Analysis: Use Exploratory Data Analysis.sql to uncover insights into layoff trends, identifying the most affected companies, industries, and countries.

File Descriptions
Exploratory Data Analysis.sql
Purpose: To analyze patterns in layoff data, focusing on understanding which companies, industries, and countries experienced the most significant impacts.
Sections:
Company Analysis: Identifies companies with substantial layoffs, including those with complete workforce reductions.
Industry Analysis: Examines layoffs by industry, pinpointing sectors most affected.
Country Analysis: Compares layoffs across countries, highlighting regions with the highest and lowest layoff rates.
Data_Cleaning 2.sql
Purpose: Ensures data quality by handling missing values, removing duplicates, and formatting inconsistencies.
Sections:
Missing Value Handling: Manages null values by imputing or removing them.
Duplicate Removal: Cleans up duplicate records.
Data Formatting: Standardizes data types and formats across columns.
