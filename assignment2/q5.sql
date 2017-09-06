select * 
	from customer_list cl
		where cl.name ='SUSAN WILSON';
        
select * 
	from film_list fl
		where fl.rating = 'R';


select * 
	from film_list fl, inventory i, rental r
		where fl.rating = 'R'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id;


select * 
	from film_list fl, inventory i, rental r, customer_list cl
		where fl.rating = 'R'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.customer_id = cl.ID
        and cl.name = 'SUSAN WILSON';

select fl.title 
	from film_list fl, inventory i, rental r, customer_list cl
		where fl.rating = 'R'
        and fl.FID = i.film_id
        and i.inventory_id = r.inventory_id
        and r.customer_id = cl.ID
        and cl.name = 'SUSAN WILSON';