/* EXERCISE 1 - CREATE DEPT_DUP TABLE */
	DROP TABLE departments_dup;
  CREATE  TABLE departments_dup
(

    dept_no CHAR(4) NULL,

    dept_name VARCHAR(40) NULL

);

INSERT INTO departments_dup
(

    dept_no,

    dept_name

)
SELECT
*
FROM
departments;


INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

 DELETE FROM departments_dup

WHERE dept_no = 'd002'; 

INSERT INTO departments_dup(dept_no) VALUES ('d010'), ('d011');

/* EXERCISE 2 - CREATE DEPT_MANAGER_DUP TABLE */

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup (

  emp_no int(11) NOT NULL,

  dept_no char(4) NULL,

  from_date date NOT NULL,

  to_date date NULL

  );
INSERT INTO dept_manager_dup
select * from dept_manager;
INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),

                                (999905, '2017-01-01'),

                               (999906, '2017-01-01'),

                               (999907, '2017-01-01');
DELETE FROM dept_manager_dup
WHERE
dept_no = 'd001';

INSERT INTO departments_dup (dept_name)

VALUES                ('Public Relations');
DELETE FROM departments_dup
WHERE
dept_no = 'd002'; 

/* INNER JOINS PART 2 */
SELECT m.dept_no , m.emp_no,d.dept_name 
from dept_manager_dup m 
inner join
departments_dup d
on m.dept_no = d.dept_no
order by m.dept_no;

/* EXERCISE PART TWO */
SELECT e.emp_no , e.first_name, e.last_name, e.hire_date ,d.dept_no
FROM employees e 
INNER JOIN 
dept_manager d
ON e.emp_no = d.emp_no
ORDER BY e.emp_no;

/* DUPLICATE RECORDS - HOW TO CLEAN THEM */

INSERT INTO dept_manager_dup
VALUES('110228','d003', '1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009','Customer Service');


DELETE FROM dept_manager_dup
where emp_no='110228';
DELETE FROM  departments_dup
where dept_no='d009';

#add back initial records
INSERT INTO dept_manager_dup
VALUES('110228','d003', '1992-03-21','9999-01-01');

INSERT INTO departments_dup
VALUES ('d009','Customer Service');

/* LEFT JOIN PART 1 */

SELECT m.dept_no , m.emp_no,d.dept_name 
from dept_manager_dup m 
left join
departments_dup d
on m.dept_no = d.dept_no
group by emp_no
order by m.dept_no;

/* LEFT JOIN PART 2- the order in which you join tables matters */

SELECT m.dept_no , m.emp_no, d.dept_name 
from dept_manager_dup m 
LEFT OUTER JOIN  
departments_dup d on m.dept_no = d.dept_no
where dept_name IS NULL 
order by m.dept_no ASC;

/* LEFT JOIN 2 EXERCISE */
 SELECT e.emp_no, e.first_name, e.last_name , 
 dm.dept_no, dm. from_date
 FROM employees e 
 LEFT JOIN 
 dept_manager dm ON e.emp_no=dm.emp_no
 WHERE e.last_name ='Markovitch'
 ORDER BY dm.dept_no DESC , e.emp_no;

/* RIGHT JOIN */

SELECT d.dept_no , m.emp_no, d.dept_name 
from departments_dup d 
RIGHT JOIN  
dept_manager_dup m on m.dept_no = d.dept_no
order by dept_no ASC;

/*  OLD TYPE OF JOIN SYNTAX - WHERE EXERCISE SOLUTION */
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
from employees e,
dept_manager dm
WHERE e.emp_no =dm.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
from employees e
JOIN
dept_manager dm ON
 e.emp_no =dm.emp_no;

/* JOIN AND WHERE USED TOGETHER IN SAME CODE */

SELECT e.emp_no, e.first_name, e.last_name, s.salary
from employees e
JOIN
salaries s ON
 e.emp_no =s.emp_no
 WHERE s.salary > 145000;

/* ERROR CODE QUERY TO BE EXECUTED */
select @@global.sql_mode ; 
set@@global.sql_mode :=
 replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY','') ;
 
 /*JOIN AND WHERE USED TOGETHER IN SAME CODE-EXERCISE */
 SELECT e.first_name , e.last_name, e.hire_date , t.title
 FROM employees e
 JOIN titles t
 ON e.emp_no = t.emp_no
 WHERE first_name ='Margareta'
 AND last_name='Markovitch'
 ORDER BY e.emp_no ASC;

/* CROSS JOIN */

select dm.*, d.*
from departments d 
cross  join 
dept_manager dm
where d.dept_no <> dm.dept_no
order by dm.emp_no, d.dept_no;


select e.*, d.*
from departments d 
cross  join 
dept_manager dm
join employees e 
on dm.emp_no =e.emp_no
where d.dept_no <> dm.dept_no
order by dm.emp_no, d.dept_no;

/* CROSS JOIN EX 1*/
select dm.*, d.*
from  departments d 
cross join 
dept_manager dm
on dm.dept_no = d.dept_no 
where d.dept_no = 'd009'
order by d.dept_no;

/* CROSS JOIN EX 2*/
select e.*, d.*
from employees e 
cross join 
departments d
where e.emp_no < 10011
order by e.emp_no, d.dept_name ASC;

/* AGGREGATE FUNCTIONS USING JOINS */
select e.gender, avg(s.salary) AS average_salary
from employees e 
join 
salaries s ON e.emp_no = s.emp_no
group by gender;

/* JOIN MORE THAN 2 TABLES IN SQL */

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager m ON e.emp_no = m.emp_no
        JOIN
    departments d ON m.dept_no = d.dept_no;
    
    SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    m.from_date,
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    employees e ON m.emp_no = e.emp_no;
    
    /* exercise */
    
     SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    m.from_date,
    d.dept_name
FROM
    employees e 
    join dept_manager m on e.emp_no = m.emp_no
    join departments d on m.dept_no = d.dept_no
    join titles t on e.emp_no = t.emp_no
    where t.title ='Manager'
    order by e.emp_no;
    
    /*TIPS AND TRICKS FOR JOINS */
    
   SELECT 
    d.dept_no, AVG(salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager m ON d.dept_no = m.dept_no
        JOIN
    salaries s ON m.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY AVG(salary) desc;
/*EXERCISE FOR TIPS AND TRICKS FOR JOINS */
SELECT e.gender , count(m.emp_no)
from employees e 
join 
dept_manager m on e.emp_no=m.emp_no
group by  gender ;

/* UNION V/S UNION ALL */
DROP TABLE IF EXISTS employees_dup;
CREATE TABLE employees_dup(
emp_no int (11),
birth_date date ,
first_name varchar(14),
last_name varchar (16),
gender enum ('M', 'F'),
hire_date date );
/* duplicate the structure of the employees table */
INSERT INTO employees_dup
select e.*
from employees e 
limit 20;

-- insert a duplicate of 1st row
insert into employees_dup values 
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');

-- nowfinaly 
select e.emp_no,
e.first_name,
e.last_name,
null as dept_no,
null as from_date
from 
employees_dup e
where e.emp_no = 10001
union all select 
null as emp_no,
null as first_name ,
null as last_name ,
m.dept_no,
m.from_date
from dept_manager m; 
 
 /* exercise */
 select * 
 from 
 ( select e.emp_no,
e.first_name,
e.last_name,
null as dept_no,
null as from_date
from 
employees e 
where last_name ='Denis' UNION SELECT
null as emp_no,
null as first_name,
null as last_name,
dm.dept_no,
dm.from_date
from dept_manager dm) as a 
order by -a.emp_no desc; 

