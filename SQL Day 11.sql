use employees;
select * from employees;

-- Q1. get those employee information whose year of hiring as same as same as the hiring year of 1002
-- Q2. get  employye no.n birth date,full name as a person whose birth date is greater than birth date among all the person belonging from employee from 
-- 1003 to 1006 
select * from employees where extract(year from hire_date)=(select extract(year from hire_date) from employees where emp_no=10002);


select emp_no,birth_date,concat('first_name',' ','last_name') from employees where birth_date>(select birth_date from employees where emp_no between 1003 and 1006);

-- get the emp no.,firstname and the title for all those employee currently working on the senior enginner position
-- get the employee name and there birth date for a person who has startED working in 1986 
-- get all the employee information only for that employee who have work on 3 or more postion(title)

-- learn correlated subquery 

