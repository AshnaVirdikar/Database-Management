USE employees;
DROP PROCEDURE IF EXISTS select_employees;
DELIMITER $$
CREATE PROCEDURE select_employees(       )
BEGIN
SELECT* FROM employees
LIMIT 1000;
END$$
DELIMITER ;

CALL employees.select_employees();
Call select_employees();

#Exercise
DROP PROCEDURE IF EXISTS average_salary;
DELIMITER $$
CREATE PROCEDURE average_salary(  )
BEGIN
SELECT
 AVG(salary)
 FROM salaries;
END$$
DELIMITER ;
CALL average_salary();

#Another way to create procedure 
DROP PROCEDURE select_employees ;

#Input Parameters

USE employees;
DROP PROCEDURE IF EXISTS emp_salary;
DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary(IN p_emp_no INTEGER)
BEGIN
SELECT e.first_name ,e.last_name, AVG(s.salary)
FROM employees e 
JOIN
salaries s on e.emp_no = s.emp_no
where e.emp_no = p_emp_no;
END $$
DELIMITER ;

#Output parameter
USE employees;
Drop procedure if exists emp_avg_salary_out ;
DELIMITER $$
CREATE PROCEDURE emp_avg_salary_out (in p_emp_no int, out p_avg_salary decimal (10,2))
BEGIN
SELECT 
AVG(s.salary)
INTO p_avg_salary
FROM employees e 
JOIN
salaries s ON e.emp_no = s.emp_no
WHERE 
e.emp_no = p_emp_no ;
END //
 DELIMITER ;


# EXERCISE - OUT PARAMETER
 CREATE PROCEDURE emp_info (IN p_first_name VARCHAR (255) , IN p_last_name VARCHAR (255), OUT p_emp_no integer)

 BEGIN
 SELECT 
          e.emp_no
 INTO p_emp_no FROM 
 employees e 
 WHERE e.first_name = p_first_name 
 AND e.last_name =
 p_last_name 
 END$$
 
 DELIMITER ;
  call emp_info();
  
  
  
  
  