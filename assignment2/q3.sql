select * 
	from film_list fl
		where fl.category = 'Animation';
        
        
select * 
	from film_list fl, inventory i, rental r
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id;
        
select count(*) 
	from film_list fl, inventory i, rental r
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id;
        
select * 
	from film_list fl, inventory i, rental r, payment p
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.rental_id = p.rental_id;
        
select count(*) 
	from film_list fl, inventory i, rental r, payment p
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.rental_id = p.rental_id;
        
select sum(p.amount) 
	from film_list fl, inventory i, rental r, payment p
		where fl.category = 'Animation'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.rental_id = p.rental_id;