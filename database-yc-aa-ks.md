What is the population of the US? (HINT: 278357000)

select name, population
from country
where name = 'United States'

What is the area of the US? (HINT: 9.36352e+06)

Select surfacearea
from country
where name = 'United States'




Which countries gained their independence before 1963?

Select name, indepyear
from country
where indepyear < 1963

List the countries in Africa that have a population smaller than 30,000,000 and a life expectancy of more than 45? (HINT: 37
  entries)

  Select name, population, lifeexpectancy
  from country
  where population <30000000
  and lifeexpectancy >45

Which countries are something like a republic? (HINT: Are there 122 or 143?)

143!

select name, governmentform
from country
where governmentform like '%Republic%'




Which countries are some kind of republic and achieved independence after 1945? (HINT: 92 entries)


select name, governmentform, indepyear
from country
where governmentform like '%Republic%'
and indepyear >1945

Which countries achieved independence after 1945 and are not some kind of republic? (HINT: 27 entries)

select name, governmentform, indepyear
from country
where governmentform not like '%Republic%'
and indepyear >1945




ORDER BY

Which fifteen countries have the lowest life expectancy? (HINT: starts with Zambia, ends with Sierra Leonne)

select name, lifeexpectancy
from country
order by lifeexpectancy
limit 15

Which fifteen countries have the highest life expectancy? (HINT: starts with Andorra, ends with Spain)

select name, lifeexpectancy
from country
where lifeexpectancy Is NOt null
order by lifeexpectancy desc
limit 15


Which five countries have the lowest population density (density = population / surfacearea)? (HINT: starts with Greenland)

select name, population, surfacearea
From country
where population != 0
order by population / surfacearea
limit 5




Which countries have the highest population density?(HINT: starts with Macao)

select name, population, surfacearea
From country
where population != 0
order by population / surfacearea desc
limit 5

Which is the smallest country by area? (HINT: .4)

select name, population, surfacearea
From country
order by surfacearea
limit 1

Which is the smallest country by population? (HINT: 50)?

select name, population, surfacearea
From country
where population != 0
order by population
limit 1

Which is the biggest country by area? (HINT: 1.70754e+07)

select name, population, surfacearea
From country
where population != 0
order by surfacearea desc
limit 1

Which is the biggest country by population? (HINT: 1277558000)

select name, population, surfacearea
From country
where population != 0
order by population desc
limit 1

Who is the most influential head of state measured by population? (HINT: Jiang Zemin)

select name, headofstate
From country
where population != 0
order by population desc
limit 1

Subqueries: WITH
Of the countries with the top 10 gnp, which has the smallest population? (HINT: Canada)

WITH populated_countries AS (
select name, gnp, population
From country
order by gnp desc
limit 10
	)

Select name, gnp, population
FROM populated_countries
Order BY population
limit 1

Of the 10 least populated countries with permament residents (a non-zero population), which has the largest surfacearea? (HINT: Svalbard and Jan Mayen)

WITH least_populated_countries AS (
select name, population, surfacearea
From country
Where population != 0
Order By population
limit 10
	)

Select name, population, surfacearea
FROM least_populated_countries
Order BY surfacearea desc
limit 1

Aggregate Functions: GROUP BY
Which region has the highest average gnp? (HINT: North America)

Select region, AVG(gnp)
FROM country
Group by region
order by AVG(gnp) desc
limit 1

Who is the most influential head of state measured by surface area? (HINT: Elisabeth II)

Select SUM(surfacearea), headofstate
FROM country
Group by headofstate
order by SUM(surfacearea) desc
limit 1

What is the average life expectancy for all continents?

Select continent, AVG(lifeexpectancy)
FROM country
Group by continent
order by AVG(lifeexpectancy)


What are the most common forms of government? (HINT: use count(*))

Select governmentform, Count(*)
FROM country
Group by governmentform
order by count Desc

How many countries are in North America?

Select region, Count(name)
FROM country
Where region = 'North America'
group by region

What is the total population of all continents?

Select sum(population)
FROM country

Stretch Challenges
Which countries have the letter ‘z’ in the name? How many?

Select name
FROM country
Where name Like '%z%'
group by name


Of the smallest 10 countries by area, which has the biggest gnp? (HINT: Macao)
Of the smallest 10 countries by population, which has the biggest per capita gnp?
Of the biggest 10 countries by area, which has the biggest gnp?
Of the biggest 10 countries by population, which has the biggest per capita gnp?
What is the sum of surface area of the 10 biggest countries in the world? The 10 smallest?
What year is this country database from? Cross reference various pieces of information to determine the age of this database.
