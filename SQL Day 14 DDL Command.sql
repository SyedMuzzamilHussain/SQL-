 -- get the employee no,salary and the runnign salary for each customer from the salary table 
 -- Q1. 
 -- partition by : kisi column ke bases ke liye ham partiotion by use karte hai 
 select * from payment;
 select payment_id,customer_id,amount,
 sum(amount) over(partition by customer_id),
 rank() over(partition by customer_id order by amount desc) as rank1,
 dense_rank() over(partition by customer_id order by amount desc) as dense_rank1 from payment;
 
 -- Q2. 
 select * from 
 ( select payment_id,customer_id,amount,
 dense_rank() over( order by amount desc) as dense_rank1 from payment) as tab where dense_rank1=3;
 
 -- we have done data query?
 -- today we will learn insert and update
 -- it is dml(data manipulation data) 
 create table xyz(id int,fname varchar(20));
 insert into xyz values(10,'Muzzamil');
 insert into xyz values(11); -- error
 insert into xyz(id) values(11); -- > fname=null
 insert into xyz(fname) values('AliHasan'); -- > id=null
 select * from xyz;
 
 update xyz set fname="regex"; -- all rows are update
 update xyz set fname='Syed' where id = 10;
 select * from xyz;
 
 delete from xyz where id='11';
 select * from xyz;
 -- insert,update,delete are dml(data manipulation language)
 
 -- drop 
 -- it is ddl 
 drop table xyz; -- ddl
 select * from xyz;
 -- Interview Question
 -- drop vs delete vs truncate
 -- in delete we can rollback 
 truncate > data delete and table delete and recreate the tablle(no rollback) 
 -- What is Constraints?
 -- In SQL, constraints are rules that you set on columns in a table to control what kind of data can go into them.
 --  These rules help protect the accuracy and reliability of your data.
 
 -- L