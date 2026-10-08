SHOW DATABASES;
USE defaultdb;
select dabases();

SHOW TABLES;


desc students;
desc course;

drop database ranjeet;

SELECT * FROM students;
SELECT * FROM course;
show columns from students;

update students set course_id = null where id > 20;      --   is command me hme data me se kisi bhi rows ko update krne ke liye use krte hai

update course set id= null where price > 120;

-- LEFT JOIN
SELECT students.id, students.tittle AS student_name, course.title AS course_name, course.price  FROM students JOIN course ON course.id = students.course_id;
SELECT students.id, students.tittle AS student_name, course.title AS course_name, course.price  FROM students LEFT JOIN course ON course.id = students.course_id;

-- RIGHT JOIN
SELECT students.id, students.tittle AS student_name, course.title AS course_name, course.price  FROM students RIGHT JOIN course ON course.id = students.course_id;
