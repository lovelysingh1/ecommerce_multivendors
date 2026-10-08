create table students (ID int primary key, tittle text, course_id varchar (50));

alter table students modify column course_id int;

insert into students (id, tittle, course_id) value (1, 'Amit', 101),
(2, 'Riya', 102),
(3, 'Sohan', 103),
(4, 'Neha', 101),
(5, 'Vikas', 102),
(6, 'Pooja', 103),
(7, 'Ramesh', 101),
(8, 'Sunita', 102),
(9, 'Karan', 103),
(10, 'Meena', 101),
(11, 'Ajay', 102),
(12, 'Divya', 103),
(13, 'Manoj', 101),
(14, 'Sneha', 102),
(15, 'Rahul', 103),
(16, 'Kavita', 101),
(17, 'Deepak', 102),
(18, 'Anita', 103),
(19, 'Suresh', 101),
(20, 'Priya', 102);

drop table students;

select * from students;


show tables;

desc students;

select * from students;


CREATE TABLE course (id INT PRIMARY KEY, title VARCHAR(50), price INT);


INSERT INTO course VALUES
(101, 'Math', 1500),
(102, 'Science', 1800),
(103, 'English', 1200),
(104, 'History', 1600),
(105, 'Computer', 2000),
(106, 'Physics', 1900),
(107, 'Chemistry', 1850),
(108, 'Biology', 1750),
(109, 'Economics', 1700),
(110, 'Geography', 1550),
(111, 'Political Science', 1650),
(112, 'Hindi', 1100),
(113, 'Sanskrit', 1000),
(114, 'French', 2100),
(115, 'German', 2200),
(116, 'Art', 1300),
(117, 'Music', 1400),
(118, 'Physical Education', 1250),
(119, 'Business Studies', 1950),
(120, 'Accountancy', 2000);

desc course;

select * from course;

drop table course;

DESC course;
DESC students;

create table teachers (id int primary key, 
					name text);
                    
create table sonu (id varchar (100) primary key, 
					name text);                    

-- PRIMARY KI KO REMOVE KRNE K LIYE
-- 1. Agr CREATE TABLE K THOGUH DIRECTLY PRIMARY KEY
ALTER TABLE sonu DROP PRIMARY KEY;

-- 2. Agr aapne Primary Key alter command se constraint k sath me banai hain
ALTER TABLE sonu 
DROP CONSTRAINT pr_key;                    

-- Add PRIMARY KEY AS CONSTRAINT
ALTER TABLE sonu 
ADD CONSTRAINT pr_key 
PRIMARY KEY (name);                    


-- CREATING FOREIGNT WITH TABLE
CREATE TABLE course (id INT PRIMARY KEY, title VARCHAR(50), price INT);      --  foreign key bnana hai or uske sath hme ek table bnana hai
create table students (ID int primary key, tittle text, course_id INT, CONSTRAINT f_Key FOREIGN KEY (course_id) REFERENCES course (id));    
				--   is wale command me --      hame foreign key ke sath table bnana hai


DESC students;


SHOW CREATE TABLE students;
show databases;  


