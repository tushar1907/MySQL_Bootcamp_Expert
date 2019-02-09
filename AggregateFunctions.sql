use sakila;

select count(*) as count from books;

select count(distinct concat(author_fname,' ',author_lname)) as count from books;

select count(*) from books where title like '%the%';

select author_lname, count(*) from books group by author_lname;

select author_fname, author_lname, count(*) from books group by author_lname, author_fname;

select released_year, count(*) from books group by released_year;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) released') AS year FROM books GROUP BY released_year;

select min(released_year) from books;

select min(pages) from books;

select max(released_year) from books;

select max(pages) from books;

SELECT MAX(pages), title
FROM books;

select * from books where pages = (select min(pages) from books);