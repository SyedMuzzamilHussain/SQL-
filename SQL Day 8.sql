use sakila;
show tables;
select * from payment;
select customer_id ,count(payment_id) 
from payment group by customer_id having count(payment_id)>30;

select customer_id ,count(payment_id) 
from payment where customer_id not in(2,3) group by customer_id having count(payment_id)>35;

-- get the number of payment for each amount?
select amount,count(payment_id) from payment group by amount ;

-- count the total no of customer who had done the payment for each amount except amount 2.99 and 0.99?
select amount,count(customer_id) from payment where amount not in (2.99,0.99) group by amount;

-- get the sum of rental id and the total amount of payment only for 2.99 and 0.99 and 5.99 and the sum of rental id should be greater than 1000
select amount,sum(rental_id),sum(amount) from payment where amount in(2.99,0.99,5.99) group by amount having  sum(rental_id)>1000;

select * from actor;
select * from film_actor;

select a.actor_id,count(film_id)
from actor as a join film_actor as fa where a.actor_id=fa.actor_id 
group by a.actor_id;

select a.actor_id,count(film_id)
from actor as a join film_actor as fa where a.actor_id=fa.actor_id 
group by a.actor_id having count(film_id)>25;