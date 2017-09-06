use sakila;

--    Q1 Find out the PG-13 rated comedy movies. DO NOT use the film_list table.

select film_id, title
from film 
	where rating = 'PG-13' and film_id 
		in 
        (select film_id from film_category 
			where category_id 
            in 
            (select category_id 
				from category 
                where category.name = 'Comedy'
			)
		);

-- alternate command
 
select f.film_id,f.title 
	from category c , film_category fc, film f
		where c.category_id = fc.category_id
        and c.name = 'Comedy'
        and fc.film_id = f.film_id
        and f.rating ='PG-13';



--   Q2  Find out the top 3 rented horror movies.

select fl.title , count(all fl.title)
	from film_list fl, inventory i, rental r
		where fl.category = 'Horror'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        Group by title order by count(all fl.title) desc limit 3;



--   Q3  Find out the list of customers from India who have rented sports movies.

select * from customer_list 
	where country = 'India' and ID in 
						(
							select r.customer_id from film_list fl, inventory i , rental r
								where fl.category = 'Sports' and fl.FID = i.film_id and r.inventory_id = i.inventory_id
								Group by r.customer_id
                        );
                        
--   Q4 Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.

select * from customer_list cl
	where cl.country = 'Canada' and ID in
    (
select r.customer_id from actor a, film_actor fa, inventory i, rental r
	where a.first_name = 'NICK' and a.last_name = 'WAHLBERG' and a.actor_id = fa.actor_id
			and fa.film_id = i.film_id and i.inventory_id = r.inventory_id);
            
--   Q5  Find out the number of movies in which “SEAN WILLIAMS” acted.

select count(distinct fa.film_id) 
	from actor a,film_actor fa 
		where a.first_name ='SEAN' and a.last_name='WILLIAMS' and fa.actor_id = a.actor_id;