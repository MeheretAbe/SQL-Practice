-- Task 1 extract the data of customers who are inactive
/*Extract the data of customers who are inactive.
Note: active=0 in the Customer table indicates inactive customers*/

use sakila; 
select *
from customer
where active= '0';

-- Task 2 idnetify the first name, last name and emails of inactive customers
/*Identify the first name, last name, and emails of inactive customers.Note: Use the Customer table.*/

select first_name, last_name, email
from customer
where active= '0';

-- or use the concat function 
SELECT CONCAT(first_name, ' ', last_name) AS full_name, email
from customer
where active= '0';

-- Task 3 identify the store_id having the highest number of inactive customers
/*Identify the store_id having the highest number of inactive customers.Note: Use the Customer table*/

select count(store_id) as count, store_id
from customer
where active ='0' 
group by store_id;


-- Task 4 identify the names of movies that are rated as PG-13
/*Identify the names of movies that are rated as PG-13.Note: Use the Film table.*/

select title, rating 
from film
where rating = 'PG-13';

-- Task 5 idnetify the top three movies with PG-13 rating that have the longest running time
/*Identify the top three movies with PG-13 rating that have the longest running time.Note: Use the Film table.*/

select title, rating, length 
from film
where rating = 'PG-13'
ORDER BY length DESC
LIMIT 3;
 
-- Task 6 find the most popular PG-13 movies based on rental duration
/*Find the most popular PG-13 movies based on rental duration.Note: Use the Film table.*/

select *
from film
where rating = 'PG-13'
ORDER BY rental_duration;
-- or 
select title, rating, rental_duration
from film
where rating = 'PG-13'
ORDER BY rental_duration asc;

-- Task 7 find the average rental cost of movies
/*Find the average rental cost of the movies. Note: Use the Film table.*/
select avg( replacement_cost) as average_rental_cost
from film;


-- Task 8 find the total replacemnt cost of all movies
/*Find the total replacement cost of all movies.Note: The data depicts only one copy for each movie title. 
Use the Film table.*/

SELECT sum(replacement_cost) AS total_replacement_cost
from film;


-- Task 9 identify the number of films from animantion, childern categories
/*Identify the number of films from the following categories:
Animation
Children
Note: Use the film_category and category tables. Identify the category_id for Animation and category_id for Children from the category table. Then, extract the count of 
Animation category_id and Children category_id by using the film_category table.*/ 

select *
from category 
where category_id IN ('2', '3');

select count( category_id) as count, category_id
from film_category 
group by category_id
having category_id IN ('2', '3');



