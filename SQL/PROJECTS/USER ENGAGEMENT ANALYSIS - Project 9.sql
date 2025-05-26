CREATE TABLE posts(post_id INT,post_content VARCHAR(80),post_date TIMESTAMP)
INSERT INTO posts(post_id,post_content,post_date)
VALUES(1,'Lorem ipsum dolor sit amet','2023-08-25 10:00:00'),
       (2,'Exploring the beauty of nature','2023-08-26 15:30:00'),
       (3,'Unveiling the latest tech trends','2023-08-27 12:00:00'),
       (4,'Journey into the world of literature','2023-08-28 09:45:00'),
       (5,'Capturing the essence of city life','2023-08-29 16:20:00')
       
 SELECT * FROM posts
 
 CREATE TABLE UserReactions(reaction_id INT,user_id INT,post_id INT,reaction_type VARCHAR(30),reaction_date TIMESTAMP)
 INSERT INTO UserReactions(reaction_id,user_id,post_id,reaction_type,reaction_date)
 VALUES(1,101,1,'like','2023-08-25 10:15:00'),
       (2,102,1,'comment','2023-08-25 11:30:00'),
       (3,103,1,'share','2023-08-26 12:45:00'),
       (4,101,2,'like','2023-08-26 15:45:00'),
       (5,102,2,'comment','2023-08-27 09:20:00'),
       (6,104,2,'like','2023-08-27 10:00:00'),
       (7,105,3,'comment','2023-08-27 14:30:00'),
       (8,101,3,'like','2023-08-28 08:15:00'),
       (9,103,4,'like','2023-08-28 10:30:00'),
       (10,105,4,'share','2023-08-29 11:15:00'),
       (11,104,5,'like','2023-08-29 16:30:00'),
       (12,101,5,'comment','2023-08-30 09:45:00')
  SELECT * FROM UserReactions
  
  --Retrieve the comprehensive count of likes, comments, and shares garnered by a specific post identified by its unique post ID--
  
  SELECT posts.post_id,posts.post_content,sum(CASE WHEN UserReactions.reaction_type='like' THEN 1 ELSE 0 END) AS num_likes,sum(CASE WHEN UserReactions.reaction_type='comment' THEN 1 ELSE 0 END) AS num_comments,sum(CASE WHEN UserReactions.reaction_type='share' THEN 1 ELSE 0 END) AS num_shares  FROM posts
  LEFT JOIN UserReactions
  ON posts.post_id=UserReactions.post_id
  WHERE posts.post_content='Exploring the beauty of nature' GROUP BY posts.post_id,posts.post_content
  
  --Calculate the mean number of reactions, encompassing likes, comments, and shares per distinct user within a designated --
  
  CREATE TABLE View3 AS
  SELECT DISTINCT(date(reaction_date)) AS reaction_day,count(DISTINCT user_id) AS distinct_users, count(reaction_type) AS total_reactions FROM posts
   LEFT JOIN userreactions
  ON posts.post_id=UserReactions.post_id
  GROUP BY reaction_day ORDER BY reaction_day
  
   CREATE TABLE table4 AS
  SELECT DISTINCT(date(reaction_date)) AS reaction_day,count(DISTINCT user_id) AS distinct_users, count(reaction_type) AS total_reactions FROM  userreactions
  GROUP BY reaction_day ORDER BY reaction_day
  
 SELECT * FROM table4
    
 SELECT reaction_day,distinct_users,total_reactions,(distinct_users+total_reactions)/2 AS avg_reactions_per_user FROM table4
 GROUP BY reaction_day,distinct_users,total_reactions ORDER BY reaction_day
 
  
  
  --Identify the three most engaging posts, measured by the aggregate sum of reactions, within the preceding week--
  
  SELECT posts.post_id,posts.post_content,count(UserReactions.reaction_type) AS total_reactions FROM posts
  LEFT JOIN userreactions
  ON posts.post_id= UserReactions.post_id
  GROUP BY posts.post_id,posts.post_content ORDER BY posts.post_id,total_reactions  DESC LIMIT 3