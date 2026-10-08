show databases;

use house;

select * from monthly_spend_time_2;
select * from students_check;

CREATE TABLE students_check (
    serial INT PRIMARY KEY AUTO_INCREMENT, 
    name VARCHAR(100), 
    age INT CHECK (age < 20)
);

INSERT INTO students_check (name, age) VALUES 
('Ravi', 18),
('Amit', 19),
('Sita', 15),
('Riva', 25);
