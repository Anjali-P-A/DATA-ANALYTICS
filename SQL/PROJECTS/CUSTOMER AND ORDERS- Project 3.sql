CREATE TABLE Customers(id INT,NAME VARCHAR(30))
INSERT INTO customers(id,NAME)
VALUES(1,'Joe'),
      (2,'Henry'),
      (3,'Sam'),
      (4,'Max')
 SELECT * FROM customers
 
 CREATE TABLE Orders(id INT,customerid INT)
 INSERT INTO Orders(id,customerid)
  VALUES(2,1),
         (1,3)
  SELECT * FROM Orders
  
  SELECT  customers.name AS Customers FROM customers
  LEFT JOIN Orders 
  ON Customers.id=Orders.customerid
  WHERE Orders.customerid IS NULL
         
      