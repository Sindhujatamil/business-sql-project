# business-sql-project
•	Project Overview
This project focuses on analyzing booking data using SQL to extract meaningful insights. The dataset includes customer bookings, pricing details, time slots, and facility usage. The goal is to clean, transform, and query the data to generate business insights.

1.	Features & Insights:
   
 Data Cleaning & Transformation:
 
     •	Handled missing values in instructor, class type, and facility columns
     •	Converted duration_mins from TEXT to INT for accurate calculations
     •	Standardized date format for analysis

Key SQL Queries for Insights:

1️⃣ Top 10 Customers by Revenue
SELECT customer_name, SUM(price) AS total_spent
FROM bookings
WHERE status = 'Confirmed'
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

2️⃣ Monthly Revenue Trend
SELECT DATE_FORMAT(booking_date, '%Y-%m') AS month, 
       SUM(price) AS total_revenue
FROM bookings
WHERE status = 'Confirmed'
GROUP BY month
ORDER BY month;

3️⃣ Popular Time Slots
SELECT time_slot, COUNT(*) AS booking_count
FROM bookings
GROUP BY time_slot
ORDER BY booking_count DESC;

 Technologies Used
SQL (MySQL) for querying & data analysis
