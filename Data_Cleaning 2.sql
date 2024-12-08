-- Data Cleaning

SELECT * 
FROM layoffs;

--  1 Remove Duplicates
-- 	2. Standardize the Data
--  3. Null or blank values
--  4. Remove Any Columns or Rows

CREATE TABLE layoffs_staging  -- This is like a duplicate of the data so incase there is a mistake on the raw data
LIKE layoffs;

SELECT * 
FROM layoffs_staging;    

INSERT layoffs_staging 
SELECT *
FROM layoffs;                                -- we inserted the data from the original table into the duplicate table


SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company,industry,total_laid_off,percentage_laid_off,`Date`)  as row_num
FROM layoffs_staging;    

WITH Duplicate_CTE AS 
(
SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`Date`,stage,country,funds_raised_millions)  as row_num
FROM layoffs_staging
)
SELECT * 
FROM DUplicate_CTE
WHERE row_num  > 1
;

SELECT * FROM layoffs_staging 
WHERE company = 'casper' -- This was just to check to confirm if there was a duplicate to confirm the query above --
;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT * 
FROM layoffs_staging2 
;

INSERT INTO  layoffs_staging2
SELECT * ,
ROW_NUMBER() OVER( 
PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`Date`,stage,country,funds_raised_millions)  as row_num
FROM layoffs_staging ;

DELETE
FROM layoffs_staging2      -- tHIS IS TO REMOVE  THE DUPLICATES using the row number (it showed 2 if it was a duplicate)
where row_num > 1
;

SELECT * 
FROM layoffs_staging2 
where row_num > 1
;

-- Standardizing data (Finding issues in your data and fixing it)

SELECT company, TRIM(company)
FROM layoffs_staging2
;

UPDATE layoffs_staging2
SET company = TRIM(company)
;
-- Some processes are just to check they arent all in sequential order

SELECT  Distinct(industry)   
FROM layoffs_staging2
ORDER BY 1     -- THE by 1 stands for the position of the first column we are calling after the select on the line of code --we are odering by industry)
;

SELECT * 
FROM layoffs_staging2
where industry LIKE 'CRYPTO%'
;


UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%'
;


SELECT DISTINCT country
FROM layoffs_staging2
order by 1
;

SELECT DISTINCT country , TRIM(TRAILING '.' FROM country) -- This is to check how it will look like or what to do before updating the table specifically with this code
FROM layoffs_staging2
ORDER BY 1;


UPDATE layoffs_staging2 
SET country = TRIM(TRAILING '.'FROM country)
WHERE country LIKE 'United States%' ;

SELECT `date`, 
STR_TO_DATE(`date`, '%m/%d/%y')
FROM layoffs_staging2;

UPDATE layoffs_staging2 
SET `date` = STR_TO_DATE(`date`, '%m/%d/%y')
;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT * 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL
;

SELECT *   -- WE used this because previously we discovered there were nulls and blanks('.'.. i.e Just empty) in the industry column 
FROM layoffs_staging2
WHERE industry IS NULL
OR industry = '';

UPDATE layoffs_staging2    -- Came back here to do this to make blanks null so we can easily use it in the code below
SET industry = NULL 
WHERE industry = '';

SELECT *    
FROM layoffs_staging2
WHERE company = 'Airbnb'
;

SELECT  t1.industry, t2.industry                                        -- Joined the table to itself to check where industry is null/blank to where industry has values or is populated
FROM layoffs_staging2 t1                 
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry IS NULL OR t1 .industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry 
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL;
    
DELETE 
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

SELECT * 
FROM layoffs_staging2;

ALTER TABLE layoffs_staging2        -- We do not need the row number any more becase we did that to remove duplicates
DROP COLUMN row_num
