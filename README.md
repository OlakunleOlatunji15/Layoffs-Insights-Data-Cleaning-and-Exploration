# Exploratory Data Analysis and Data Cleaning on Layoff Trends

## Description

This repository provides SQL scripts for **data cleaning** and **exploratory analysis** on a dataset tracking layoff trends across various companies, industries, and countries. The dataset reveals patterns and insights into workforce reductions, highlighting the sectors, companies, and regions most affected.

### Files

- **Exploratory Data Analysis.sql**: Conducts an in-depth analysis to uncover trends in layoffs, including breakdowns by company, industry, and country.

- **Data_Cleaning 2.sql**: Executes data cleaning tasks, including handling missing values, removing duplicates, and standardizing data formats to prepare for accurate analysis.

## Prerequisites

- **SQL Database**: A SQL-compatible database (e.g., MySQL, PostgreSQL, SQLite) to load and query the dataset.
- **Dataset**: Import the layoff dataset into your database, ensuring it aligns with the table structure referenced in the SQL scripts.

## Key Findings from Exploratory Data Analysis

> ### Insights
>
> - **Companies with 100% Layoffs**: Companies such as *Britishvolt* and *Quibi* had complete workforce reductions, laying off 100% of employees.
>  
> - **Company with the Highest Layoffs**: *Amazon* reported the largest number of layoffs, impacting approximately 18,150 employees.
>
> - **Industry with the Highest Layoffs**: The *Consumer Industry* saw the highest layoff numbers, with around 45,182 employees affected.
>
> - **Country with the Most Layoffs**: The *United States* had the highest total layoffs, with approximately 256,559 employees impacted.
>
> - **Country with the Least Layoffs**: *Poland* had the fewest layoffs, with only 25 employees affected.

## Usage

1. **Load the Data**: Import the layoff dataset into your SQL database.
2. **Run Data Cleaning**: Execute `Data_Cleaning 2.sql` to standardize and clean the data.
3. **Perform Exploratory Data Analysis**: Use `Exploratory Data Analysis.sql` to reveal layoff trends and insights into affected companies, industries, and countries.

## File Descriptions

### Exploratory Data Analysis.sql

- **Purpose**: To analyze layoff patterns, focusing on identifying the companies, industries, and countries most impacted.
- **Sections**:
  - **Company Analysis**: Identifies companies with significant layoffs, including those with complete workforce reductions.
  - **Industry Analysis**: Examines layoffs by industry, pinpointing the most affected sectors.
  - **Country Analysis**: Compares layoffs across countries, highlighting regions with the highest and lowest layoffs.

### Data_Cleaning 2.sql

- **Purpose**: Prepares the dataset by addressing data quality issues, ensuring consistent and clean data for analysis.
- **Sections**:
  - **Missing Value Handling**: Manages null values by imputing or removing them.
  - **Duplicate Removal**: Cleans up duplicate records.
  - **Data Formatting**: Standardizes data types and formats.

## Contributing

If you have suggestions or improvements, please feel free to submit a pull request.
