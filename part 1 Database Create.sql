show databases;

Create Database ranjeet;

use ranjeet;

select database();

create table products(
        serial INT PRIMARY KEY,
        name TEXT,
        price INT);
        
show tables;

select * from products;

desc products;

drop table student_details;

drop database student_details;