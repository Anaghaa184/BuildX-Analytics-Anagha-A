-- 1. WHERE: Find all funding records for startups in Bangalore

SELECT startup_name, industry, amount_usd, funding_year
FROM cleaned_dataset
WHERE city = 'Bangalore';


---- 2. GROUP BY + SUM: Total funding amount raised by each industry

SELECT industry, SUM(amount_usd) AS total_funding
FROM cleaned_dataset
GROUP BY industry
ORDER BY total_funding DESC;


-- 3. ORDER BY DESC: Top 10 startups that raised the highest funding amount

SELECT startup_name, industry, amount_usd
FROM cleaned_dataset
ORDER BY amount_usd DESC
LIMIT 10;


-- 4. GROUP BY + HAVING: Cities with more than 20 funded startups

SELECT city, COUNT(*) AS startup_count
FROM cleaned_dataset
GROUP BY city
HAVING COUNT(*) > 20
ORDER BY startup_count DESC;


-- 5. LIKE: Find all startups related to 'Tech' in their industry name

SELECT startup_name, industry, city, amount_usd
FROM cleaned_dataset
WHERE industry LIKE '%Tech%';


-- 6. Advanced query combining WHERE, GROUP BY, AVG, HAVING, BETWEEN, ORDER BY:
-- Find industries with average funding between 1 million and 50 million USD,
-- considering only records from 2015 onwards, sorted by average funding

SELECT industry, 
       COUNT(*) AS num_startups, 
       AVG(amount_usd) AS avg_funding
FROM cleaned_dataset
WHERE funding_year >= 2015
GROUP BY industry
HAVING AVG(amount_usd) BETWEEN 1000000 AND 50000000
ORDER BY avg_funding DESC;

