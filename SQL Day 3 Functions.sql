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

 
