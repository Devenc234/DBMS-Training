use sakila;

select film_id, title, description 
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
        
select f.film_id,f.title 
	from category c , film_category fc, film f
		where c.category_id = fc.category_id
        and c.name = 'Comedy'
        and fc.film_id = f.film_id
        and f.rating ='PG-13';