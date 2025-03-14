CREATE DATABASE Salesbb;
USE Salesbb;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100)
); 

CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)  -- Added precision for decimals
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- ✅ Inserting sample data into Customers table
INSERT INTO Customers (name, email) VALUES 
('sairam', 'sairam@gni'),
('naveen', 'naveen@gni'),
('ram', 'ram@gni'),
('kumar', 'kumar@gni');

-- ✅ Inserting sample data into Products table
INSERT INTO Products (name, price) VALUES 
('Laptop', 800.00),
('Phone', 500.00),
('Tablet', 300.00),
('Book', 340.00);

-- ✅ Inserting sample data into Orders table (Fixing wrong syntax & incorrect IDs)
INSERT INTO Orders (customer_id, product_id, quantity, order_date) VALUES 
(1, 1, 2, '2024-03-01'),
(2, 2, 1, '2024-03-02'),
(3, 3, 4, '2024-03-03'),
(4, 4, 3, '2024-03-04');
 
 -- total sales revenue
select sum(p.price*o.quantity) as totalrevenue
from orders o 
join products p on p.product_id=o.product_id

-- finding best selling product
select p.name, SUM(o.quantity) AS total_sold
FROM Orders o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY total_sold DESC
LIMIT 2;
-- finding topcustomers
SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 2;

