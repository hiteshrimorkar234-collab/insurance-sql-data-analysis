
CREATE DATABASE insurance_analysis;
USE insurance_analysis;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE policies (
    policy_id INT PRIMARY KEY,
    customer_id INT,
    policy_type VARCHAR(50),
    premium DECIMAL(10,2),
    policy_status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE claims (
    claim_id INT PRIMARY KEY,
    policy_id INT,
    claim_amount DECIMAL(10,2),
    claim_status VARCHAR(20),
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id)
);

INSERT INTO customers VALUES
(1,'Aarav Shah','Mumbai'),
(2,'Priya Patil','Thane'),
(3,'Rohan Mehta','Navi Mumbai'),
(4,'Sneha Joshi','Mumbai'),
(5,'Neha Kulkarni','Thane');

INSERT INTO policies VALUES
(101,1,'Health',12000,'Active'),
(102,2,'Motor',8500,'Active'),
(103,3,'Health',15000,'Expired'),
(104,4,'Motor',9500,'Active'),
(105,5,'Life',18000,'Active');

INSERT INTO claims VALUES
(1001,101,5000,'Approved'),
(1002,102,3000,'Pending'),
(1003,103,8000,'Rejected'),
(1004,104,4500,'Approved'),
(1005,101,2000,'Pending'),
(1006,105,6000,'Approved');
