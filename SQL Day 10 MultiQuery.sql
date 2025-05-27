-- Set the current database
USE sakila;

-- 1. Get all payment records
SELECT * FROM payment;

-- 2. Get the payment record with payment_id = 6
SELECT * FROM payment 
WHERE payment_id = 6;

-- 3. Subquery with '=' operator
-- Get all payments that have the same amount as the payment with payment_id = 6
SELECT * FROM payment 
WHERE amount = (
    SELECT amount 
    FROM payment 
    WHERE payment_id = 6
);

-- 4. Get all actor records
SELECT * FROM actor;

-- 5. Subquery with '>' operator
-- Get all actors whose actor_id is greater than the actor_id of 'ED CHASE'
SELECT * FROM actor 
WHERE actor_id > (
    SELECT actor_id 
    FROM actor 
    WHERE first_name = 'ED' AND last_name = 'CHASE'
);

-- 6. Get all payment records
SELECT * FROM payment;

-- 7. Subquery with '=' operator using MONTH function
-- Get payments made in the same month as payment_id = 5
SELECT * FROM payment 
WHERE MONTH(payment_date) = (
    SELECT MONTH(payment_date) 
    FROM payment 
    WHERE payment_id = 5
);

-- 8. Subquery with '<' and AND operator
-- Get customer_id, payment_id, amount where:
-- rental_id is less than the rental_id of payment_id = 7
-- AND amount is less than 5
SELECT customer_id, payment_id, amount 
FROM payment 
WHERE rental_id < (
    SELECT rental_id 
    FROM payment 
    WHERE payment_id = 7
) 
AND amount < 5;

-- 9. Subquery with 'IN' operator
-- Get payments where the amount is in the list of amounts from the first 5 payments
SELECT * FROM payment 
WHERE amount IN (
    SELECT amount 
    FROM payment 
    ORDER BY payment_id 
    LIMIT 5
);

-- 10. Subquery with 'ANY' operator
-- Get payments where amount is greater than ANY amount paid by customer_id = 1
SELECT * FROM payment 
WHERE amount > ANY (
    SELECT amount 
    FROM payment 
    WHERE customer_id = 1
);

-- 11. Subquery with 'ALL' operator
-- Get payments where amount is greater than ALL amounts paid by customer_id = 2
SELECT * FROM payment 
WHERE amount > ALL (
    SELECT amount 
    FROM payment 
    WHERE customer_id = 2
);

-- 12. Subquery with 'EXISTS' operator
-- Get all customers who have made at least one payment
SELECT * FROM customer 
WHERE EXISTS (
    SELECT 1 
    FROM payment 
    WHERE payment.customer_id = customer.customer_id
);
