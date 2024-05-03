-- GROUP 1 Car Connect
-- Parul Laad
-- Akanksha Sikarwar
-- Huda Shaikh
-- Pratham Katariya
-- Balaji Senthilkumar

DROP DATABASE IF EXISTS car_connect;
CREATE DATABASE car_connect;
USE car_connect;

DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Vehicle;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Admin;

-- Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(18),
    Address VARCHAR(255),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255),
    RegistrationDate DATE
);

-- Vehicle Table
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY,
    Model VARCHAR(100),
    Make VARCHAR(100),
    Year INT,
    Color VARCHAR(50),
    RegistrationNumber VARCHAR(20) UNIQUE,
    Availability BOOLEAN,
    DailyRate DECIMAL(10, 2)
);

-- Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    CustomerID INT,
    VehicleID INT,
    StartDate DATETIME,
    EndDate DATETIME,
    TotalCost DECIMAL(10, 2),
    Status VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID) ON DELETE CASCADE
);

-- Admin Table
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(18),
    Username VARCHAR(50) UNIQUE,
    Password VARCHAR(255),
    Role VARCHAR(50),
    JoinDate DATE
);

-- Customer Table
INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber, Address, Username, Password, RegistrationDate)
VALUES
    (1, 'Ramesh', 'Patel', 'ramesh@example.com', '+91-1234567890', '123 Street, Mumbai', 'ramesh123', 'password123', '2024-04-01'),
    (2, 'Priya', 'Sharma', 'priya@example.com', '+91-9876543210', '456 Street, Delhi', 'priya456', 'password456', '2024-04-02'),
    (3, 'Amit', 'Singh', 'amit@example.com', '+91-8765432109', '789 Street, Kolkata', 'amit789', 'password789', '2024-04-03'),
    (4, 'Neha', 'Gupta', 'neha@example.com', '+91-7654321098', '456 Street, Bangalore', 'neha456', 'password456', '2024-04-04'),
    (5, 'Rajesh', 'Kumar', 'rajesh@example.com', '+91-6543210987', '789 Street, Hyderabad', 'rajesh789', 'password789', '2024-04-05'),
    (6, 'Pooja', 'Verma', 'pooja@example.com', '+91-5432109876', '123 Street, Chennai', 'pooja123', 'password123', '2024-04-06'),
    (7, 'Sandeep', 'Yadav', 'sandeep@example.com', '+91-4321098765', '456 Street, Pune', 'sandeep456', 'password456', '2024-04-07'),
    (8, 'Kavita', 'Jain', 'kavita@example.com', '+91-3210987654', '789 Street, Ahmedabad', 'kavita789', 'password789', '2024-04-08'),
    (9, 'Arun', 'Sharma', 'arun@example.com', '+91-2109876543', '123 Street, Jaipur', 'arun123', 'password123', '2024-04-09'),
    (10, 'Meena', 'Singh', 'meena@example.com', '+91-1098765432', '456 Street, Lucknow', 'meena456', 'password456', '2024-04-10'),
    (11, 'Anil', 'Yadav', 'anil@example.com', '+91-0987654321', '789 Street, Chandigarh', 'anil789', 'password789', '2024-04-11'),
    (12, 'Neeta', 'Patel', 'neeta@example.com', '+91-9876543210', '123 Street, Surat', 'neeta123', 'password123', '2024-04-12'),
    (13, 'Vijay', 'Kumar', 'vijay@example.com', '+91-8765432109', '456 Street, Indore', 'vijay456', 'password456', '2024-04-13'),
    (14, 'Sunita', 'Sharma', 'sunita@example.com', '+91-7654321098', '789 Street, Bhopal', 'sunita789', 'password789', '2024-04-14'),
    (15, 'Sanjay', 'Verma', 'sanjay@example.com', '+91-6543210987', '123 Street, Nagpur', 'sanjay123', 'password123', '2024-04-15');

-- Vehicle Table
INSERT INTO Vehicle (VehicleID, Model, Make, Year, Color, RegistrationNumber, Availability, DailyRate)
VALUES
    (1, 'SUV', 'Toyota', 2022, 'Black', 'MH01AB1234', TRUE, 2500.00),
    (2, 'Sedan', 'Honda', 2023, 'Red', 'DL02CD5678', TRUE, 2000.00),
    (3, 'Hatchback', 'Maruti', 2021, 'White', 'KA03EF9012', TRUE, 1500.00),
    (4, 'SUV', 'Ford', 2022, 'Blue', 'MH04AB5678', TRUE, 2800.00),
    (5, 'Sedan', 'Hyundai', 2023, 'Silver', 'DL05CD9012', TRUE, 2200.00),
    (6, 'Hatchback', 'Volkswagen', 2021, 'Gray', 'KA06EF3456', TRUE, 1600.00),
    (7, 'SUV', 'Chevrolet', 2022, 'Brown', 'MH07AB7890', TRUE, 2600.00),
    (8, 'Sedan', 'Kia', 2023, 'Green', 'DL08CD1234', TRUE, 2100.00),
    (9, 'Hatchback', 'Nissan', 2021, 'Orange', 'KA09EF5678', TRUE, 1700.00),
    (10, 'SUV', 'Jeep', 2022, 'Yellow', 'MH10AB9012', TRUE, 2700.00),
    (11, 'Sedan', 'BMW', 2023, 'Purple', 'DL11CD3456', TRUE, 2300.00),
    (12, 'Hatchback', 'Audi', 2021, 'Cyan', 'KA12EF7890', TRUE, 1800.00),
    (13, 'SUV', 'Mercedes', 2022, 'Magenta', 'MH13AB1234', TRUE, 2900.00),
    (14, 'Sedan', 'Tesla', 2023, 'Gold', 'DL14CD5678', TRUE, 2400.00),
    (15, 'Hatchback', 'Fiat', 2021, 'Brown', 'KA15EF9012', TRUE, 1900.00);
    
    -- Reservation Table
INSERT INTO Reservation (ReservationID, CustomerID, VehicleID, StartDate, EndDate, TotalCost, Status)
VALUES
    (1, 2, 3, '2024-05-10 06:00:00', '2024-05-15 10:00:00', 12500.00, 'Confirmed'),
    (2, 2, 2, '2024-05-12 09:00:00', '2024-05-14 18:00:00', 8000.00, 'Confirmed'),
    (3, 4, 3, '2024-05-08 12:00:00', '2024-05-10 23:00:00', 5500.00, 'Confirmed'),
    (4, 4, 6, '2024-05-11 10:00:00', '2024-05-17 16:00:00', 13500.00, 'Confirmed'),
    (5, 6, 3, '2024-05-14 09:00:00', '2024-05-16 18:00:00', 6700.00, 'Confirmed'),
    (6, 6, 9, '2024-05-09 12:00:00', '2024-05-11 19:00:00', 4200.00, 'Confirmed'),
    (7, 8, 7, '2024-05-15 05:00:00', '2024-05-20 10:00:00', 15200.00, 'Confirmed'),
    (8, 8, 8, '2024-05-18 09:00:00', '2024-05-20 18:00:00', 7300.00, 'Confirmed'),
    (9, 10, 9, '2024-05-20 05:00:00', '2024-05-22 12:00:00', 6000.00, 'Confirmed'),
    (10, 10, 9, '2024-05-17 10:00:00', '2024-05-23 14:00:00', 14500.00, 'Confirmed'),
    (11, 12, 11, '2024-05-22 09:00:00', '2024-05-24 18:00:00', 8800.00, 'Confirmed'),
    (12, 12, 6, '2024-05-19 12:00:00', '2024-05-21 17:00:00', 4700.00, 'Confirmed'),
    (13, 14, 5, '2024-05-24 10:00:00', '2024-05-29 10:00:00', 16000.00, 'Confirmed'),
    (14, 11, 13, '2024-05-28 09:00:00', '2024-05-30 18:00:00', 7200.00, 'Confirmed'),
    (15, 15, 15, '2024-05-25 08:00:00', '2024-05-27 12:00:00', 5200.00, 'Confirmed');

-- Admin Table
INSERT INTO Admin (AdminID, FirstName, LastName, Email, PhoneNumber, Username, Password, Role, JoinDate)
VALUES
    (1, 'Aarav', 'Patel', 'aarav@example.com', '+91-9876543210', 'aarav', 'adminpassword', 'Super Admin', '2024-04-01'),
    (2, 'Aanya', 'Sharma', 'aanya@example.com', '+91-8765432109', 'aanya', 'adminpassword2', 'Admin', '2024-04-02'),
    (3, 'Advait', 'Singh', 'advait@example.com', '+91-7654321098', 'advait', 'adminpassword3', 'Admin', '2024-04-03'),
    (4, 'Advika', 'Jain', 'advika@example.com', '+91-6543210987', 'advika', 'adminpassword4', 'Admin', '2024-04-04'),
    (5, 'Ahaan', 'Kumar', 'ahaan@example.com', '+91-5432109876', 'ahaan', 'adminpassword5', 'Admin', '2024-04-05'),
    (6, 'Aisha', 'Verma', 'aisha@example.com', '+91-4321098765', 'aisha', 'adminpassword6', 'Admin', '2024-04-06'),
    (7, 'Arjun', 'Yadav', 'arjun@example.com', '+91-3210987654', 'arjun', 'adminpassword7', 'Admin', '2024-04-07'),
    (8, 'Ananya', 'Gupta', 'ananya@example.com', '+91-2109876543', 'ananya', 'adminpassword8', 'Admin', '2024-04-08'),
    (9, 'Aryan', 'Sharma', 'aryan@example.com', '+91-1098765432', 'aryan', 'adminpassword9', 'Admin', '2024-04-09'),
    (10, 'Avni', 'Joshi', 'avni@example.com', '+91-0987654321', 'avni', 'adminpassword10', 'Admin', '2024-04-10'),
    (11, 'Ayaan', 'Singh', 'ayaan@example.com', '+91-9876543210', 'ayaan', 'adminpassword11', 'Admin', '2024-04-11'),
    (12, 'Ayushi', 'Pandey', 'ayushi@example.com', '+91-8765432109', 'ayushi', 'adminpassword12', 'Admin', '2024-04-12'),
    (13, 'Dhruv', 'Yadav', 'dhruv@example.com', '+91-7654321098', 'dhruv', 'adminpassword13', 'Admin', '2024-04-13'),
    (14, 'Diya', 'Sharma', 'diya@example.com', '+91-6543210987', 'diya', 'adminpassword14', 'Admin', '2024-04-14'),
    (15, 'Ishaan', 'Patel', 'ishaan@example.com', '+91-5432109876', 'ishaan', 'adminpassword15', 'Admin', '2024-04-15');

