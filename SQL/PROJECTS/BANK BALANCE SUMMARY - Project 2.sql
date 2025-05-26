CREATE TABLE summary (AccountNumbere INT,AccountHolderName VARCHAR(30),TransactionDate date,Transactiontype VARCHAR(30),TransactionAmount INT
INSERT INTO summary(AccountNumbere,AccountHolderName,TransactionDate,Transactiontype,TransactionAmount)
VALUES(1001,'Ravi Sharma','2023-07-01','Deposit',500);
SELECT * FROM summary
INSERT INTO summary(AccountNumbere,AccountHolderName,TransactionDate,Transactiontype,TransactionAmount)
VALUES(1001,'Ravi Sharma','2023-07-05','Withdrawal',1000.00),
      (1001,'Ravi Sharma','2023-07-10','Deposit',2000.00),
      (1002,'Priya Gupta','2023-07-02','Deposit',3000.00),
      (1002,'Priya Gupta','2023-07-08','Withdrawal',500.00),
      (1003,'Vikram Patel','2023-07-04','Deposit',10000.00),
      (1003,'Vikram Patel','2023-07-09','Withdrawal',2000.00);
 SELECT  * FROM summary
      SELECT accountnumbere,accountholdername,(sum(CASE WHEN transactiontype ='Deposit' THEN TransactionAmount ELSE 0 END)- sum(CASE WHEN transactiontype='Withdrawal' THEN transactionamount ELSE 0 END))AS balance FROM summary GROUP BY accountnumbere,accountholdername ORDER BY accountnumbere