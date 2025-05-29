-- self join
use sakila; 
show tables;
create table employee2(eid int,ename varchar(20),manager_id int);
insert into employee2 values(10,'tushar',null),(11,'aman',12),(12,'adi',10),(13,'sakshi',11);
select * from employee2;
-- combinations of columns is called candidate key
select emp.eid,emp.ename,emp.manager_id,manager.eid,manager.ename from employee2 as emp
join employee2 as manager where emp.manager_id= manager.eid;

-- Natural join : It is worst join,if commom element works as inner join if all diffrent colunmn then work as a cartisan join.
-- table which is small then we place it in left small and vice versa.

