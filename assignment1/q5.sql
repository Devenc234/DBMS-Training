select count(distinct fa.film_id) 
	from actor a,film_actor fa 
		where a.first_name ='SEAN' and a.last_name='WILLIAMS' and fa.actor_id = a.actor_id;