What is the population of the US? (HINT: 278357000)
SELECT name, population
FROM country
WHERE code = 'USA'


What is the area of the US? (HINT: 9.36352e+06)
SELECT name, surfacearea
FROM country
WHERE code = 'USA'


Which countries gained their independence before 1963?
SELECT name, indepyear
FROM country
WHERE indepyear < 1963 
ORDER BY indepyear ASC


List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37 entries)

SELECT name, continent,population
FROM country
WHERE lifeexpectancy > 45
AND population < 30e6
AND continent = 'Africa'
ORDER BY population DESC ;


Which countries are something like a republic? (HINT: Are there 122 or 143?)
SELECT name, governmentform
FROM country
WHERE governmentform LIKE '%public' 

Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)

SELECT name, governmentform
FROM country
WHERE governmentform LIKE '%public' 
AND indepyear > 1945 ;

Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

SELECT name, governmentform
FROM country
WHERE governmentform NOT LIKE '%public' 
AND indepyear > 1945 ;

Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

SELECT name, lifeexpectancy
FROM country
WHERE lifeexpectancy IS NOT  null
ORDER BY lifeexpectancy ASC
LIMIT 15 ;


Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)
SELECT name, lifeexpectancy
FROM country 
WHERE lifeexpectancy IS NOT null
ORDER BY lifeexpectancy DESC
LIMIT 15 ;


Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)
SELECT name, population, surfacearea
FROM country 
WHERE population > 0
ORDER BY population/surfacearea ASC
LIMIT 5 ;


Which countries have the highest population density?(HINT: starts with Macao)
SELECT name, population, surfacearea
FROM country 
ORDER BY population/surfacearea DESC
LIMIT 5 ;

Which is the smallest country by area? (HINT: .4)
SELECT name, surfacearea
FROM country
WHERE surfacearea = (
SELECT min(surfacearea)FROM country)

Which is the smallest country by population? (HINT: 50)?

SELECT name, population
FROM country
WHERE population > 0
ORDER By population ASC
LIMIT 1;


Which is the biggest country by area? (HINT: 1.70754e+07)
SELECT name, surfacearea
FROM country
WHERE surfacearea = (
SELECT max(surfacearea)FROM country)


Which is the biggest country by population? (HINT: 1277558000)
SELECT name, population
FROM country
WHERE population > 0
ORDER By population DESC
LIMIT 1;

Who is the most influential head of state measured by population? (HINT: Jiang Zemin)
SELECT name, population, headofstate
FROM country
WHERE population > 0
ORDER By population DESC
LIMIT 1;


Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)

WITH top_ten_gnp AS (
SELECT name, population, gnp
	FROM country
	WHERE population > 0 
	AND gnp > 0
	ORDER BY gnp DESC
	LIMIT 10
)
SELECT name, population, gnp
FROM top_ten_gnp
ORDER BY population ASC
LIMIT 10;


Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)

WITH least_populatied AS (
SELECT name, population, surfacearea
	FROM country
	WHERE population > 0 
	AND surfacearea> 0
	ORDER BY population ASC
	LIMIT 10
)
SELECT name, population, surfacearea
FROM least_populatied
ORDER BY surfacearea DESC
LIMIT 10;



Which region has the highest average gnp? (HINT: North America)
SELECT region, AVG(gnp)
FROM country
GROUP BY region
ORDER BY AVG(gnp) DESC


Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)
SELECT headofstate, SUM(surfacearea)
FROM country
GROUP BY headofstate
ORDER BY SUM(surfacearea) DESC

What is the average life expectancy for all continents?

SELECT continent, AVG(lifeexpectancy)
FROM country
GROUP BY continent


What are the most common forms of government? (HINT: use count(*))
SELECT governmentform, COUNT(*)
FROM country
GROUP BY governmentform
ORDER BY count DESC


How many countries are in North America?

SELECT continent, COUNT(country)
FROM country
GROUP BY continent
ORDER BY count DESC

What is the total population of all continents?
SELECT continent, SUM(population)
FROM country
GROUP BY continent
ORDER BY SUM DESC


Which countries have the letter ‘z’ in the name? How many?
SELECT name, country
FROM country
WHERE name LIKE '%Z%'
OR name LIKE '%z%'


Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
WITH smallest_countries AS (
	SELECT name, surfacearea, gnp
	FROM country
	WHERE surfacearea > 0
	AND gnp > 0
	ORDER BY surfacearea ASC
	LIMIT 10
	
	)
SELECT name, surfacearea, gnp
FROM smallest_countries
ORDER BY gnp DESC
LIMIT 10;

Of the smallest 10 countries by population, which has the biggest per capita gnp?

WITH smallest_countries AS (
	SELECT name, population, gnp
	FROM country
	WHERE population > 0
	AND gnp > 0
	ORDER BY population ASC
	LIMIT 10
	
	)
SELECT name, population, gnp
FROM smallest_countries
ORDER BY gnp/population DESC
LIMIT 10;

Of the biggest 10 countries by area, which has the biggest gnp?
WITH largest_countries AS (
	SELECT name, surfacearea, gnp
	FROM country
	WHERE surfacearea > 0
	AND gnp > 0
	ORDER BY surfacearea DESC
	LIMIT 10
	
	)
SELECT name, surfacearea, gnp
FROM largest_countries
ORDER BY gnp DESC
LIMIT 10;

Of the biggest 10 countries by population, which has the biggest per capita gnp?

WITH largest_countries AS (
	SELECT name, population, gnp
	FROM country
	WHERE population > 0
	AND gnp > 0
	ORDER BY population DESC
	LIMIT 10
	
	)
SELECT name, population, gnp
FROM largest_countries
ORDER BY gnp/population DESC
LIMIT 10;



What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
***BIGGEST***
WITH largest_countries AS (
	SELECT name, surfacearea
	FROM country
	WHERE surfacearea > 0
	ORDER BY surfacearea DESC
	LIMIT 10
	
	)
SELECT SUM(surfacearea)
FROM largest_countries


***SMALLEST**

WITH small_countries AS (
	SELECT name, surfacearea
	FROM country
	WHERE surfacearea > 0
	ORDER BY surfacearea ASC
	LIMIT 10
	
	)
SELECT SUM(surfacearea)
FROM small_countries



What year is this country database from? Cross reference various pieces of information to determine the age of this database.

