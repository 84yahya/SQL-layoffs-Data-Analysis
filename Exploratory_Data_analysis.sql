# Exploratory Dataanalysis

select * from employee_layoffs2;

# checking maximum layoffs
SELECT MAX(total_laid_off) AS max_layoffs
FROM employee_layoffs2;

# checking 100 percent laid off
SELECT *
FROM employee_layoffs2
WHERE percentage_laid_off = 1;

# grouping by company
SELECT company,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2
GROUP BY company
ORDER BY total_layoffs DESC;

# grouping by industry
SELECT industry,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2
WHERE industry is NOT NULL
GROUP BY industry
ORDER BY total_layoffs DESC;
# layoffs by country
SELECT country,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2
GROUP BY country
ORDER BY total_layoffs DESC;
# layoffs by year
SELECT YEAR(`date`) AS year,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2 
GROUP BY YEAR(`date`)
ORDER BY year;
# layoff by months
SELECT DATE_FORMAT(`date`, '%Y-%m') AS month,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2
GROUP BY month
ORDER BY month;

# companies that raised most funding before layoffs
SELECT company,
       funds_raised_millions,
       total_laid_off
FROM employee_layoffs2
ORDER BY funds_raised_millions DESC;
# average layoff by industry
SELECT industry,
       ROUND(AVG(total_laid_off),2) AS avg_layoffs
FROM employee_layoffs2
GROUP BY industry
ORDER BY avg_layoffs DESC;
# top 10 companies with most layoffs
SELECT company,
       SUM(total_laid_off) AS total_layoffs
FROM employee_layoffs2
GROUP BY company
ORDER BY total_layoffs DESC
LIMIT 10;
# Rolling total of layoffs by month(Window Function)
WITH monthly_layoffs AS
(
    SELECT DATE_FORMAT(`date`, '%Y-%m') AS month,
           SUM(total_laid_off) AS total_off
    FROM employee_layoffs2
    GROUP BY month
)
SELECT month,
       total_off,
       SUM(total_off) OVER(ORDER BY month) AS rolling_total
FROM monthly_layoffs;
