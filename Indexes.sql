CREATE INDEX i_hire_date

ON employees(hire_date);

SELECT*
from employees 
where hire_date > '2000-01-01';

#COMPOSITE INDEX

select *
from employees
where first_name = 'Georgi '
and last_name ='Facello';


CREATE  INDEX  i_composite on employees (first_name, last_name);

#EXERCISE -1

ALTER TABLE employees 
DROP INDEX i_hire_date ;

#EXERCISE -2 
SELECT * 
FROM salaries
where salary > 89000;
 
 CREATE INDEX i_salary ON salaries (salary);
 