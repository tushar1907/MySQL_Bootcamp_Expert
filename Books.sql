 
 use sakila;
 
 SELECT * FROM actor where not first_name = "ED";
 
 show databases;
 
 Create table pastires(name varchar(50), quantity int);
 
 show tables;
 
 desc pastires;
 
 drop table pastires;
 
 create table cats (name varchar(50), age int);
 
 insert into cats(name, age) values('Blacky', 3),('Green', 2),('Pussy', 1);
 
 desc cats;
 
 Select name as 'Cat Name' from cats;
 
 delete from cats;
 
 UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
 
 Select cat_id as ID,age from cats where cat_id=age;
 
 create table people(first_name varchar(20), last_name varchar(20), age int);
 
 insert into people(first_name, last_name, age) values('Tushar','Gupta',27),('Mitali','Gupta',26),('Suman','Gupta',28);
 
 Select * from people;
 
 show warnings;
 
 desc cats;
 
INSERT INTO cats(name, breed, age) 
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
 
 create table cats2 (name varchar(20) not null, age int not null);
 
 desc cats2;
 
 create table cats (cat_id int not null auto_increment,
 name varchar(20),
 breed varchar(20),
 age int,
 primary key(cat_id));
 
 desc cats3
 
create table employee( id int auto_increment not null,
last_name varchar(20) not null,
first_name varchar(20) not null,
middle_name varchar(20),
age int not null,
currebt_status varchar(20) not null default 'employed',
primary key (id));

desc employee;

drop table cats2;

create database shirt_db;

create table shirts (shirt_id int auto_increment not null,
article varchar(20),
color varchar(20),
shirt_size varchar(1),
last_worn int,
primary key(shirt_id));

use shirt_db;

show tables;

desc shirts;

insert into shirts (article,color,shirt_size,last_worn)
values ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

select * from shirts;

drop table shirts;

UPDATE shirts SET last_worn=0 WHERE last_worn=15;

update shirts set shirt_size='L' where article='polo shirt';

update shirts set shirt_size='X',color='off white' where color='white';

delete from shirts where last_worn=200;

delete from shirts where article='tank top';

delete from shirts;

