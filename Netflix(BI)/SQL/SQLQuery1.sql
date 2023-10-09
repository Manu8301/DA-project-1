create database netflix
use netflix


select * from netflix_titles;

-- Analysis of Movies vs TV Shows.
SELECT type, COUNT(*) AS count
FROM netflix_titles
GROUP BY type;


-- Create table for Movies
SELECT *
INTO netflix_movies
FROM netflix_titles
WHERE type = 'Movie';

select * from netflix_movies;

-- create table for  TV Shows

Select * into netflix_tvshows
from netflix_titles 
where type='TV Show';

select * from netflix_tvshows;


--Analysis of date added

SELECT
    date_added,
    YEAR(date_added) AS year,
    DATENAME(MONTH, date_added) AS month  --DATENAME is used to extract day/month/year from date_added
INTO
    netflix_dates
FROM
    netflix_movies;

	select * from netflix_dates;

	drop table netflix_dates;

	select * from netflix_dates;
	--Analysis on rating 
	select rating , COUNT(*) as count from netflix_titles group by rating;

	--Top rated 10 movies on Netflix are
	select title,country,rating from netflix_titles;

	--countries with highest rated content.

  /*SELECT country, COUNT(*) AS count
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY count DESC
LIMIT 10;                   LIMIT clause in the MySQL/PostgreSQL query / */

SELECT TOP 10 country, COUNT(*) AS count
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY count DESC;        --TOP clause used for sql server 
	
--Year wise analysis

select top 10 YEAR(date_added) as Year ,COUNT(*) AS Count from netflix_titles group by YEAR(date_added)  order by YEAR(date_added) desc ;

--TOP 10 MOVIE CONTENT CREATING COUNTRIES

SELECT top 10 country, COUNT(*) AS count
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY count DESC;

--Analysis of duration of movies

select duration as Duration ,count(*) as count from netflix_titles group by duration order by count desc;

--Genres vs their count on Netflix

select listed_in as Genre,count(*) as Count from netflix_titles group by listed_in order by Count desc; --deafult ascending
 --group by: This means that all rows with the same country will be treated as a single group

 select  listed_in as Genre,count(*) as count from genree group by listed_in order by count desc;

 EXEC sp_rename 'countries', 'countries_table';
 EXEC sp_rename 'genree', 'genre_table';

 select country ,count(*) as count from countries_table group by country order by count desc;

 select duration, count(*) as count from netflix_titles group by duration order by count desc;