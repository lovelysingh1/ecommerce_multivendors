create database GBSSS_School_Malviya_Nagar;
create database Govt_Boys_Sr_Sec_School_Malviya_Nagar;

show databases;

use GBSSS_School_Malviya_Nagar;
use Govt_Boys_Sr_Sec_School_Malviya_Nagar;

drop database Govt_Boys_Sr_Sec_School_Malviya_Nagar;

create table student_details
				(roll_number int primary key,
				name text,
                fee int);

create table mobile
				(roll_number int primary key,
				name text,
                fees int,
                phone int);
                
                
insert into student_details (roll_number, name, fee) value (1, 'amit', 500), (2, 'khushi', 400), (3, 'lakhan', 600), (4, 'aman', 700);              

desc student_details;

select * from student_details;

select name, fee from student_details;

SELECT * FROM student_details ;

show tables;

show databases;

use GBSSS_School_Malviya_Nagar;


-- safe mode ( '0' false and '1' true ) if you want to off the safe mode then set 0  nither  using 1 
SET SQL_SAFE_UPDATES = 1;

update student_details set name = khushi where fees = 800;     --    wrong update command
UPDATE student_details SET fee = 400 WHERE name = 'khushi';    --    wrong update command

UPDATE student_details SET fee = 400 WHERE name = 'khushi';

UPDATE student_details SET fee = 900 WHERE roll_number = 2;

drop table mobile;

show tables;

update products set name = 'redmi mobile' where serial =  2;

show tables;
select * from products;

insert into products (serial, name, price) value (15, 'rings', 600), (16, 'files', 950);