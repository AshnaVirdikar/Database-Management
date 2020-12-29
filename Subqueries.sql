 SELECT * 
 FROM dept_manager;
 # select the first and last name from employees table for same
 #employee number that can be found in dept manager table
 
 SELECT e.first_name, e.last_name
	FROM employees e 
 WHERE e.emp_no IN (SELECT
 dm.emp_no 
 FROM 
 dept_manager dm);
 
 SELECT
 dm.emp_no 
 FROM 
 dept_manager dm;
 
 #exercise
 SELECT * 
 from dept_manager
 where emp_no in (
 select emp_no 
 from employees 
 where hire_date between '1990-01-01' and '1995-01-01');
 
# EXISTS-NOT EXISTS exercise
 select *
  from employees e 
  where 
  exists ( select 
*
from titles t 
where t.emp_no =e.emp_no 
and title='Assistant Engineer ');

# subqueries in SELECTED and FROM
SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A;               #rename as subset A 

SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;               #rename as subset B 

DROP TABLE IF EXISTS emp_manager;
CREATE TABLE emp_manager(
emp_no int(11) NOT NULL,
dept_no CHAR(4) NULL,
manager_no INT(11) NOT NULL);


INSERT INTO emp_manager
SELECT 
    U.*
FROM
    (SELECT 
        A.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        B.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B UNION SELECT 
        C.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS C UNION SELECT 
        D.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS D) as U;

#SELF JOIN SECTION

SELECT *
FROM emp_manager
where emp_manager.emp_no;

SELECT 
    e1.emp_no, e1.dept_no,e2.manager_no
FROM
    emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    SELECT e1.* #solution 2
FROM emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no
    where e2.emp_no in (select
    manager_no
    from
    emp_manager);
    
    SELECT DISTINCT e1.* #solution1 
    FROM emp_manager e1
        JOIN
    emp_manager e2 ON e1.emp_no = e2.manager_no;
    
    # VIEWS TASK
    SELECT   *     
    FROM dept_emp;
    
    SELECT emp_no,from_date, to_date, COUNT(emp_no) as Num
    FROM dept_emp
    GROUP BY emp_no
    HAVING Num>1;
    
    CREATE OR REPLACE VIEW v_dept_emp_latest_date AS 
    SELECT emp_no,MAX(from_date) AS from_date, MAX( to_date) AS to_date
    FROM dept_emp
    group by emp_no;
    
    
    SELECT emp_no,MAX(from_date) AS from_date, MAX( to_date) AS to_date
    FROM dept_emp
    group by emp_no;
    
    #TASK
    CREATE OR REPLACE VIEW v_manager_avg_salary AS
    SELECT 
    ROUND(AVG(salary),2)
    from salaries s 
    JOIN dept_manager m ON s.emp_no=m.emp_no;
    