-- Exploratory Data Analysis

SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off)  , MAX(percentage_laid_off)			-- Maximum and minimum number of layoffs
FROM layoffs_staging2;

SELECT *  												-- Checking for everything where the percentage laid off  is 100%--
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;
-- companies like Britishvolt,Quibi had 100% layoffs

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;
--Amazon had the highest layoffs with about 18150 layoffs--

SELECT MIN(`date`), MAX(`date`)
FROM layoffs_staging2;

SELECT Industry, SUM(total_laid_off)        -- Checking which industry had the highest number of layoffs--
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;
-- The consumer industry had the highest number of layoffs of about 45182


SELECT Country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY 1
ORDER BY 2 DESC;
-- The country with the highest layoffs 'United States', '256559' and Poland had the lowest with about 25 based on the dataset analyzed


SELECT YEAR(`date`), SUM(total_laid_off)    -- To show the tottal laid off by year using the year function to pick out the year from the Date Column--
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;


SELECT stage, SUM(total_laid_off)    
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, AVG    
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT SUBSTRING(`Date`,6,2) AS `MONTH`,SUM(total_laid_off) -- To select the month via positon 
FROM layoffs_staging2
GROUP BY `MONTH`;

SELECT Month(`Date`) AS `MONTH`,SUM(total_laid_off) -- Alternative way but cannot select Year and month at the same time easiy
FROM layoffs_staging2
GROUP BY `MONTH`;

SELECT SUBSTRING(`Date`,1,7) AS `MONTH`,SUM(total_laid_off) -- To select the YEAR and MONTH via positon 
FROM layoffs_staging2
WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
;

WITH Rolling_Total AS  				-- The main query takes the results from the subquery/CTE (referred to as Rolling_Total), and computes a rolling total of layoffs across months.

(
SELECT SUBSTRING(`Date`,1,7) AS `MONTH`,SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`Date`,1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1 ASC
)
SELECT `MONTH`, total_off,    				-- The window function SUM(total_off) OVER(ORDER BY MONTH) calculates a rolling total of layoffs. It adds up the layoffs for each month and all previous months as you go down the list, creating a cumulative total.
SUM(total_off) OVER(ORDER BY `MONTH`) AS rolling_total
FROM Rolling_Total;

SELECT company, YEAR(`date`),SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company , YEAR( `date`)
ORDER BY 3 desc;




SELECT company, Substring( `date`,1,4),SUM(total_laid_off) -- Alternative way of picking the year via substring
FROM layoffs_staging2
GROUP BY company , Substring( `date`,1,4)
ORDER BY 1 ASC;



WITH Company_Year (company,years,total_laid_off) AS
(
SELECT company, YEAR(`date`) as `YEAR`,SUM(total_laid_off) 
FROM layoffs_staging2
GROUP BY company , YEAR( `date`)
), Company_Year_Rank AS
(
SELECT  *, DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT * 
FROM Company_Year_Rank
WHERE Ranking<=5



