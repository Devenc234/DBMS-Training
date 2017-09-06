select * 
	from category c, film_category fc 
		where 
			c.category_id = fc.category_id and c.name = 'Horror' ;
            
select  *
	from category c, film_category fc, inventory i
		where 
			c.category_id = fc.category_id and c.name = 'Horror'  and fc.film_id= i.film_id;
            
select  fc.film_id,i.inventory_id
	from category c, film_category fc, inventory i, rental r
		where 
			c.category_id = fc.category_id 
            and c.name = 'Horror'  
            and fc.film_id= i.film_id 
            and i.inventory_id = r.inventory_id;

select  i.film_id , count(all i.film_id)
	from category c, film_category fc, inventory i
		where 
			c.category_id = fc.category_id and c.name = 'Horror'  and fc.film_id= i.film_id
            Group by i.film_id order by count(all i.film_id) desc ;

select f.title, f.film_id, count(all i.film_id)
	from category c, film_category fc, inventory i, film f
		where 
			c.category_id = fc.category_id and c.name = 'Horror'  and fc.film_id= i.film_id and i.film_id = f.film_id
            Group by i.film_id order by count(all i.film_id) desc limit 10;
            
select f.title, f.film_id, count(all i.film_id)
	from category c, film_category fc, inventory i, film f
		where 
			c.category_id = fc.category_id and c.name = 'Horror'  and fc.film_id= i.film_id and i.film_id = f.film_id
            Group by i.film_id order by count(all i.film_id) desc, title asc limit 10;
            
select f.title, f.film_id, count(all i.film_id)
	from category c, film_category fc, inventory i, film f
		where 
			c.category_id = fc.category_id and c.name = 'Horror'  and fc.film_id= i.film_id and i.film_id = f.film_id
            Group by i.film_id order by count(all i.film_id) desc, title asc limit 3;