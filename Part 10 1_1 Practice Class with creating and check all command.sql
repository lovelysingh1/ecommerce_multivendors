show databases;

use house;
          
select database();
          
show tables;

desc monthly_spends;

desc monthly_spend_time_2;

desc students_check;

select * from students_check;
drop table students_check;

select * from monthly_spend_time_2;

rename table monthly_spends to total_spends;

rename table total_spends to monthly_spends;

select * from monthly_spends where who_spent = 'ranjeet';

alter table monthly_spends add column rules boolean default true;

alter table monthly_spends drop column rules;










SHOW CREATE TABLE monthly_spends;

show databases;

use house;

show tables;

select * from monthly_spends;
select * from monthly_spend_time_2;






Create Database Umesh;

show databases;

Create Table Details_2(
Name varchar(255),
Gender char,
Mobile_Number int);

use umesh;

select * from Details_2;

insert tables (sr.no. primery key,





























































drop table monthly_spends;

