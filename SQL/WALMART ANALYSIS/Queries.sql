

----------------------------------------------WALMART ANALYSIS-------------------------------------------

CREATE TABLE sales(
       invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
       branch VARCHAR(5) NOT NULL,
       city VARCHAR(30) NOT NULL,
       customer_type VARCHAR(30) NOT NULL,
       gender VARCHAR(10) NOT NULL,
       product_line VARCHAR(100) NOT NULL,
       unit_price DECIMAL(10,2) NOT NULL,
       quantity INT NOT NULL,
       VAT FLOAT NOT NULL,
       total DECIMAL(12,4) NOT NULL,
       date DATE NOT NULL,
       TIME TIME NOT NULL,
       payment_method VARCHAR(15) NOT NULL,
       cogs DECIMAL(10,2) NOT NULL,
       gross_margin_pct FLOAT,
       gross_income DECIMAL(12,4) NOT NULL,
       rating FLOAT
       );



-----------------------------------------EDA---------------------------------------------------------------
----------------------------------Feature Engineering---------------------------------------------------

--time_of_day COLUMN  CREATION--

SELECT  TIME,(CASE WHEN 'time' BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
                   WHEN 'time' BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
                   ELSE 'Evening' END) AS time_of_date
                   FROM sales
                   
 ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20)
 UPDATE sales SET time_of_day=(CASE WHEN TIME BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
                   WHEN TIME BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
                   ELSE 'Evening' END)
                   
 SELECT * FROM sales                  
 SELECT TIME ,time_of_day FROM sales WHERE time_of_day='Evening'public.sales
 SELECT count(time_of_day) FROM sales WHERE time_of_day='Morning'
 
 --day_name COLUMN CREATION--
 
 SELECT to_char (date,'day') AS day_name FROM sales;
 
 ALTER TABLE sales ADD COLUMN day_name VARCHAR(20)
 UPDATE sales SET day_name= TRIM(to_char(date,'Day'))
 SELECT * FROM sales
 
 --month_name COLUMN CREATION--
 
  SELECT to_char (date,'month') AS month_name FROM sales;
  
  ALTER TABLE sales ADD COLUMN month_name VARCHAR(20)
  UPDATE sales SET month_name= TRIM(to_char(date,'month'))
  
  
  --------------Business Questions To Answer---------------
  
  -----------------Generic----------------------
  
  --1. How many unique cities does the data have?--
  
  SELECT DISTINCT city FROM sales
  
  --2. In which city is each branch?
  
  SELECT DISTINCT branch FROM sales
  
  ----------------------Product--------------------
  
  --1.How many unique product lines does the data have?--
  
  SELECT DISTINCT product_line FROM sales

--2.What is the most common payment method?--

SELECT payment_method,count(payment_method) AS cnt FROM sales GROUP BY payment_method ORDER BY cnt DESC

--3.What is the most selling product line?--

SELECT product_line,count(product_line) AS cnt FROM sales GROUP BY product_line ORDER BY cnt DESC

--4.What is the total revenue by month?--

SELECT month_name AS MONTH,sum(total) AS total_revenue FROM sales GROUP BY month_name ORDER BY total_revenue DESC

--5.What month had the largest COGS?--

SELECT month_name AS MONTH,sum(cogs) AS total_cogs FROM sales GROUP BY MONTH ORDER BY total_cogs DESC

--6.What product line had the largest revenue?--

SELECT product_line ,sum(total) AS total_revenue FROM sales GROUP BY product_line ORDER BY total_revenue DESC

--7. What is the city with the largest revenue?--

SELECT city ,sum(total) AS total_revenue FROM sales GROUP BY city ORDER BY total_revenue DESC

--8. What product line had the largest VAT?--

SELECT product_line,sum(vat) AS avg_tax FROM sales GROUP BY product_line ORDER BY avg_tax DESC

--9. Which branch sold more products than average product sold?--

SELECT branch,sum(quantity) AS qty FROM sales GROUP BY branch HAVING sum(quantity)>(SELECT avg(quantity) FROM sales)

--10. What is the most common product line by gender?--

SELECT product_line,count(gender) AS total_count FROM sales GROUP BY product_line,gender ORDER BY total_count DESC 
SELECT * FROM sales

--11. What is the average rating of each product line?--

SELECT product_line,avg(rating) AS avg_rating FROM sales GROUP BY product_line ORDER BY avg_rating DESC 

---------------------------------------------SALES----------------------------------------------------

--1. Number of sales made in each time of the day per weekday--

SELECT time_of_day,count(*) AS total_sales FROM sales WHERE day_name='Monday' GROUP BY time_of_day ORDER BY total_sales DESC

--2. Which of the customer types brings the most revenue?--

SELECT customer_type,sum(total) AS total_revenue FROM sales GROUP BY customer_type ORDER BY total_revenue DESC

--3. Which city has the largest tax percent/ VAT (Value Added Tax)?--

SELECT city,avg(vat) AS avg_tax FROM sales GROUP BY city ORDER BY avg_tax DESC

--4. Which customer type pays the most in VAT?--

SELECT customer_type,avg(vat) AS avg_tax FROM sales GROUP BY customer_type ORDER BY avg_tax DESC

---------------------------------------Customer------------------------------------------------

--1.How many unique customer types does the data have?--

SELECT DISTINCT customer_type FROM sales

--2.How many unique payment methods does the data have?--

SELECT DISTINCT payment_method FROM sales

--3.What is the most common customer type?--

SELECT customer_type,count(customer_type) AS cnt FROM sales GROUP BY customer_type ORDER BY cnt DESC

--4. Which customer type buys the most?--

SELECT customer_type,count(*) AS cnt FROM sales GROUP BY customer_type 

--5.What is the gender of most of the customers?--

SELECT gender,count(*) AS gender_count FROM sales GROUP BY gender ORDER BY gender_count DESC

--6. What is the gender distribution per branch?--

SELECT gender,count(*) AS gender_count FROM sales WHERE branch='A' GROUP BY gender ORDER BY gender_count DESC

--7.Which time of the day do customers give most ratings?--

SELECT time_of_day,avg(rating) AS avg_rating FROM sales GROUP BY time_of_day ORDER BY avg_rating DESC

--8.Which time of the day do customers give most ratings per branch?--

SELECT time_of_day,avg(rating) AS avg_rating FROM sales WHERE branch='B' GROUP BY time_of_day ORDER BY avg_rating DESC

--9. Which day fo the week has the best avg ratings?--

SELECT day_name,avg(rating) AS avg_rating FROM sales GROUP BY day_name ORDER BY avg_rating DESC

--10. Which day of the week has the best average ratings per branch?--

SELECT day_name,avg(rating) AS avg_rating FROM sales WHERE branch='A' GROUP BY day_name ORDER BY avg_rating DESC











