use customers;

create table reviewers(
	id int auto_increment primary key,
    first_name varchar(100),
    last_name varchar(100));
    
create table series(
	id int auto_increment primary key,
    title varchar(100),
    released_year year(4),
    genre varchar(100));
    
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');
 
 
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
 
create table reviews(
	id int auto_increment primary key,
    rating decimal(2,1),
    series_id int,
    reviewer_id int,
    foreign key(series_id) references series(id),
    foreign key(reviewer_id) references reviewers(id));
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
    
-- Challenge 1
select title, rating from series 
join reviews
			on series.id = reviews.series_id; 
            

-- Challenge 2
select title, avg(rating) as avg_rating from series 
join reviews
			on series.id = reviews.series_id group by series.id order by 2; 


-- Challenge 3
select first_name, last_name, rating from reviewers
inner join reviews 
			on reviewers.id = reviews.reviewer_id;
            
-- Challenge 4            
select title as unreviewed_series from series 
left join reviews
				on series.id = reviews.series_id where rating is null;
                
-- Challenge 5           
select genre, avg(rating) as avg_rating from series 
left join reviews
				on series.id = reviews.series_id group by genre;                
                
-- Challege 6
select 
first_name, 
last_name, 
count(rating) as 'COUNT',
Ifnull(Min(rating), 0) as 'MIN',
Ifnull(Max(rating), 0) as 'MAX',
Round(Ifnull(Avg(rating), 0), 2) as 'AVG',
IF(Count(rating) > 0, 'ACTIVE', 'INACTIVE') as 'STATUS'
from reviewers left join reviews on reviewers.id = reviews.reviewer_id group by reviewers.id;

SELECT 
	first_name, 
	last_name, 
	Count(rating)                    AS COUNT, 
	Ifnull(Min(rating), 0)           AS MIN, 
	Ifnull(Max(rating), 0)           AS MAX, 
	Round(Ifnull(Avg(rating), 0), 2) AS AVG, 
	CASE 
	 WHEN Count(rating) >= 10 THEN 'POWER USER' 
	 WHEN Count(rating) > 0 THEN 'ACTIVE' 
	 ELSE 'INACTIVE' 
	end                              AS STATUS 
FROM   reviewers 
       LEFT JOIN reviews 
              ON reviewers.id = reviews.reviewer_id 
GROUP  BY reviewers.id; 


-- Challenge 7

select title, rating, concat(first_name,' ', last_name) as 'Name' from series
inner join reviews 
	on series.id = reviews.reviewer_id
inner join reviewers
	on reviewers.id = reviews.series_id
    order by title;
