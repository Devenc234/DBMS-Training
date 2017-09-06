<h3> Question and answers </h3>
  <p>  
    
    <h2> Find out the PG-13 rated comedy movies. DO NOT use the film_list table. </h2>
    
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
    
   </p>
   
    Find out the top 3 rented horror movies.
    Find out the list of customers from India who have rented sports movies.
    Find out the list of customers from Canada who have rented “NICK WAHLBERG” movies.
    Find out the number of movies in which “SEAN WILLIAMS” acted.
