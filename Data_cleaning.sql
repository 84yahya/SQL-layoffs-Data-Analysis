USE data_cleaning;
select * from employee_layoffs2;

select distinct(country) from employee_layoffs2;

# checking datatypes of all the columns

DESCRIBE employee_layoffs2;

SELECT *
FROM employee_layoffs2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

DELETE FROM employee_layoffs2
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

select * from employee_layoffs2 where industry = '';

select * from employee_layoffs2 where company = 'Airbnb';

UPDATE employee_layoffs2
SET industry = 'Travel'
WHERE company = 'Airbnb';

select * from employee_layoffs2 where company = 'Carvana';

UPDATE employee_layoffs2
SET industry = 'Transportation'
WHERE company = 'Carvana';

select * from employee_layoffs2 where company = 'Juul';

UPDATE employee_layoffs2
SET industry = 'SF Bay Area'
WHERE company = 'Juul';


SELECT COUNT(total_laid_off) AS total_laid_off_count,
    AVG(total_laid_off) AS avg_total_laid_off,
    COUNT(percentage_laid_off) AS percentage_laid_off_count,
    AVG(percentage_laid_off) AS avg_percentage_laid_off
FROM employee_layoffs2;

# checking deviations in both these columns
SELECT
    AVG(total_laid_off) AS avg_total_laid_off,
    STDDEV(total_laid_off) AS std_total_laid_off,
    AVG(percentage_laid_off) AS avg_percentage_laid_off,
    STDDEV(percentage_laid_off) AS std_percentage_laid_off
FROM employee_layoffs2;

# Dropping a column "row_num" because we do not need it.

ALTER TABLE employee_layoffs2
DROP COLUMN row_num;

