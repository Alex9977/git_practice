-- AUTHOR: AH
-- PROJECT: World Populations SQL Practice II

SELECT *
FROM countries
LIMIT 1;

SELECT *
FROM population_years
LIMIT 1;

-- Q3: 56
SELECT COUNT(*)
FROM countries
WHERE continent = 'Africa';

-- Q4: 32.7
SELECT ROUND(SUM(population_years.population),1) AS 'Oceania Tot Pop'
FROM population_years
INNER JOIN countries
ON population_years.country_id = countries.id
WHERE countries.continent = 'Oceania'
AND year = 2005;

-- Q5: 25.9
SELECT ROUND(AVG(population_years.population),1) AS 'SA AVG Pop'
FROM population_years
INNER JOIN countries
ON population_years.country_id = countries.id
WHERE countries.continent = 'South America' 
AND year = 2003;

-- Q6: Niue
SELECT countries.name, population_years.population
FROM countries
INNER JOIN population_years
ON countries.id = population_years.country_id
WHERE population_years.population IS NOT NULL
ORDER BY population_years.population
LIMIT 1;

-- Q7: 38.6 years
SELECT ROUND(AVG(population_years.population),1)
FROM population_years
JOIN countries
ON population_years.country_id = countries.id
WHERE countries.name = 'Poland';

-- Q8: 4 (or maybe 0 for "%The %")
SELECT COUNT(*)
FROM countries
WHERE name LIKE '%The%';

-- Q9  Continent	Population
--     Africa	    9972.3
--     Asia	      43060.6
--     Europe	    7991.5
--     North America	5643.8
--     Oceania	  359.5
--     South America	4096.1
SELECT countries.continent AS 'Continent', 
  ROUND(SUM(population_years.population),1) AS 'Population'
FROM countries
JOIN population_years
ON countries.id = population_years.country_id
GROUP BY countries.continent;
