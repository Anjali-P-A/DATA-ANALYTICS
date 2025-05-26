CREATE TABLE Trips(id INT,client_id INT,driver_id INT,city_id INT,status VARCHAR(40),request_at date)
INSERT INTO Trips(id,client_id,driver_id,city_id,status,request_at)
VALUES(1,1,10,1,'completed','2023-07-12'),
       (2,2,11,1,'cancelled_by_driver','2023-07-12'),
       (3,3,12,6,'completed','2023-07-12'),
       (4,4,13,6,'cancelled_by_client','2023-07-12'),
       (5,1,10,1,'completed','2023-07-13'),
       (6,2,11,6,'completed','2023-07-13'),
       (7,3,12,6,'completed','2023-07-13'),
       (8,2,12,12,'completed','2023-07-14'),
       (9,3,10,12,'completed','2023-07-14'),
       (10,4,13,12,'cancelled_by_driver','2023-07-14')
SELECT * FROM Trips

CREATE TABLE users(users_id INT,banned VARCHAR(10),roles VARCHAR(30))
INSERT INTO users(users_id,banned,roles)
VALUES(1,'No','client'),
       (2,'Yes','client'),
       (3,'No','client'),
       (4,'No','client'),
       (10,'No','driver'),
       (11,'No','driver'),
       (12,'No','driver'),
       (13,'No','driver')
SELECT * FROM users



SELECT trips.request_at, round(sum(CASE WHEN trips.status LIKE 'cancelled%' THEN 1 ELSE 0 END)*1.0/count(trips.id),2) AS cancellation_rate FROM trips  
INNER JOIN users AS client ON trips.client_id=client.users_id
INNER JOIN users AS driver ON trips.driver_id=driver.users_id
 GROUP BY trips.request_at ORDER BY request_at 