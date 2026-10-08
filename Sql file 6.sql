show databases;
use umesh;

create table umesh_table (
Emp_id INT PRIMARY KEY, 
first_name Varchar (50),
last_name Varchar (50),
gender varchar (50),
dob date,
emails varchar (100));

select * from umesh_table; 
drop table umesh_table;

  ### Table बनाना (20 Columns Example)

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    gender VARCHAR(10),
    dob DATE,
    email VARCHAR(100),
    phone VARCHAR(15),
    address VARCHAR(200),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    pincode VARCHAR(10),
    department VARCHAR(50),
    designation VARCHAR(50),
    join_date DATE,
    salary DECIMAL(10,2),
    bonus DECIMAL(10,2),
    manager_id INT,
    status VARCHAR(20),
    remarks TEXT
);

desc employees;
select * from employees;

  ###  Row Insert करना (Data डालना)

INSERT INTO employees 
(first_name, last_name, gender, dob, email, phone, address, city, state, country, pincode, department, designation, join_date, salary, bonus, manager_id, status, remarks)
VALUES
('Ranjeet', 'Kumar', 'Male', '1998-05-12', 'ranjeet@example.com', '9876543210', 'Sector 10', 'Delhi', 'Delhi', 'India', '110001', 'IT', 'Data Analyst', '2026-10-08', 45000.00, 5000.00, 101, 'Active', 'Good performer');

  ###  Column Add करना

ALTER TABLE employees ADD blood_group VARCHAR(10);

  ### Data Update करना

UPDATE employees 
SET salary = 50000, bonus = 7000 
WHERE emp_id = 1;

  ###  Row Delete करना

DELETE FROM employees WHERE emp_id = 1;

  ###  Column Delete करना

ALTER TABLE employees DROP COLUMN blood_group;

  




