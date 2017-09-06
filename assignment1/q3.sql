select * from customer_list where country = 'India';

select count(*) from film_list fl,rental r, customer_list cl where fl.category = 'Sports' and cl.ID = r.customer_id;

select * 
	from rental r, customer_list cl 
		where cl.ID = r.customer_id;

select * from film_list fl ;

select * from film_list fl where fl.category = 'Sports';


-- all have different inventory id
select * from film_list fl, inventory i 
			where fl.category = 'Sports' and fl.FID = i.film_id;
            
-- all have different inventory id, now all have different customer id
select * from film_list fl, inventory i , rental r
			where fl.category = 'Sports' and fl.FID = i.film_id and r.inventory_id = i.inventory_id;


-- all have different inventory id, now all have different customer id , grouping customer id
select r.customer_id, count(all r.customer_id) from film_list fl, inventory i , rental r
			where fl.category = 'Sports' and fl.FID = i.film_id and r.inventory_id = i.inventory_id
            Group by r.customer_id;

select * from customer_list 
	where country = 'India' and ID in 
						(
							select r.customer_id from film_list fl, inventory i , rental r
								where fl.category = 'Sports' and fl.FID = i.film_id and r.inventory_id = i.inventory_id
								Group by r.customer_id
                        );


-- --checking the result 
-- select * from customer_list
-- 	where country = 'India'
--     
-- --Persons who have not rented sports movies and are from India
-- select * from customer_list
-- 	where country = 'India'
--     minus
--     
--     (select * from customer_list 
-- 	where country = 'India' and ID in 
-- 						(
-- 							select r.customer_id from film_list fl, inventory i , rental r
-- 								where fl.category = 'Sports' and fl.FID = i.film_id and r.inventory_id = i.inventory_id
-- 								Group by r.customer_id
--                         )
-- 	);
    
    