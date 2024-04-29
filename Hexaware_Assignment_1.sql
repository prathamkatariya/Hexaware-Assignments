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

-- Task 2 starts here 
use techshop;

-- Ques 1 solution

select concat(Firstname, ' ', Lastname) as 'name', email from Customers;

-- Ques 2 solution

select orderID, orderDate, firstname from orders, customers
where orders.customerID = customers.customerID
order by orderDate;

select * from customers;

-- Ques 3 solution

-- insert into Customers(CustomerID, FirstName, LastName, Email, Phone, Address)
-- values ('11', 'Nikhil','Goyal','lgkf@gmail.com','9998763450','Indore');

-- select * from Customers where CustomerID = 6;

-- Ques 4 solution

select * from products;
-- update products set Price = price * 1.1;
select * from products;

-- Ques 5 solution

select * from Orders;

-- set autocommit = 0;
-- start transaction;
-- delete from Orders where OrderID = '8';
-- rollback;

select * from Orders;

-- Ques 6 solution

-- insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
-- values('11',1,'2023-09-24', 50000);

select * from Orders;

-- Ques 7 solution

update customers
set lastname = 'Singh', Phone = '9911111123'
where CustomerID = '1';

select * from customers;

update customers
set lastname = 'Thakur', Phone = '9911111124'
where CustomerID = '1';

select * from customers;

-- Ques 8

-- Ques 9 solution

delete from orders where customerid=3;

-- Ques 10 solution

insert into products(productid, productname, description, price)
values(11,'Headphones','for noise cancellation', 40000);

select * from products;

-- Ques 11 solution

alter table orders add column status varchar(30);
update orders set status='pending';
update orders set status='shipped' where orderid in (3,4,5,6);
select * from orders;

-- Ques 12 solution


-- -------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task 3 starts here

-- Ques 1 solution

select * 
from orders o inner join customers c
on o.customerId = c.customerId;

-- Ques 2 solution
select p.productName, sum(od.quantity * p.price) as TotalRevenue
from Products p INNER JOIN OrderDetails od 
on p.ProductId = od.ProductId
group by p.ProductName;

-- Ques 3 solution

-- select * from customers;

select c.firstName, c.lastName, c.address, count(o.OrderId) as Number_Of_Orders
from customers c INNER JOIN Orders o 
on c.CustomerId = o.CustomerId
group by c.CustomerId
having count(o.OrderId) >= 1;
    
-- Ques 4 solution

select p.productName, sum(od.Quantity) as TotalQuantityOrdered
from Products p INNER JOIN OrderDetails od 
on p.ProductId = od.ProductId
group by p.ProductName
order by TotalQuantityOrdered desc
limit 1;
    
-- Ques 5 solution

select productId,ProductName
from products;    

-- Ques 6 solution

select c.FirstName, c.LastName, avg(o.TotalAmount) as AverageOrderValue
from Customers c INNER JOIN Orders o 
on c.CustomerId = o.CustomerId
group by c.CustomerId;
    
-- Ques 7 solution

/*
select o.OrderId, c.CustomerId, c.FirstName, c.LastName, c.Email, c.Address, c.Phone, sum(o.TotalAmount) as TOTAL_AMOUNT
from Customers c INNER JOIN orders o
on o.CustomerId = c.CustomerId
group by c.CustomerID
order by TOTAL_AMOUNT DESC
LIMIT 1;
*/

-- Ques 8 solution

select p.ProductId, p.ProductName, count(od.ProductId)
from Products p LEFT JOIN OrderDetails od
on p.ProductId = od.ProductId
group by p.ProductId;

-- Ques 9 solution

select p.ProductName, c.FirstName
from products p INNER JOIN OrderDetails as od 
on p.ProductId = od.ProductId INNER JOIN Orders o 
on o.OrderId = od.OrderId INNER JOIN Customers c 
on c.CustomerId = o.CustomerId
where p.ProductId = 1;

-- Ques 10 solution

/*
select sum(TotalAmount) as TOTAL_REVENUE
from Orders
where day(OrderDate) > 15;
*/

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Task 4 starts here

-- Ques 1 solution

select c.CustomerId, c.FirstName, c.LastName
from Customers c LEFT JOIN Orders o 
on c.CustomerId = o.CustomerId
where o.OrderId is null;

-- Ques 2 solution

select count(ProductId) as TOTAL_PRODUCTS
from products;

-- Ques 3 solution

select sum(TotalAmount) as TOTALREVENUE
from orders;

-- Ques 4 solution

select avg(Quantity) 
from orderdetails
group by productId;

-- Ques 5 solution

select CustomerId, sum(TotalAmount) AS TOTAL_SPENT_PER_CUSTOMER
from orders
group by CustomerId;

-- Ques 6 solution

select c.CustomerId, c.FirstName, count(o.CustomerId) as TOTAL_ORDER_PER_CUSTOMER
from customers as c 
join orders as o
on c.CustomerId = o.CustomerId
group by CustomerId
order by TOTAL_ORDER_PER_CUSTOMER DESC
limit 1;

-- Ques 7  solution

select ProductID, count(Quantity) as TOTAL_QUANTITY_ORDERED
from orderdetails
group by ProductId;

-- Ques 8 solution

select c.CustomerId, c.FirstName, c.LastName, sum(TotalAmount) as TOTAL_SPENT
from customers as c
join orders as o
on c.CustomerId = o.CustomerId
group by CustomerId
order by TOTAL_SPENT DESC
limit 1;

-- Ques 9 solution

select c.CustomerId, c.FirstName, avg(o.TotalAmount) as AVERAGE_ORDER_VALUE
from orders as o
join customers as c
on c.CustomerId = o.CustomerId
group by c.CustomerId;

-- Ques 10

