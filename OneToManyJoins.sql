create database customers;

use customers;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id int,
    foreign key(customer_id) references customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
       
select * from customers; 
      
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/06/06', 33.67, 98);       
 
select * from orders;

-- CrossJoin
SELECT * FROM customers, orders;

-- Implicit Inner Join
select * from customers,orders where customers.id = orders.customer_id;

select first_name, last_name, order_date, amount 
from customers,orders 
where customers.id = orders.customer_id;

-- Explicit Inner Join
select * from customers
join orders on customers.id = orders.customer_id;

SELECT first_name, last_name, order_date, amount 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id;
   
    
SELECT first_name, last_name, order_date, Sum(amount) as 'total_spent' 
FROM customers
JOIN orders
    ON customers.id = orders.customer_id
group by orders.customer_id
order by total_spent desc;

-- Left Join
select * from customers
left join orders on customers.id = orders.customer_id;

select first_name, last_name, ifnull(sum(amount), 0) as total_spent from customers
left join orders on customers.id = orders.customer_id
group by customer_id
order by total_spent;

select * from orders
left join customers on customers.id = orders.customer_id;


-- RIght Join
select * from customers 
right join orders on customers.id = orders.customer_id;

delete from customers where first_name = 'Boy';

drop table orders,customers;

-- On Delete Cascade
CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id int,
    foreign key(customer_id) references customers(id)
    on delete cascade
);
