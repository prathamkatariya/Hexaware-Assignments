-- schema
DROP DATABASE IF EXISTS Techshop;

CREATE DATABASE Techshop;

USE Techshop;

drop table if exists customers;

CREATE TABLE Customers(
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(30),
    LastName VARCHAR(30),
    Email VARCHAR(30),
    Phone VARCHAR(15),
    Address VARCHAR(30)
);

drop table if exists products;

CREATE TABLE Products(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR(15),
    Description VARCHAR(30),
    Price INT
);

drop table if exists Orders;

CREATE TABLE Orders(
	OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount INT,
    FOREIGN KEY(CustomerID) REFERENCES Customers(CustomerID)
);

drop table if exists Orderdetails;

CREATE TABLE OrderDetails(
	OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY(OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

drop table if exists inventory;

CREATE TABLE Inventory(
	InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate INT,
    FOREIGN KEY(ProductID) REFERENCES Products(ProductID)
);

-- values
use techshop;

delete from Customers;

insert into Customers(CustomerID, FirstName, LastName, Email, Phone, Address)
values (1, 'Shivendra','Thakur','qwerty@gmail.com','9911111111','Indore'),
(2,'Nandigam','Shireen','asdfgh@gmail.com','9922222222','Jabalpur'),
(3,'Om','Merchant','zxcvbn@gmail.com','9933333333','Burhanpur'),
(4,'Sneha','Mathew','uiop@gmail.com','9944444444','Kottayam'),
(5, 'Sharansh','Nayak','ghjkl@gmail.com','9955555555','Lalitpur'),
(6,'Praveen','Meena','vbnm@gmail.com','9966666666','Guna'),
(7,'Nisha','Jangid','vbnm345@gmail.com','9977777777','Jaipur'),
(8,'Jayant','Choudhary','pytre@gmail.com','9991234567','Indore'),
(9,'Yash','Parmar','qryui@gmail.com','9988888888','Ratlam'),
(10,'Soumya','Mahajan','mbvcx@gmail.com','9900000000','Khargone');

-- desc Customers;
select * from Customers;

delete from Products;

insert into Products(ProductID, ProductName, Description, Price)
values(1, 'Mobiles', 'Multipurpose smartphones', 20000),
(2, 'Tablets', 'Gaming Tablets', 25000),
(3, 'Laptops', 'Business Laptops', 80000),
(4, 'Desktops', 'Personal Computers', 30000),
(5, 'Smart watches', 'Casual Watches', 2000),
(6, 'VRs', 'Experience Vrs', 45000),
(7, 'Play Stations', 'Gaming at top', 49000),
(8, 'Earphones', 'Truely Wireless', 2000),
(9, 'Monitors', 'Home Monitors', 7000),
(10, 'Smart Glasses', '3-D experience', 14000);

-- select * from Products;

delete from Orders;

insert into Orders(OrderID, CustomerID, OrderDate, TotalAmount)
values(1,1,'2024-03-26', 50000),
(2,5,'2024-02-26', 80000),
(3,8,'2023-06-24', 6000),
(4,3,'2024-01-05', 50000),
(5,5,'2024-03-02', 50000),
(6,4,'2024-03-28', 50000),
(7,2,'2023-02-17', 149000),
(8,1,'2023-09-24', 50000),
(9,10,'2023-11-06', 50000),
(10,7,'2024-01-05', 50000);

select * from Orders;

delete from OrderDetails;

insert into OrderDetails(OrderDetailID, OrderID, ProductID, Quantity)
values(1, 1, 1, 1),
(2, 1, 4, 1),
(3, 2, 3, 1),
(4, 3, 5, 3),
(5, 4, 2, 2),
(6, 5, 4, 1),
(7, 5, 8, 10),
(8, 6, 1, 1),
(9, 6, 4, 1),
(10, 7, 3, 1),
(11, 7, 1, 1),
(12, 7, 7, 1),
(13, 8, 1, 1),
(14, 8, 4, 1),
(15, 9, 2, 2),
(16, 10, 4, 1),
(17, 10, 5, 10);

select * from OrderDetails order by orderdetailid;

delete from Inventory;

insert into inventory(inventoryid,productid,laststockupdate)
values(1,2,'2024-01-23'),
(2,1,'2023-11-20'),
(3,3,'2023-09-13'),
(4,8,'2023-12-22'),
(5,6,'2023-09-30'),
(6,8,'2024-02-27'),
(7,9,'2024-03-03'),
(8,10,'2024-03-13'),
(9,1,'2024-04-23'),
(10,3,'2024-04-13');

select * from inventory;

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

