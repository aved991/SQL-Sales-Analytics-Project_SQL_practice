-- Create Orders table
CREATE TABLE Orders (
    OrderID     INT PRIMARY KEY,
    CustomerID  INT,
    OrderDate   DATE,
    TotalAmount DECIMAL(10,2)
);

-- Insert into Orders first (parent table)
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(1001, 1, '2025-06-15', 95000.00),
(1002, 2, '2025-06-20', 38000.00),
(1003, 1, '2025-07-05',  4200.00),
(1004, 3, '2025-07-01', 25000.00),
(1005, 4, '2025-06-25',  8000.00),
(1006, 5, '2025-07-08', 28000.00);




-- Create OrderItems table
CREATE TABLE OrderItems (
    OrderID    INT,
    ProductID  INT,
    Quantity   INT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert into OrderItems (child table)
INSERT INTO OrderItems (OrderID, ProductID, Quantity) VALUES
(1001, 101, 1),
(1001, 103, 2),
(1002, 102, 1),
(1002, 105, 2),
(1003, 104, 3),
(1004, 102, 1),
(1004, 106, 1),
(1005, 103, 1),
(1005, 104, 2),
(1006, 101, 1),
(1006, 107, 2);