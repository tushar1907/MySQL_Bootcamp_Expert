use sakila;

select count(*) as count from books;

select count(distinct concat(author_fname,' ',author_lname)) as count from books;

select count(*) from books where title like '%the%';