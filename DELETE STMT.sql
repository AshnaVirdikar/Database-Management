USE employees;
COMMIT;

SELECT *
FROM titles
WHERE emp_no = 999903; 

DELETE FROM employees
WHERE  emp_no = 999903;
ROLLBACK ;

/* PART TWO */
 SELECT * 
 FROM departments_dup
 order by dept_no ;
  delete from departments_dup;
  rollback;
  
  /* exercise part two * /
  
  delete from departments 
   where dept_no ='d010' ;
   
   SELECT 
    *
FROM
    departments
ORDER BY dept_no;

