DROP DATABASE IF EXISTS HMBank;

CREATE DATABASE HMBank;

USE HMBank;

DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    DOB VARCHAR(30),
    email VARCHAR(50),
    phone_number VARCHAR(20),
    address VARCHAR(100)
);

DROP TABLE IF EXISTS Accounts;

CREATE TABLE Accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    account_type VARCHAR(20),
    balance DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS Transactions;

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    transaction_type VARCHAR(20),
    amount DECIMAL(10,2),
    transaction_date VARCHAR(30),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
);


-- TASK 2

--  QUES 1

delete from customers;

insert into customers (first_name, last_name, DOB, email, phone_number, address) 
values ('Shivendra','Thakur','2002-03-26','qwerty@gmail.com','9911111111','Indore'),
('Nandigam','Shireen','2001-12-11','asdfgh@gmail.com','9922222222','Jabalpur'),
('Om','Merchant','2002-01-22','zxcvbn@gmail.com','9933333333','Burhanpur'),
('Sneha','Mathew','2001-05-16','uiop@gmail.com','9944444444','Kottyam'),
('Sharansh','Nayak','2004-08-09','ghjkl@gmail.com','9955555555','Lalitpur'),
('Praveen','Meena','2002-01-05','vbnm@gmail.com','9966666666','Guna'),
('Nisha','Jangid','2002-01-01','vbnm345@gmail.com','9977777777','Jaipur'),
('Jayant','Choudhary','2002-07-25','pytre@gmail.com','9991234567','Indore'),
('Yash','Parmar','2002-05-26','qryui@gmail.com','9988888888','Ratlam'),
('Soumya','Mahajan','2002-07-23','mbvcx@gmail.com','9900000000','Khargone');

-- select * from customers

delete from accounts;

insert into accounts (customer_id, account_type, balance) 
values(1, 'savings', 5000.00),
(1, 'current', 2500.00),
(2, 'savings', 7500.00),
(3, 'current', 10000.00),
(4, 'savings', 3000.00),
(5, 'current', 6000.00),
(6, 'savings', 9000.00),
(7, 'current', 15000.00),
(8, 'savings', 2000.00),
(9, 'current', 4000.00);

-- select * from accounts;

delete from transactions;

insert into transactions (account_id, transaction_type, amount, transaction_date) 
values(1, 'deposit', 1000.00, '2021-01-12'),
(2, 'withdrawal', 500.00, '2021-01-11'),
(3, 'deposit', 2000.00, '2021-01-12'),
(4, 'withdrawal', 1000.00, '2021-01-11'),
(5, 'deposit', 1500.00, '2021-01-12'),
(6, 'withdrawal', 2000.00, '2021-01-10'),
(7, 'deposit', 3000.00, '2021-01-12'),
(8, 'withdrawal', 500.00, '2021-01-11'),
(9, 'deposit', 2000.00, '2021-01-11'),
(10, 'withdrawal', 1000.00, '2021-01-10');

-- select * from transactions;

-- TASK 2

-- QUES 2

-- QUES 1

select first_name, last_name, account_type, email
from Customers INNER JOIN Accounts 
on Customers.customer_id = Accounts.customer_id;

-- QUES 2

select c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from Customers c INNER JOIN Accounts a 
on c.customer_id = a.customer_id INNER JOIN Transactions t 
on a.account_id = t.account_id;


-- QUES 3

update Accounts
set balance = balance + 1000
where account_id = 1;

-- select * from Accounts

-- QUES 4

select concat(first_name, ' ', last_name) as full_name
from Customers;

-- QUES 5

delete from Accounts
where balance = 0 and account_type = 'savings';

-- QUES 6

select * from customers
where address = 'Indore';

-- QUES 7

select balance from Accounts
where account_id = 1;

-- QUES 8

select * from accounts
where account_type = 'current' and balance > 1000.00;

-- QUES 9

select * from transactions
where account_id = 3;

-- QUES 10

select account_id, balance * 3 as interest_accrued
from accounts
where account_type = 'savings';

-- QUES 11

select * from accounts
where balance < 5000;

-- QUES 12

select * from customers
where address <> 'Indore';
-- where address not like '%Indore%';

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TASK 3

-- QUES 1

select avg(balance) from accounts;

-- QUES 2

-- select * from accounts;

select account_id, customer_id, account_type, balance 
from accounts
order by balance desc
limit 10;
 
-- QUES 3

select sum(amount) as total_deposits
from Transactions
where transaction_type = 'deposit'
and transaction_date = '2021-01-11';

-- select * from transactions;

-- QUES 4

/*
WITH OldestCustomer as (select customer_id, first_name, last_name
	from Customers
    where DOB = (select min(DOB) from Customers)
),
NewestCustomer AS (
  SELECT customer_id, first_name, last_name
  FROM Customers
  WHERE DOB = (SELECT MAX(DOB) FROM Customers)
)
SELECT 'Oldest Customer:' AS customer_type, oc.customer_id, oc.first_name, oc.last_name
FROM OldestCustomer oc
UNION ALL
SELECT 'Newest Customer:' AS customer_type, nc.customer_id, nc.first_name, nc.last_name
FROM NewestCustomer nc;
*/

-- QUES 5

select t.transaction_id, t.transaction_type, t.amount, t.transaction_date, a.account_type
from Transactions t INNER JOIN Accounts a 
on t.account_id = a.account_id;


-- QUES 6

select c.customer_id, c.first_name, c.last_name, a.account_id, a.account_type, a.balance
from Customers c INNER JOIN Accounts a 
on c.customer_id = a.customer_id;

-- QUES 7

select c.customer_id, c.first_name, c.last_name, t.transaction_id, t.transaction_type, t.amount, t.transaction_date
from Customers c INNER JOIN Accounts a 
on c.customer_id = a.customer_id INNER JOIN Transactions t 
on a.account_id = t.account_id
where a.account_id = 1;


-- QUES 8

select c.customer_id, c.first_name, c.last_name
from Customers c INNER JOIN Accounts a 
on c.customer_id = a.customer_id
group by c.customer_id
having count(a.account_id) > 1;


-- QUES 9

select sum(case when transaction_type = 'deposit' 
	then amount else 0 end) as total_deposits,
       sum(case when transaction_type = 'withdrawal' 
	then amount else 0 end) as total_withdrawals,
       sum(case when transaction_type = 'deposit' 
	then amount else 0 end) - 
       sum(case when transaction_type = 'withdrawal' 
	then amount else 0 end) as difference
from Transactions;


--  QUES 10
/*
select account_id, avg(balance) as average_daily_balance
from (select account_id, sum(balance) as balance
    from Accounts
    where date(transaction_date) between '2021-01-12' and '2021-01-14'
    group by account_id, date(transaction_date)
) as daily_balances
group byaccounts account_id;
*/

-- QUES 11

select account_type, sum(balance) as total_balance
from Accounts
group by account_type;


-- QUES 12

select a.account_id, count(t.transaction_id) as transaction_count
from Accounts a INNER JOIN Transactions t 
on a.account_id = t.account_id
group by a.account_id
order by transaction_count desc;


-- QUES 13

select c.customer_id, c.first_name, c.last_name, a.account_type, sum(a.balance) as total_balance
from Customers c INNER JOIN Accounts a 
on c.customer_id = a.customer_id
group by c.customer_id, a.account_type
having total_balance > 10000;



-- QUES 14

select transaction_id, account_id, transaction_type, amount, transaction_date
from Transactions
where (amount, transaction_date, account_id) in (
    select amount, transaction_date, account_id
    from Transactions
    group by amount, transaction_date, account_id
    having count(*) > 1
);

-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- TASK 4

-- QUES 1

select * from Customers
where customer_id = (
    select customer_id
    from Accounts
    order by balance desc
    limit 1
);

-- QUES 2

select avg(avg_balance) as average_balance
from (
    select customer_id, avg(balance) as avg_balance
    from Accounts
    group by customer_id
    having count(*) > 1
) as avg_balances;

-- QUES 3

select account_id
from Transactions
where amount > (
    select avg(amount)
    from Transactions
);

-- QUES 4

select *
from Customers
where customer_id not in (
    select distinct customer_id
    from Transactions
);

-- QUES 5

select sum(balance) as total_balance
from Accounts
where account_id not in (
    select distinct account_id
    from Transactions
);

-- QUES 6

select *
from Transactions
where account_id = (
    select account_id
    from Accounts
    order by balance
    limit 1
);

-- QUES 7

select customer_id
from Accounts
group by customer_id
having count(distinct account_type) > 1;

-- QUES 8

select account_type, count(*) as account_count,
       (count(*) * 100.0) / (select count(*) from Accounts) as percentage
from Accounts
group by account_type;

-- QUES 9

select *
from Transactions
where account_id in (
    select account_id
    from Accounts
    where customer_id = 1
);

-- QUES 10

select account_type,
       (select sum(balance) from Accounts where account_type = a.account_type) as total_balance
from Accounts a
group by account_type;