Overview

This project is a part of my SQL learning journey inspired by Shradha Khapra (Apna College).
It focuses on analyzing data to extract meaningful insights using SQL queries — like total revenue, top-performing categories, and regional analysis.

Tools & Concepts Used

Database: MySQL

Queries: SELECT, WHERE, GROUP BY, HAVING, ORDER BY

Functions: SUM(), AVG(), COUNT(), MAX(), MIN()

Concepts: Constraints, Clauses, Aggregate Functions



| Column Name         | Data Type | Description            |
| ------------------- | --------- | ---------------------- |
| id / sale_id        | INT (PK)  | Unique ID              |
| name / product_name | VARCHAR   | Name of entity/product |
| category            | VARCHAR   | Category type          |
| region / city       | VARCHAR   | Region or city         |
| quantity / marks    | INT       | Numerical data         |
| price_per_unit      | DECIMAL   | Price or value         |
| date                | DATE      | Transaction date       |

#Create Table 

CREATE TABLE sales (
  sale_id INT PRIMARY KEY,
  product_name VARCHAR(50),
  category VARCHAR(30),
  region VARCHAR(30),
  quantity INT,
  price_per_unit DECIMAL(10,2),
  sale_date DATE
);

#Calculate Total Revenue by Product

SELECT product_name, 
       SUM(quantity * price_per_unit) AS total_revenue
FROM sales
GROUP BY product_name;

#Find Regions with Sales Above 200000
SELECT region, 
       SUM(quantity * price_per_unit) AS total_sales
FROM sales
GROUP BY region
HAVING total_sales > 200000;


Key Insights

💰 Highest earning product: Laptop

🌍 Top-performing region: North

🛍️ Best category: Electronics

📅 Sales trend increased month by month

What I Learned

How SQL converts raw data into real insights

Difference between WHERE and HAVING

Power of GROUP BY for analytics

Writing cleaner and optimized SQL queries


| File Name             | Description                     |
| --------------------- | ------------------------------- |
| `project_queries.sql` | Contains all SQL queries        |
| `README.md`           | Project documentation & summary |
