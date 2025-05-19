-- Use the 'sakila' database and confirm the selected database
USE sakila;
SELECT DATABASE();

-- View all records from the 'actor' table
SELECT * FROM actor;

-- -----------------------------
-- ORDER BY Clause (Sorting)
-- -----------------------------

-- Sort actors by actor_id in ascending order (default)
SELECT * FROM actor ORDER BY actor_id;

-- Sort actors alphabetically by first name
SELECT * FROM actor ORDER BY first_name;

-- Sort by first name, and if same, then sort by actor_id in descending order
SELECT * FROM actor ORDER BY first_name, actor_id DESC;

-- -----------------------------
-- ALIAS (Renaming Columns)
-- -----------------------------

-- Add 10 to actor_id and rename the result column using alias "newactor"
SELECT actor_id, actor_id + 10 AS "newactor" FROM actor;

-- -----------------------------
-- MULTI-ROW (AGGREGATE) FUNCTIONS
-- -----------------------------
-- These functions work on **multiple rows** but return a **single result**
-- Examples: COUNT, SUM, AVG, MIN, MAX

-- View the full 'payment' table
SELECT * FROM payment;

-- Get all unique customer IDs who made payments
SELECT DISTINCT(customer_id) FROM payment;

-- Count total number of payments (including duplicates)
SELECT COUNT(customer_id) FROM payment;

-- Count of total and unique customer IDs
SELECT COUNT(customer_id), COUNT(DISTINCT customer_id) FROM payment;

-- Calculate repeated customers by subtracting unique from total
SELECT 
    COUNT(customer_id) AS total_customers, 
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(customer_id) - COUNT(DISTINCT customer_id) AS 'repetitive_customers'
FROM payment;

-- Basic stats of payment amounts
SELECT 
    COUNT(amount) AS total_payments,
    SUM(amount) AS total_amount,
    MAX(amount) AS max_payment,
    MIN(amount) AS min_payment,
    AVG(amount) AS avg_payment
FROM payment;

-- NOTE: When using aggregate functions (multi-row functions),
-- you cannot select other columns unless you GROUP BY them.

-- -----------------------------
-- GROUP BY Clause
-- -----------------------------
-- Groups similar values and applies aggregate functions to each group

-- Example: Total amount spent by customer 1 and customer 2 individually
SELECT SUM(amount) FROM payment WHERE customer_id = 1;
SELECT SUM(amount) FROM payment WHERE customer_id = 2;

-- Group the data by customer_id to apply aggregate functions
SELECT customer_id FROM payment GROUP BY customer_id;

-- Group by customer_id and get stats for each customer
SELECT 
    customer_id,
    COUNT(amount) AS total_payments,
    SUM(amount) AS total_spent
FROM payment
GROUP BY customer_id;

-- Group by payment amount to see how many times each amount was paid
SELECT 
    amount,
    COUNT(amount) AS frequency
FROM payment
GROUP BY amount;

-- -----------------------------
-- PRACTICAL EXAMPLES
-- -----------------------------

-- Get total number of rentals, total amount paid, and max rental_id per staff
SELECT 
    staff_id,
    COUNT(rental_id) AS total_rentals,
    SUM(amount) AS total_amount,
    MAX(rental_id) AS max_rental_id
FROM payment
GROUP BY staff_id;

-- For each month, get:
-- - Number of customers served
-- - Maximum rental ID
-- - Minimum rental ID
-- - Average amount spent
SELECT 
    MONTH(payment_date) AS payment_month,
    COUNT(customer_id) AS total_customers,
    MAX(rental_id) AS max_rental_id,
    MIN(rental_id) AS min_rental_id,
    AVG(amount) AS avg_spent
FROM payment
GROUP BY MONTH(payment_date);
