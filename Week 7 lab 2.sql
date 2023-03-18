use sakila;

-- 1 ID, City, Country

select s.store_id, c.city, cou.country from store s
join address a on s.address_id = a.address_id
join city c on a.city_id = c.city_id
join country cou on c.country_id = cou.country_id;

-- 2 

select * from store;
select * from staff;
select * from payment limit 50;

-- good result here but without the dollar
select sto.store_id, sum(p.amount) from store sto
join staff sta on sto.store_id = sta.store_id
join payment p on sta.staff_id = p.staff_id
group by sto.store_id;

-- Result expected below
select sto.store_id, concat('$', format(sum(p.amount), 2)) as Amount_generated from store sto
join staff sta on sto.store_id = sta.store_id
join payment p on sta.staff_id = p.staff_id
group by sto.store_id;

-- 3 What is the average running time of films by category?

select fc.category_id, avg(f.length) as average_length  from film f
join film_category fc on f.film_id = fc.film_id
group by fc.category_id;

-- 4 simple quesiton but can we do it like that or its not the "proper way" for the top 3

select fc.category_id, avg(f.length) as average_length  from film f
join film_category fc on f.film_id = fc.film_id
group by fc.category_id
order by average_length desc
limit 3;

-- 5

select * from film limit 50;
select * from inventory;
select * from rental;

select f.title, count(r.inventory_id) as Rented_films from film f
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
group by f.title
order by Rented_films desc;

-- 6

select * from category;
select * from payment;

select cat.name, concat('$', format(sum(pay.amount),2)) as gross_revenues from category cat
join film_category fcat on cat.category_id = fcat.category_id
join film f on fcat.film_id = f.film_id
join inventory i on f.film_id = i.film_id
join rental r on i.inventory_id = r.inventory_id
join payment pay on r.rental_id = pay.rental_id
group by cat.name
order by gross_revenues desc
limit 5;

-- 7 

select * from inventory;

select f.title, i.store_id from film f
join inventory i on f.film_id = i.film_id
where f.title = "Academy Dinosaur" and i.store_id = 1;