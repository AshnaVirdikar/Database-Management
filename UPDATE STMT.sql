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


UPDATE employees
SET first_name = 'Stella',
last_name = ' Parkinson',
birth_date =  '1990-12-31',
gender = 'F'
WHERE emp_no = 999901;

select *
 from employees 
 where emp_no =999901
  order by emp_no desc
 limit 10;
 
 /* part 2 */
 select * 
 from departments_dup
 order by dept_no ;
 COMMIT ; 

 
 Update departments_dup
 set dept_no = 'd011',
 dept_name = ' Quality Control ';
  
  rollback;
  commit;
  /* exercise */
  UPDATE departments

SET

    dept_name = 'Data Analysis'

WHERE

    dept_no = 'd010';
    select* 
    from departments 
    order by dept_no;
    