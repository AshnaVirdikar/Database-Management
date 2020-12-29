
SET @v_avg_salary = 0;
Call employees.emp_salary ('11300', @v_avg_salary) ;
select @v_avg_salary;

# EXERCISE 
 SET @v_emp_no = 0;
 call employees.emp_info ('Aruna','Journel',@v_emp_info);
 select @v_emp_info;

# USER DEFINED FUNCTIONS 
USE employees;
DROP FUNCTION IF EXISTS f_emp_avg_salary;
Delimiter $$
create function f_emp_avg_salary(p_emp_no integer) 
returns decimal (10,2)
deterministic no sql reads sql data
begin
 declare v_avg_salary decimal (10,2);
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
   return v_avg_salary;
   end$$
   delimiter ;
    select f_emp_avg_salary(11300);
   
   # EXERCISE 
   delimiter $$
   CREATE FUNCTION f_emp_info (p_first_name varchar (255), p_last_name varchar (255))
   returns decimal (10,2)
   deterministic no sql reads sql data
   begin
   declare v_max_from_date date;
   declare v_salary decimal (10,2);
   select max (from_date)
   into v_max_from_date from employees e 
   join 
   salaries s on e.emp_no =s.emp_no
    where e.first_name = p_first_name  
    and e.last_name = p_last_name;
    select s.salary 
    into v_salary
    from employees e 
    join
     salaries s on e.emp_no = s.emp_no
     where e.first_name =p_first_name 
     and e.last_name = p_last_name
     and s.from_date =v_max_from_date ;
     return v_salary;
     end $$
   delimiter ;
   
   select f_emp_info ('Aruna','Journel');
   

