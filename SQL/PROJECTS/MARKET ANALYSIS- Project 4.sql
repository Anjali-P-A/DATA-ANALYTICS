-- TABLE CREATION AND INSERTING VALUES --

CREATE TABLE market(CustomerID INT,ProductID VARCHAR(10),PurchaseDate date,Quantity INT,Revenue INT)
INSERT INTO market(CustomerID,ProductID,PurchaseDate,Quantity,Revenue)
VALUES(1,'A','2023-01-01',5,100)
INSERT INTO market(CustomerID,ProductID,PurchaseDate,Quantity,Revenue)
VALUES(2,'B','2023-01-02',3,50),
       (3,'A','2023-01-03',2,30),
        (4,'C','2023-01-03',1,20),
         (1,'B','2023-01-04',4,80)
         
 SELECT * FROM Market
 
 -- 1.	Calculate total revenue --
 
 SELECT sum(Revenue) AS TotalRevenue FROM market
 
 -- 2. 	Calculate total sales by product --
 
 SELECT ProductID,sum(Quantity) AS TotalQuantity,Sum(Revenue) AS TotalRevenue FROM market GROUP BY ProductID ORDER BY ProductID
SELECT * FROM MARKET

-- 3.	Find top customer by Revenue --

 SELECT CustomerID,sum(Revenue) AS TotalRevenue FROM Market GROUP BY CustomerID ORDER BY CustomerID