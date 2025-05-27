use sakila;
select * from payment;

select * from payment where payment_id=6;

select * from payment
where amount=(select amount from payment where payment_id=6);

-- 
select * from actor;
 --  i need to get all the columns for the actor whose actor id is greater than the actor id of person whose first name is ed and last name is chase
select * from actor where actor_id>(select actor_id from actor where first_name ='ED' and last_name='CHASE');

select * from payment;
-- get all the payment details for those payment where the payment_month should be equal to the payment month of payment id = 5 
select * from payment where month(payment_date) = (select month(payment_date) from payment where payment_id=5);

select * from payment;

-- get the customer id the payment id and the amount for the payment where the rental id is less than the rental id of payemnt id 7 and amount less than 5   
select customer_id,payment_id,amount from payment where rental_id<(select rental_id from payment where payment_id=7 and amount<5);