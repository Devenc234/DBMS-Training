select * 
	from category c, film_category fc, inventory i, rental r
		where
        c.category_id = fc.category_id 
        and c.name = 'Sports'
        and fc.film_id= i.film_id
        and i.inventory_id = r.inventory_id;
        
select * 
	from film_list f
		where f.category = 'Sports';

select cl.ID ,cl.name, count(all cl.ID)
	from rental r, customer_list cl
		where
        r.customer_id = cl.ID  and cl.country = 'India'
        Group by cl.ID;
        
