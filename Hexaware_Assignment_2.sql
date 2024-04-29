-- schema 
DROP DATABASE IF EXISTS SISDB;

CREATE DATABASE SISDB;

USE SISDB;

DROP TABLE IF EXISTS Students;
CREATE TABLE Students(
	student_id INT Primary Key auto_increment,
    first_name VARCHAR(15),
    last_name VARCHAR(15),
    date_of_birth  VARCHAR(30),
    email VARCHAR(30),
    phone_number VARCHAR(15)
);

DROP TABLE IF EXISTS Courses;
CREATE TABLE Courses(
	course_id INT Primary Key,
	course_name VARCHAR(20),
    credits VARCHAR(5),
    teacher_id INT,
    FOREIGN KEY(teacher_id) references Teacher(teacher_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Enrollments;
CREATE TABLE Enrollments(
	enrollment_id INT Primary Key,
    student_id INT,
    course_id INT,
    enrollment_date VARCHAR(30),
    FOREIGN KEY(student_id) REFERENCES Students(student_id) on delete cascade,
    FOREIGN KEY(course_id) REFERENCES Courses(course_id) on delete cascade
);

DROP TABLE IF EXISTS TEACHER;
CREATE TABLE TEACHER(
	teacher_id INT Primary Key,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    email VARCHAR(30)
);

DROP TABLE IF EXISTS Payments;
CREATE TABLE Payments(
	payment_id INT Primary Key,
    student_id INT,
    amount INT,
    payment_date VARCHAR(30),
    FOREIGN KEY(student_id) REFERENCES Students(student_id) on delete cascade
);

-- values 

use sisdb;

delete from Students;

insert into Students(student_id, first_name, last_name, date_of_birth, email, phone_number)
values (1, 'Shivendra','Thakur','2002-03-26','qwerty@gmail.com','9911111111'),
(2,'Nandigam','Shireen','2001-12-11','asdfgh@gmail.com','9922222222'),
(3,'Om','Merchant','2002-01-22','zxcvbn@gmail.com','9933333333'),
(4,'Sneha','Mathew','2001-05-16','uiop@gmail.com','9944444444'),
(5, 'Sharansh','Nayak','2004-08-09','ghjkl@gmail.com','9955555555'),
(6,'Praveen','Meena','2002-01-05','vbnm@gmail.com','9966666666'),
(7,'Nisha','Jangid','2002-01-01','vbnm345@gmail.com','9977777777'),
(8,'Jayant','Choudhary','2002-07-25','pytre@gmail.com','9991234567'),
(9,'Yash','Parmar','2002-05-26','qryui@gmail.com','9988888888'),
(10,'Soumya','Mahajan','2002-07-23','mbvcx@gmail.com','9900000000');

-- desc Students;
select * from Students;

delete from teacher;
insert into teacher(teacher_id, first_name, last_name ,email)
values (1, 'Indra', 'Shah', 'qawse@gmail.com'),
(2, 'Neha', 'Sharma', 'kijy@gmail.com'),
(3, 'Rahul', 'Sharma', 'rbchsd@gmail.com'),
(4, 'Kanish', 'Kakkad', 'jsk7@gmail.com'),
(5, 'Alakh', 'Pandey', 'cvge9@gmail.com'),
(6, 'Sharad', 'Jain', 'inbfr@gmail.com'),
(7, 'Nisha', 'Bhalse', 'sadwd@gmail.com'),
(8, 'Poonam', 'Mishra', 'drgff8@gmail.com'),
(9, 'Arvind', 'Upadhayay', 'xcdryj@gmail.com'),
(10, 'Kalyani', 'Tiwari', 'dvsf34@gmail.com');

select * from teacher;

delete from courses;
insert into Courses(course_id, course_name, credits, teacher_id)
values(1, 'Sensor and Actuator', '4', 1),
(2, 'TOC', '4', 2),
(3, 'BME', '4', 3),
(4, 'Chemistry', '3', 4),
(5, 'COA', '4', 5),
(6, 'DLD', '4', 6),
(7, 'NLP', '4', 7),
(8, 'Web Tech', '3', 8),
(9, 'Data Structure', '4', 9),
(10, 'FAIML', '3', 10);

select * from courses;

delete from enrollments;
insert into enrollments(enrollment_id, student_id, course_id, enrollment_date)
values(1,1,9,'2020-11-20'),
(2,1,1,'2020-11-20'),
(3,3,2,'2020-11-2'),
(4,4,3,'2020-11-2'),
(5,5,4,'2020-11-2'),
(6,7,4,'2020-11-20'),
(7,10,6,'2020-11-2'),
(8,9,6,'2020-11-20'),
(9,9,7,'2020-11-20'),
(10,10,10,'2020-11-26');

select * from enrollments;

delete from payments;
insert into payments(payment_id, student_id, amount, payment_date)
values(1, 1, 48000, '2020-11-30'),
(2, 2, 48200, '2020-11-28'),
(3, 1, 48000, '2020-11-30'),
(4, 3, 48200, '2020-11-28'),
(5, 5, 48000, '2020-11-30'),
(6, 6, 48200, '2020-11-30'),
(7, 7, 48000, '2020-11-28'),
(8, 8, 48200, '2020-11-30'),
(9, 10, 48000, '2020-11-30'),
(10, 9, 48200, '2020-11-28');

-- TASK 2

-- QUES 1

desc students;

insert into students(first_name, last_name, date_of_birth, email, phone_number)
values('John', 'Doe', '1995-15-08', 'johndoe@example.com', '1234567890');

-- select * from students;

-- Ques 2

-- select * from enrollments;

insert into enrollments(enrollment_id, student_id, course_id, enrollment_date)
values (11, 3, 9, '2020-12-03');

-- Ques 3

-- select * from teacher;

UPDATE teacher
set email = 'poonam@gmail.com'
where teacher_id = 8;

-- Ques 4

-- select * from enrollments;

delete from enrollments
where enrollment_id = 6;

-- Ques 5

-- select * from courses;

update courses
set teacher_id = 1
where course_id = 6;

-- Ques 6

-- select * from students;

delete from students
where student_id = 11;

-- Ques 7

-- select * from payments

update payments
set amount = '47700'
where payment_id = 5;

-- TASK 2

-- Ques 1

select s.student_id, s.first_name, s.last_name, sum(p.amount) as total_payments
from students s INNER JOIN payments p
on s.student_id = p.student_id
where s.student_id = 1
group by s.student_id;

-- Ques 2

select c.course_id, c.course_name, count(e.student_id)
from courses c LEFT JOIN enrollments e
on c.course_id = e.course_id
group by c.course_id;

-- Ques 3

select s.student_id, s.first_name, s.last_name
from students s LEFT JOIN enrollments e
on s.student_id = e.student_id
where e.student_id is NULL;

-- Ques 4

select s.student_id, s.first_name, s.last_name, c.course_name
from students s LEFT JOIN enrollments e
on s.student_id = e.student_id
INNER JOIN courses c on e.course_id = c.course_id
order by s.student_id;

-- Ques 5

select t.teacher_id, t.first_name, t.last_name, c.course_name
from teacher t LEFT JOIN courses c 
on t.teacher_id = c.teacher_id;

-- Ques 6

select s.first_name, s.last_name, c.course_name, e.enrollment_date
from students s INNER JOIN enrollments e
on s.student_id = e.student_id
INNER JOIN courses c on e.course_id = c.course_id
where c.course_name = 'Data Structure';

-- Ques 7

-- select * from payments;

select s.first_name, s.last_name
from students s LEFT JOIN payments p
on s.student_id = p.student_id
where p.amount is NULL;

-- Ques 8

select c.course_id, c.course_name
from courses c LEFT JOIN enrollments e
on c.course_id = e.course_id
where e.course_id is NULL;

-- Ques 9

select e1.student_id
from enrollments e1 INNER JOIN enrollments e2
on e1.student_id = e2.student_id 
and e1.course_id <> e2.course_id
group by e1.student_id
having count(distinct(e1.course_id)) > 1;

-- Ques 10

select t.teacher_id, t.first_name, t.last_name
from teacher t LEFT JOIN courses c
on t.teacher_id = c.teacher_id
where c.teacher_id is NULL;

-- --------------------------------------------------------------------------------------------------------------------------------------------

-- TASK 3

-- Ques 1

/*
select avg(enrollment_count) AS average_students_per_course
from (
    select course_id, count(student_id) as enrollment_count
    from Enrollments
    group by course_id) 
as course_enrollments;
*/

-- Ques 2

/*
select student_id, first_name, last_name
from students
where student_id in (
    select student_id
    from payments
    where amount = (select max(amount) from payments)
);
*/
-- select * from payments;

-- Ques 3

select course_id, course_name
from courses
where course_id in (
    select course_id
    from enrollments
    group by course_id
    having count(*) = (
        select max(enrollment_count)
        from (
            select course_id, count(*) AS enrollment_count
            from enrollments
            group by course_id
        ) as course_enrollments
    )
);


-- Ques 4



-- Ques 5



-- Ques 6

select teacher_id, first_name, last_name
from teacher
where teacher_id not in (
    select distinct teacher_id
    from Courses
);

-- Ques 7

select avg(timestampdiff(year, date_of_birth, CURDATE())) as average_age
from Students;


-- Ques 8

select course_id, course_name
from Courses
where course_id not in (
    select distinct course_id
    from Enrollments
);

-- QUes 9

select student_id, SUM(amount) as total_payments
from Payments
group by student_id;

-- Ques 10

select student_id, first_name, last_name
from students
where student_id in (
    select student_id
    from payments
    group by student_id
    having count(*) > 1
);

-- Ques 11

select s.student_id, s.first_name, s.last_name, sum(p.amount) as total_payments
from students s left join payments p 
on s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;

-- Ques 12

select c.course_name, count(e.student_id) as num_students_enrolled
from courses c left join enrollments e 
on c.course_id = e.course_id
group by c.course_name;

-- Ques 13

select avg(amount) as average_payment_amount
from payments;
