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

select author_fname, author_lname, min(released_year) 
from books
group by author_lname, author_fname order by 3 desc limit 1;

select author_fname, author_lname, max(pages) 
from books
group by author_lname, author_fname;

select concat(author_fname,' ',author_lname) as Author, max(pages) 
from books
group by author_lname, author_fname;

select sum(pages) from books;

select sum(pages) as "Pages Written" from books group by author_fname, author_lname;

select avg(released_year) from books;

select released_year, avg(stock_quantity) from books group by released_year;

SELECT author_fname, author_lname, AVG(pages) FROM books
GROUP BY author_lname, author_fname;