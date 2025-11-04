CREATE DATABASE sales_db;
USE sales_db;


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    region VARCHAR(30),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    sale_date DATE
);

INSERT INTO sales (sale_id, product_name, category, region, quantity, price_per_unit, sale_date) VALUES
(1, 'Laptop', 'Electronics', 'North', 5, 55000, '2024-01-10'),
(2, 'Mobile', 'Electronics', 'South', 8, 25000, '2024-02-12'),
(3, 'Shoes', 'Fashion', 'East', 10, 3000, '2024-02-18'),
(4, 'Watch', 'Fashion', 'West', 6, 4000, '2024-03-05'),
(5, 'Tablet', 'Electronics', 'North', 4, 30000, '2024-03-10'),
(6, 'Shirt', 'Fashion', 'South', 12, 1500, '2024-03-15'),
(7, 'Laptop', 'Electronics', 'East', 3, 56000, '2024-04-02'),
(8, 'Shoes', 'Fashion', 'West', 9, 2800, '2024-04-10'),
(9, 'Headphones', 'Electronics', 'North', 7, 4000, '2024-04-22'),
(10, 'Mobile', 'Electronics', 'West', 5, 26000, '2024-05-01');

SELECT * FROM sales;

-- Calculate total revenue for each product
SELECT product_name,
       SUM(quantity * price_per_unit) AS total_revenue
FROM sales
GROUP BY product_name;

-- Find total revenue by category

SELECT category,
       SUM(quantity * price_per_unit) AS total_sales
FROM sales
GROUP BY category;

-- Find total sales per region (sorted high to low)
SELECT region,
       SUM(quantity * price_per_unit) AS total_sales
FROM sales
GROUP BY region
ORDER BY total_sales DESC;


-- Show regions where total sales > 200000
SELECT region,
       SUM(quantity * price_per_unit) AS total_sales
FROM sales
GROUP BY region
HAVING SUM(quantity * price_per_unit) > 200000;

-- Find average sale price by category 

SELECT category,
       AVG(price_per_unit) AS avg_price
FROM sales
GROUP BY category;


-- Find product with highest total revenue
   SELECT product_name,
       SUM(quantity * price_per_unit) AS total_revenue
FROM sales
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 1;


--  Find how many sales happened in each month

  SELECT MONTH(sale_date) AS sale_month,
       COUNT(*) AS total_orders
FROM sales
GROUP BY MONTH(sale_date)
ORDER BY sale_month;


--  Find which region sold the most quantity of Electronics

  SELECT region,
       SUM(quantity) AS total_units
FROM sales
WHERE category = 'Electronics'
GROUP BY region
ORDER BY total_units DESC;


-- Combined Condition — High Sales Regions for Electronics
SELECT region,
       SUM(quantity * price_per_unit) AS total_sales
FROM sales
WHERE category = 'Electronics'
GROUP BY region
HAVING total_sales > 100000;


  