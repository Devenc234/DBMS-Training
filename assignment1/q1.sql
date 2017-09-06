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