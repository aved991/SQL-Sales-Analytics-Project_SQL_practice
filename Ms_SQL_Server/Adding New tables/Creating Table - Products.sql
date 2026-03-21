-- Create the Products table
CREATE TABLE Products(
    ProductID   INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2)
);

-- Insert all records
INSERT INTO Products (ProductID, ProductName, Category, Price) VALUES
(101, 'Laptop',      'Electronics', 70000.00),
(102, 'Smartphone',  'Electronics', 25000.00),
(103, 'Headphones',  'Accessories',  3000.00),
(104, 'Shirt',       'Clothing',     1200.00),
(105, 'Shoes',       'Clothing',     3500.00),
(106, 'Tablet',      'Electronics', 18000.00),
(107, 'Watch',       'Accessories',  5500.00)