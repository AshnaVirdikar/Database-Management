/************ INSERT STATEMENT *************************************/
select *
from employees
order by emp_no desc 
limit 10;
insert into employees(
emp_no,
birth_date ,
first_name ,
last_name ,
gender,
hire_date )
values (
999901,
'1986-04-21',
'John',
'Smith',
'M',
'2011-01-01'
);
/* INSERT EX 1 */
select *
from titles
limit 10;
/* since the data isnt available in parent table i.e. employees table we will 
first add the data there and then insert the data in child table in titles */
insert into employees (
birth_date,
emp_no,
first_name,
gender,
hire_date,
last_name
)
values (
'1967-08-23',
999903,
'John ',
'M',
'1997-10-01',
'Chomu'
);
select *
from employees 
order by emp_no desc ;

insert into titles (
emp_no,
from_date,
title,
to_date
)
values (
999903,
'1997-10-01',
'Senior Engineer',
'2020-09-23'
);
select *
from titles 
order by emp_no desc ;

/* INSERT INTO EXERCISE 2 */
select * 
from dept_emp 
limit  10;
/* since the emp_no has already been fed to parent table we need not run the same block again */
insert into dept_emp (
dept_no,
emp_no,
from_date,
to_date)
values(
'd005',
999903,
'1997-10-01',
'9999-01-01');
select* from dept_emp
order by emp_no desc;

/* INSERT DATA INTO A NEW TABLE  */
/* CREATE A DUPLICATE DEPARTMENTS TABLE AND DUPLICATE ALL THE DATA FROM OG TABLE */

 CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);
  insert into departments_dup (dept_no, 
  dept_name) 
  select *
  from departments;
  







  

 select *
  from departments_dup
  order by dept_no asc;
  
  /* exercise */

  INSERT INTO departments VALUES ('d010', 'Business Analysis');
select * 
from departments
order by dept_no asc ;
  
  