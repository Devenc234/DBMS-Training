use sakila;

--    Q1 Find out the number of documentaries with deleted scenes.

select count(distinct title) from film where special_features like '%Deleted Scenes%' and film.film_id in 
(select fc.film_id 
	from category c, film_category fc
		where c.name = 'Documentary' and c.category_id = fc.category_id);


--    Q2 Find out the number of sci-fi movies rented by the store managed by Jon Stephens.

select count(*) 
	from category c, film_category fc, inventory i, rental r, staff s
		where c.name = 'Sci-fi'
		and c.category_id = fc.category_id 
        and fc.film_id = i.film_id
        and i.inventory_id = r.inventory_id
        and r.staff_id = s.staff_id
        and s.first_name = 'Jon' and s.last_name ='Stephens';
        
        
select fc.film_id, count(all fc.film_id) 
	from category c, film_category fc, inventory i, rental r, staff s
		where c.name = 'Sci-fi'
		and c.category_id = fc.category_id 
        and fc.film_id = i.film_id
        and i.inventory_id = r.inventory_id
        and r.staff_id = s.staff_id
        and s.first_name = 'Jon' and s.last_name ='Stephens'
        Group by fc.film_id;
        
--    Q3 Find out the total sales from Animation movies.

select sum(p.amount) 
	from film_list fl, inventory i, rental r, payment p
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.rental_id = p.rental_id;


--    Q4 Find out the top 3 rented category of movies  by “PATRICIA JOHNSON”.

select fl.category, count( all fl.category)
	from film_list fl
		where fl.FID 
        in 
        (select i.film_id
		from customer_list cl, rental r, inventory i
		where cl.name = 'PATRICIA JOHNSON'
        and cl.ID = r.customer_id
        and r.inventory_id = i.inventory_id
        Group by i.film_id)
        Group by fl.category order by count(all fl.category) desc, fl.category asc limit 3;

--    Q5 Find out the number of R rated movies rented by “SUSAN WILSON”.

select fl.title 
	from film_list fl, inventory i, rental r, customer_list cl
		where fl.rating = 'R'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.customer_id = cl.ID
        and cl.name = 'SUSAN WILSON';