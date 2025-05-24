use sakila;

-- datatypes in SQL
-- DataTypes is type of data
-- Number (int,float,double)
-- Character(char,varchar,string)
-- data,timestamp

-- For creating table
-- create statement
create table test(id int);
insert into test values(10);
select * from test;     

-- 1byte = 8bit  2^8 =? 256 (-128 to 127)
create table test2(id tinyint);
insert into test2 values(127);
select * from test2;

-- unsigned 255 last value
create table test3(id tinyint unsigned);
insert into test3 values(255);
select * from test3;        

-- 5 is precision or no. of values and 2 is scale or no of decimal after 3 is number after 2 is decimal
create table test4(id decimal(5,2));
insert into test4 values(845);
insert into test4 values(845.7564);
insert into test4 values(845.7);
select * from test4;       
-- char fixed type character
-- var variabel character saves space and memory
DROP TABLE test5;

-- null means no value. 

create table test5(fname varchar(5)); -- varchar - variable character 
insert into test5 values('hi       ');
insert into test5 values('fdgg');
select * from test5;       
select fname,char_length(fname) from test5;

-- date and timestape 
create table test7(dob date);  
insert into test7 values('2023-12-01'); -- right format yy-mm-dd
select * from test7;
-- 
create table test8(dob timestamp);  
insert into test8 values('2023-12-01 10:15:59'); -- right format yy-mm-dd
select * from test8;

-- saare datatype padd liye
-- BLOB ?
-- image - learining assignment

--    What is subquery
-- query within a query

select * from payment;
select amount from payment where payment_id=15;
select * from payment where amount=2.99; 

-- it is subquery
select * from payment 
where amount=(select amount from payment where payment_id=15);

select * from payment;

-- get the payment_id,customer_id ,rentalid and staff_id and amount only for those payment where the staff id is equal the staff id of rental id 1422

