-- DQL : Window Function it is last part of DQL(Data Query Language) 
use sakila;
select payment_id,customer_id,amount,
(select avg(amount) from payment) as average_amount from payment;

select avg(amount) from payment where customer_id=1;

select customer_id,avg(amount) from payment group by customer_id;

-- A window function performs a calculation across a set of rows that are related to the current row, but unlike aggregate functions, it does not collapse the result into a single row.

-- it is used with over() over means har aek row ke saaath apply hoti hai
-- partition by is used to seprate data 
select payment_id,customer_id,amount,
sum(amount) over(partition by customer_id),
sum(amount) over(partition by payment_id) from payment;  

-- runnimg sum : add this in previous ,mostly we use it in unique values
select payment_id,customer_id,amount,
sum(amount) over(order by payment_id) from payment; 

 show databases;
 use employees;
 show tables;
 select * from employees;
 select * from salaries;
 
 create table salary5 as select * from salaries limit 100;
 -- get the employee no ,salary the total salary and the average salary from salary table
SELECT 
    emp_no,
    salary,
    SUM(salary) OVER () AS total_salary,
    AVG(salary) OVER () AS avg_salary
FROM salary5;
 -- get the employee no. salary as year of hiring along with the average salary of that employee from the salary table
 SELECT 
    emp_no,
    salary,
    EXTRACT(YEAR FROM from_date) AS year,
    AVG(salary) OVER (PARTITION BY emp_no) AS emp_avg_salary
FROM salary5;