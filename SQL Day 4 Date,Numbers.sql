select database();
use sakila;
select database();
show databases;
show tables;
##how to access some column from this table data
select * from actor;
-- distinct ,count

select distinct(first_name) from actor; 
-- distinct counts or show uniuqe  values

select count(first_name) from actor;
select distinct(first_name) from actor; 
-- counts give us numbers

-- functions 
-- code reusable
-- string functions
-- two types of fubnction
-- scaler function(single fucntion) and multi-row fucntion
-- 1 row >  apply > result for each row
select first_name,lower(first_name) from actor;
select first_name,lower(first_name),upper(lower(first_name)) from actor;
select first_name,lower(first_name),length(first_name) from actor;

select first_name,lower(first_name),upper(lower(first_name))
,length(first_name) from actor;
-- substr(col,index)
select first_name,substr(first_name,3) from actor; -- 3 means third character
-- substr(col,index,total_character)
select first_name,substr(first_name,3),substr(first_name,2,3) from actor;

select first_name,substr(first_name,3),substr(first_name,2,3), 
substr(first_name,-5)from actor;
-- instr give the specific index
select first_name,instr(first_name,'I') from actor;

select first_name,substr(first_name,3),substr(first_name,2,3), 
substr(first_name,-3,2)from actor;

select first_name,last_name,
concat(first_name,' - ',last_name,' $ ') from actor;

select first_name,last_name,
concat_ws(' - ',first_name,last_name,' $ ') from actor;

-- trim is used to remove leading and whitespace but does,t remove
-- from between

select first_name,trim('               hiii    ') from actor;
-- lower(),upper(),length,substr(),concat
-- lpad(), rpad()
-- 
select first_name ,rpad(first_name,6,'@') from actor;

-- numbers,date
-- dual
-- The DUAL table is a special one-row, one-column table that exists by default in some SQL databases like Oracle.
-- It's used when you want to run a SELECT statement without querying any actual table.The DUAL table is a special one-row, one-column table that exists by default in some SQL databases like Oracle.
-- It's used when you want to run a SELECT statement without querying any actual table.

select 9*2345 from dual;

-- now()
select sysdate(),curdate(),curtime(),current_timestamp(),now() from dual;

select now(),adddate(now(),2) from dual;

select now(),adddate(now(),interval 2 month) from dual;

select now(),adddate(now(),interval 2 year) from dual;

select now(),adddate(now(),interval 2 week) from dual;

select now(),adddate(now(),interval 2 hour) from dual;

select now(),adddate(now(),interval 2 minute) from dual;

select datediff(now(),'2025-05-21 12:33:07') from dual;

select last_day(now()) from dual;

select month( now() ) ,year(now()) from dual;

select extract(year from now()) from dual;

select extract(second from now()) from dual;

select extract(minute from now()) from dual;

select extract(hour from now()) from dual;

select now(), date_format(now(),'This year is %Y') from dual;

-- round(), truncate() ,pow, floor, ceil
select 25.325 ,round(24.325) from dual;

select 25.325 ,round(24.625) from dual;

select 25.325 ,round(24.325,1) from dual;
select 25.325 ,round(24.325), round(24.385,1) from dual;

select round(24.32,-1) from dual;
select round(364.32,-2) from dual;

select round(364.56 ,1) ,truncate(364.37,1)  from dual;

select mod(11,2),pow(2,3),floor(10.999999),ceil(9.001) from dual;

use sakila;
select * from actor;
-- if(condition,True,False)
-- if(condition,True,if(contdion,True,False)) 
select first_name,actor_id,if(first_name='NICK','Yes',if(first_name='ED','hello','no')) from actor;

-- if actor_id is even then first_name,last_name concat if no. odd then concat with dollar symbol
SELECT *, 
    IF(actor_id % 2 = 0, 
       CONCAT(first_name, ' ', last_name), 
       CONCAT_WS('$', first_name, last_name)
    ) AS full_name_if_even
FROM actor;




