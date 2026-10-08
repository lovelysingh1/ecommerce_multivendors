SHOW DATABASES;

SHOW TABLES;

DESC course;
DESC students;

SELECT DATABASE();

-- CREATING FOREIGNT WITH TABLE
CREATE TABLE course (id INT PRIMARY KEY, title VARCHAR(50), price INT);      --  foreign key bnana hai or uske sath hme ek table bnana hai
create table students (ID int primary key, tittle text, course_id INT, CONSTRAINT f_Key FOREIGN KEY (course_id) REFERENCES course (id));    
				--   is wale command me --      hame foreign key ke sath table bnana hai


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

INSERT INTO course VALUES (121, 'Science', 2500),
(122, 'Music', 1500),
(123, 'English', 1800),
(124, 'Accountancy', 2000);


insert into students (id, tittle, course_id) value (21, 'Amit', 101),
(22, 'Riya', 102),
(23, 'Sohan', 103),
(24, 'Neha', 101),
(25, 'Vikas', 102);




SELECT * FROM course;
SELECT * FROM students;

-- LEFT JOIN
SELECT students.id, students.tittle AS student_name, course.title AS course_name, course.price  FROM students JOIN course ON course.id = students.course_id;
SELECT students.id, students.tittle AS student_name, course.title AS course_name, course.price  FROM students LEFT JOIN course ON course.id = students.course_id;


CREATE TABLE Departments (
Dept_id INT Primary Key,
Dept_name Varchar (100),
Location Varchar (100));

CREATE TABLE Employees (
    Eept_id INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Dept_id INT,
    CONSTRAINT fk_Dept FOREIGN KEY (Dept_id) REFERENCES Departments(Dept_id),
    CONSTRAINT fk_emp FOREIGN KEY (Eept_id) REFERENCES Salaries(sal_id)
);


CREATE TABLE Salaries (
    sal_id INT PRIMARY KEY,
    amount INT,
    pay_date DATE
);



drop table employees;

desc salaries;
select * from salaries;

select * from Employees;

INSERT INTO Departments (Dept_id, Dept_name, Location) VALUES
(1, 'HR', 'Delhi'),
(2, 'Finance', 'Mumbai'),
(3, 'IT', 'Bangalore'),
(4, 'Marketing', 'Chennai'),
(5, 'Sales', 'Kolkata'),
(6, 'Admin', 'Pune'),
(7, 'Support', 'Hyderabad'),
(8, 'Operations', 'Jaipur'),
(9, 'Training', 'Lucknow'),
(10, 'Legal', 'Ahmedabad');


INSERT INTO Salaries (sal_id, amount, pay_date) VALUES
(101, 25000, '2026-05-01'),
(102, 30000, '2026-05-02'),
(103, 28000, '2026-05-03'),
(104, 35000, '2026-05-04'),
(105, 27000, '2026-05-05'),
(106, 40000, '2026-05-06'),
(107, 32000, '2026-05-07'),
(108, 36000, '2026-05-08'),
(109, 33000, '2026-05-09'),
(110, 29000, '2026-05-10');


INSERT INTO Employees VALUES
(101, 'Amit Kumar', 1),
(102, 'Priya Sharma', 2),
(103, 'Rohit Verma', 3),
(104, 'Sneha Gupta', 4),
(105, 'Vikas Singh', 5),
(106, 'Neha Joshi', 6),
(107, 'Arjun Mehta', 7),
(108, 'Kiran Patel', 8),
(109, 'Sunil Yadav', 9),
(110, 'Meena Rani', 10);

