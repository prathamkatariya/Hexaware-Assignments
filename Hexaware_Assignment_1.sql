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

