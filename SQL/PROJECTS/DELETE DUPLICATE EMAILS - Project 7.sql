CREATE TABLE Emails(id INT,NAME VARCHAR(20),email VARCHAR(50),phone NUMERIC)
INSERT INTO Emails(id,NAME,email,phone)
VALUES(1,'Rahul','rahul@exmple.com',9839473902)

SELECT * FROM emails

INSERT INTO Emails(id,NAME,email,phone)
VALUES(2,'Rohit','rohit@example.com',9883782971),
       (3,'Suresh','rahul@exmple.com',7654321098),
       (4,'Manish','manish@example.com',8927394619),
       (5,'Amit','amit@example.com',9399303840),
       (6,'Rahul','rahul@exmple.com',9737466147)
       
 
        
SELECT DISTINCT ON (email)* FROM emails ORDER BY email DESC
