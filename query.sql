-- Challenge 1
-- 1.
-- 1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
select max(rental_duration) as max_duration, min(rental_duration) as min_duration
from film; 
-- 1.2. Express the average movie duration in hours and minutes. Don't use decimals.
select avg(rental_duration) from film;

-- 2. 
-- 2.1 Calculate the number of days that the company has been operating.
select datediff(rental_date, last_update) from rental; 

-- 2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
Alter table rental Add column week_day varchar(10);
update rental 
set week_day = dayname(rental_date);

Alter table rental Add column months varchar(10);
update rental
set months = monthname(rental_date);

select * from rental
limit 10;

-- 3. Retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.
select title, rental_duration from film;

update film
set rental_duration = Not available
where rental_duration IS NULL;

-- Challenge 2
-- 1. 
-- 1.1 The total number of films that have been released.
select count(release_year) from film;

-- 1.2 The number of films for each rating.
select count(film_id), rating from film
group by rating;

-- 1.3 The number of films for each rating, sorting the results in descending order of the number of films. This will help you to better understand the popularity of different film ratings and adjust purchasing decisions accordingly.
select count(film_id), rating from film
group by rating
order by film_id; 

-- 2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places. This will help identify popular movie lengths for each category.
select round(avg(length),2) as avg_length, rating from film 
group by rating 
order by avg(length) desc; 

-- 2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
select avg(length) as avg_length, rating from film
where length > 120
group by rating;
