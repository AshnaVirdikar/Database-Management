/*HOW MANY EMPLOYEES START DATES AAARE IN THE DB 
SELECT 
COUNT(from_date)
 from salaries;
 */
 
 SELECT 
 COUNT(DISTINCT from_date)
 from salaries ;
 
 /* EXERCISE */
 SELECT 
 COUNT(DISTINCT dept_no)
 FROM dept_emp ;
 
 /* SUM()-SUMMATION OF ALL THE SALARIES TO SEE HOW MUCH THE COMPANY SPENDS */
 
 SELECT 
 SUM(salary)
 from salaries; 
 /* EXERCISSE*/
 
 SELECT  
 SUM(salary )
 FROM salaries
 where from_date > '1997-01-01';
 
 /* MIN AND MAX() */
 /* WHICH IS THE HIGHEST SALARY WE OFFER */
 
 SELECT 
 max(salary)
 FROM salaries;
 
 /* LOWEST SALARY */
 SELECT 
 min(salary)
 FROM salaries;

/* EXERCISE */

SELECT  
min(emp_no)
from employees;

SELECT  
max(emp_no)
from employees;
 
 /*AVERAGE */
 
 /* avg annual salary the company's employee received ? */
 SELECT 
 AVG(salary)
 FROM salaries;
 
/* EXERCISE */

SELECT 
AVG(salary)
FROM salaries
WHERE from_date > '1997-01-01';

/* ROUND()*/
SELECT 
 ROUND(AVG(salary),2)
 FROM salaries;

 /*EXERCISE*/
SELECT 
ROUND(AVG(salary),2)
FROM salaries
WHERE  from_date > '1997-01-01' ; 

/*IF NULL() AND COALESCE()*/

SELECT 
dept_no ,
COALESCE(dept_name , 'Department name not provided') as dept_name
FROM 
departments; 

insert into departments(dept_manager,dept_name )
value ('');

SELECT 
dept_no ,
dept_name,
COALESCE(dept_manager,dept_name , '	N/A') as dept_manager
FROM 
departments
order by dept_no asc; 
SELECT 
dept_no ,
dept_name,
COALESCE('dept manager name') as fake_col
FROM 
departments;


/*EXERCISE 1 */

SELECT

    dept_no,

    dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments

ORDER BY dept_no ASC; 

/*EXERCISE 2 */

SELECT

    IFNULL(dept_no, 'N/A') as dept_no,

    IFNULL(dept_name,

            'Department name not provided') AS dept_name,

    COALESCE(dept_no, dept_name) AS dept_info

FROM

    departments_dup

ORDER BY dept_no ASC;



