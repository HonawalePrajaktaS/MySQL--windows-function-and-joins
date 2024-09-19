# windows function #
use chatgpt;
select employee_id, department_id,salary, row_number() over (partition by department_id order by salary desc) as row_num,
rank() over (partition by department_id order by salary desc) as rank_num,
dense_rank() over (partition by department_id order by salary desc) as dense from employees;	
 
 SELECT employee_id, department_id, salary,
SUM(salary) OVER (PARTITION BY department_id ORDER BY employee_id ) as SUM,
max(salary) OVER (PARTITION BY department_id ORDER BY employee_id) as MAX,
min(salary) OVER (PARTITION BY department_id ORDER BY employee_id) as MIN,
count(salary) OVER (PARTITION BY department_id) as COUNT,
avg(salary) OVER (PARTITION BY department_id ) as AVG
FROM employees;

# 2ND MAXIMUM SALALRY IN THE COMPANY
select employee_id,name, salary, dense_rank() over (order by salary desc) as dr from employees limit 1 offset 1;

with mama as (select employee_id, name, salary, dense_rank() over(order by salary desc ) from employees)
select employee_id, name , salary from mama limit 1 offset 1;

with mama as (select employee_id, name, salary, dense_rank() over(order by salary desc ) as rankk from employees)
select employee_id, name , salary from mama where rankk=2;

with mama as (select employee_id, name, salary, row_number() over(order by salary desc ) as row_num from employees)
select employee_id, name , salary from mama where row_num=2;

with mama as (select employee_id, name, salary, rank() over(order by salary desc ) as rankkkk from employees)
select employee_id, name , salary from mama where rankkkk=3 ;

# 2ND lowest SALALRY IN THE COMPANY
with minsal as(select employee_id, name, salary , row_number() over (order by salary) as rn from employees)
select name,salary from minsal where rn=2;

select name , salary, dense_rank()over(order by salary asc) as sal from employees  limit 1 offset 1;
select name , salary, dense_rank()over(order by salary asc) as sal from employees; 
SELECT salary,name
FROM (SELECT name,salary, RANK() OVER (ORDER BY salary) as rankk FROM employees) ranked_salaries
WHERE rankk = 2;

SELECT 
    employee_id, 
    sale_date, 
    amount, 
    LAG(amount, 1) OVER (PARTITION BY employee_id ORDER BY sale_date) AS previous_day_amount,
    amount - LAG(amount, 1) OVER (PARTITION BY employee_id ORDER BY sale_date) AS amount_difference
FROM 
    sales ;



