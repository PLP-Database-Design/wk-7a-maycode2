-- Create ProductDetail table in 1NF
CREATE TABLE ProductDetail (
  OrderID INT,
  CustomerName VARCHAR(100),
  Product VARCHAR(100)
);

-- Insert normalized data (each product in a separate row)
INSERT INTO ProductDetail (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- Create Orders table (remove partial dependency of CustomerName)
CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerName VARCHAR(100)
);

-- Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Create Product table (referencing OrderID)
CREATE TABLE Product (
  ProductID INT AUTO_INCREMENT PRIMARY KEY,
  OrderID INT,
  Product VARCHAR(100),
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert data into Product table
INSERT INTO Product (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
