--1. difference in salary department wise

with x as 
(select *,
max(SALARY) over (partition by dept_name order by dept_name) as high_,
min(SALARY) over (partition by dept_name order by dept_name) as low_

from employee)

select dept_name, high_-low_ as diff
from x


--2. find employee whose salary is less than avg salary

select* from employee;

with x as
(select DEPT_NAME, emp_ID, emp_NAME, SALARY, AVG(SALARY) over (partition by DEPT_NAME order by DEPT_NAME ) as sal

from employee)

select DEPT_NAME, emp_ID, emp_NAME, SALARY, sal
from x
where SALARY < sal
