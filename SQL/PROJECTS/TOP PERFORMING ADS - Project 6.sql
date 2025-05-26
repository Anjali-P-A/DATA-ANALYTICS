CREATE TABLE ads(adid INT, viewss INT,Clicks INT,Costs FLOAT)
INSERT INTO ads(adid,viewss,Clicks,Costs)
VALUES(1,1000,50,20.5),
       (2,800,30,15.2),
       (3,1200,80,25.7),
       (4,600,20,10.9),
       (5,1500,120,40.3)
SELECT * FROM ads
ALTER TABLE ads
ALTER clicks TYPE NUMERIC

ALTER TABLE ads
ALTER viewss TYPE NUMERIC


SELECT adid, to_char((Clicks/Viewss)*100,'FM999.0' || '%')AS CTR,viewss,clicks,costs FROM ads ORDER BY CTR DESC

