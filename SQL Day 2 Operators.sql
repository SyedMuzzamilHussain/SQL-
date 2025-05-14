select database();
use sakila;
select database();
show databases;
show tables;
##how to access some column from this table data
select * from actor;

select actor_id,last_name,first_name,first_name from actor;

select * from actor where actor_id=2;
select * from actor where first_name='ED';
select * from actor where first_name='ED' and actor_id>100;
select * from actor where first_name='ED' or actor_id>100;
select * from actor where actor_id>10 and actor_id<25;
-- comment -- we can also use between it is used for in range 
select * from actor where actor_id between 11 and 24;
-- in use for specific range 
select * from actor where actor_id in(2,5); 
-- like operator jo kisi pattern par kaam karega
select * from actor where first_name='NICK';

select * from actor where first_name like 'NICK';

-- gives first name where name start with S
select * from actor where first_name like 'S%';

select * from actor where first_name like '%T';

select * from actor where first_name like 'S%T';

select * from actor where first_name like 'ED%';

select * from actor where first_name like 'E_';

select * from actor where first_name like '__';

select * from actor where first_name like '_A%';

-- Q1. I need to get all the detail from actor table where actor_id 3,5,7
select * from actor where actor_id in(3,5,7);

-- Q2. 
select * from actor where actor_id between 3 and 7;

-- Q3.
select actor_id,first_name from actor where actor_id not between 3 and 100;

-- Q4.
select * from actor where first_name like '_E%R';

-- Q5. 
select * from actor where first_name like '%NN%';

-- Q6.
select  * from actor where first_name like '__' and last_name like '__%S';

-- Q7. 
select * from actor where first_name like '_____' and last_name like '%S_';
-- Q8. 
select * from actor where first_name like '_____'; -- only for five character words from first_name







