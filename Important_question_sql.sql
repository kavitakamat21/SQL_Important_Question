-- Top 50 SQL Query Questions:-
create  database worker_db;
use worker_db;

CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
    (1, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
    (2, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
    (3, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
    (4, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
    (5, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
    (6, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
    (7, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
    (8, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
    (1, 5000, '2023-02-20'),
    (2, 3000, '2023-06-11'),
    (3, 4000, '2023-02-20'),
    (1, 4500, '2023-02-20'),
    (2, 3500, '2023-06-11');

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
    (1, 'Manager', '2023-02-20 00:00:00'),
    (2, 'Executive', '2023-06-11 00:00:00'),
    (8, 'Executive', '2023-06-11 00:00:00'),
    (5, 'Manager', '2023-06-11 00:00:00'),
    (4, 'Asst. Manager', '2023-06-11 00:00:00'),
    (7, 'Executive', '2023-06-11 00:00:00'),
    (6, 'Lead', '2023-06-11 00:00:00'),
    (3, 'Lead', '2023-06-11 00:00:00');
    
    select * from worker;
    select * from Bonus;
    select * from Title;
    
-- 1. Write SQL Query to Display FIRST_NAME with Alias WORKER_NAME.
select FIRST_NAME as worker_name from worker;

-- 2. Write SQL Query to Display FIRST_NAME in Upper Case from the Worker Table.
select upper(FIRST_NAME) worker_name from worker; 

-- 3. Write SQL Query to Display Unique DEPARTMENT Values from the Worker Table.
select distinct department from worker;

-- 4. Write SQL Query to Display the First 3 Chars of FIRST_NAME from the Worker Table. 
select substring(FIRST_NAME,1,3) from worker;

-- 5. Write SQL Query to Find the Position of Alphabet ‘a’ in the FIRST_NAME Column.
-- By using instr() position of alphabet "a"
   select FIRST_NAME, instr(FIRST_NAME,"a") from worker;
   select FIRST_NAME, instr(FIRST_NAME,"a") from worker where FIRST_NAME = "Geetika";

-- 6. Write SQL Query to Fetch FIRST_NAME from the Worker Table With No White Spaces on the Right.
select rtrim(FIRST_NAME) worker_name  from worker;

-- 7. Write SQL Query to List DEPARTMENT from the Worker Table With No White Spaces on the Left.
select ltrim(department) department_name  from worker;

-- 8. Write SQL Query to Display Unique DEPARTMENT Values and Their Lengths from the Worker Table.
select distinct department , length(DEPARTMENT) Department_length from worker;

-- 9. Write SQL Query to Replace ‘a’ with ‘A’ in FIRST_NAME from the Worker Table.
select replace(FIRST_NAME,"a","A") from worker;

-- 10. Write SQL Query to Combine FIRST_NAME and LAST_NAME into COMPLETE_NAME.
select concat(FIRST_NAME,"  ",LAST_NAME) as COMPLETE_NAME from worker;

-- 11. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending.
select FIRST_NAME from worker order by FIRST_NAME asc;

-- 12. Write SQL Query to Print Worker Details Ordered by FIRST_NAME Ascending and DEPARTMENT Descending.
select FIRST_NAME, DEPARTMENT from worker order by DEPARTMENT,FIRST_NAME asc;

-- 13. Write SQL Query to Print Worker Details with First Names “Vipul” and “Satish”.
-- IN operator used to check for multiple values.
select * from worker where FIRST_NAME in ("Vipul","Satish"); 

-- 14. Write SQL Query to Print Worker Details Excluding First Names (“Vipul” and “Satish”).
-- use the NOT IN operator to exclude certain values.
select * from worker where FIRST_NAME not in ("Vipul","Satish"); 

-- 15. Write SQL Query to Print Worker Details with DEPARTMENT Name as “Admin”.
select * from worker where DEPARTMENT = "Admin";
Select * from Worker where DEPARTMENT like 'Admin%';

-- 16. Write SQL Query to Print Worker Details Whose FIRST_NAME Contains ‘a’.
select * from worker where FIRST_NAME like "a%";

-- 17. Write SQL Query to List Worker Info Whose FIRST_NAME Ends with ‘a’.
select * from worker where FIRST_NAME like "%a";

-- 18. Write SQL Query to Fetch Workers Whose FIRST_NAME Ends with ‘h’ and Has 6 Letters.
select * from worker where FIRST_NAME like "_____h";
Select * from Worker where FIRST_NAME like '_____h' AND LENGTH(FIRST_NAME) = 6;

-- 19. Write SQL Query to Show Worker Info Whose SALARY is Between 100000 & 500000.
select * from worker where salary  Between 100000 and  500000;

-- 20. Write SQL Query to Display Workers Who Joined in Feb 2021.
select * from worker where JOINING_DATE between "2021-02-01" and "2021-02-28";

-- 21. Write SQL Query to Print Employee Count in ‘Admin’ Department.
select count(*) from worker where Department = "Admin";

-- 22. Write SQL Query to Fetch Worker Names with Salaries >= 50000 and <= 100000.
select *, FIRST_NAME as Worker_Name from worker where salary between 50000 and  100000;

-- 23. Write SQL Query to List Worker Count Per Department in Descending Order.
SELECT DEPARTMENT, count(WORKER_ID) No_Of_Workers FROM Worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;
SELECT DEPARTMENT, count(DEPARTMENT) No_Of_Workers FROM Worker GROUP BY DEPARTMENT ORDER BY No_Of_Workers DESC;

-- 24. Write SQL Query to Print Worker Details Who Are Also Managers.
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE 
FROM Worker W 
INNER JOIN Title T 
ON W.WORKER_ID = T.WORKER_REF_ID
AND T.WORKER_TITLE in ('Manager');

-- All 
SELECT DISTINCT W.FIRST_NAME, T.WORKER_TITLE 
FROM Worker W 
INNER JOIN Title T 
ON W.WORKER_ID = T.WORKER_REF_ID;

-- 25. Write SQL Query to Fetch Duplicate Records with Matching Data in Specific Fields of a Table.
SELECT WORKER_TITLE, AFFECTED_FROM, COUNT(*) FROM Title GROUP BY WORKER_TITLE, AFFECTED_FROM HAVING COUNT(*) > 1;

-- 26. Write SQL Query to Show Only Odd Rows from a Table.
-- Odd Rows
SELECT * FROM Worker WHERE WORKER_ID % 2!= 0;

-- 27. Write SQL Query to Show Only Even Rows from a Table.
select * from worker where WORKER_ID % 2=0;

-- 28. Write SQL Query to Clone a New Table from Another Table.
CREATE TABLE WorkerClone AS SELECT * FROM Worker;

-- 29. Write SQL Query to Display Intersecting Records of Two Tables.
SELECT WORKER_ID,first_name, WORKER_REF_ID,WORKER_TITLE
from worker w
inner join title t
on w.WORKER_ID = t.WORKER_REF_ID;

-- 30. Write SQL Query to Show Records from One Table That Are Not Present in Another Table.
SELECT WORKER_ID,first_name,WORKER_TITLE
from worker w
left join title t
on w.WORKER_ID = t.WORKER_REF_ID;

-- 31. Write SQL Query to Show the Current Date and Time.
select now();
SELECT CURRENT_TIMESTAMP;

-- If you only want:
-- Date: SELECT CURDATE();
-- Time: SELECT CURTIME();

-- 32. Write SQL Query to Show the Top n (say 6) Records of a Table.
SELECT *
FROM worker 
LIMIT 6;

-- BY ordering:-
SELECT *
FROM worker
ORDER BY worker_id DESC
LIMIT 10;

-- 33. Write SQL Query to Determine the Nth (say n=5) Highest Salary.

-- distinct use not to duplicate value only  unique value
SELECT DISTINCT SALARY
FROM Worker
ORDER BY SALARY DESC
LIMIT 1 OFFSET 4;

-- Without distinct
SELECT  SALARY
FROM Worker
ORDER BY SALARY DESC
LIMIT 1 OFFSET 4;

-- Arrange salary in desc order highest to lowest salary.
select salary from worker order by salary desc;

-- 34. Write SQL Query to Determine 5th Highest Salary Without Using TOP or Limit.
-- BY using subquery
SELECT DISTINCT salary
FROM worker w1
WHERE 5 = (
    SELECT COUNT(DISTINCT salary)
    FROM worker w2
    WHERE w2.salary >= w1.salary
);

-- 35. Write SQL Query to Fetch the List of Employees with the Same Salary.
-- Using GROUP BY + HAVING
SELECT salary, GROUP_CONCAT(first_name) AS worker
FROM worker
GROUP BY salary
HAVING COUNT(*) > 1;

--  Using Self-Join
SELECT w1.worker_id, w1.first_name, w1.salary
FROM worker w1
JOIN worker w2
  ON w1.salary = w2.salary
 AND w1.worker_id <> w2.worker_id
ORDER BY w1.salary;

-- What is a Self Join?
-- A self join is when a table is joined with itself.
-- Useful when comparing rows in the same table (e.g., finding employees with the same salary, managers vs employees, etc.).
-- You must use table aliases (e1, e2) to differentiate between the two instances.

-- SELECT e1.column_name, e2.column_name
-- FROM table_name e1
-- JOIN table_name e2
--   ON e1.common_field = e2.common_field
-- WHERE e1.id <> e2.id;

-- table_name e1 → first instance of the table.
-- table_name e2 → second instance of the same table.
-- ON e1.common_field = e2.common_field → join condition.
-- WHERE e1.id <> e2.id → avoids matching the row with itself.

-- Example: Employees with the Same Salary
-- SELECT e1.employee_id, e1.employee_name, e1.salary,
--        e2.employee_id AS other_employee_id,
--        e2.employee_name AS other_employee_name
-- FROM employees e1
-- JOIN employees e2
--   ON e1.salary = e2.salary
--  AND e1.employee_id <> e2.employee_id
-- ORDER BY e1.salary;


-- 36. Write SQL Query to List the Employee with the Second-Highest Salary.
select distinct salary from worker order by salary desc limit 1 offset 1;
-- Method 2
SELECT max(Salary) from Worker where Salary not in (Select max(Salary) from Worker);

-- 37. Write SQL Query to Display One Row Twice in the Results from a Table.
SELECT FIRST_NAME, DEPARTMENT from Worker W where W.DEPARTMENT='HR' 
union all select FIRST_NAME, DEPARTMENT from Worker W1 where W1.DEPARTMENT='HR';

-- 38. Write SQL Query to Fetch Intersecting Records of Two Tables.
-- select worker_id from worker 
-- intersect
-- select WORKER_REF_ID from title;

select worker_id,first_name,WORKER_REF_ID
from worker w
inner join title t
on w.worker_id = t.WORKER_REF_ID;

select *
from worker w
inner join title t
on w.worker_id = t.WORKER_REF_ID;

-- 39. Write SQL Query to Fetch the First 50% of Records from a Table.
SELECT * FROM WORKER WHERE WORKER_ID <= (SELECT count(WORKER_ID)/2 from Worker);

-- 40. Write SQL Query to Fetch Departments with Less than Five People in Them.
-- use a GROUP BY clause to group by the department, then 
-- use HAVING to filter departments where the count of employees is less than 5.
SELECT DEPARTMENT, COUNT(WORKER_ID) as 'Number of Workers' FROM Worker GROUP BY DEPARTMENT HAVING COUNT(WORKER_ID) < 5;

SELECT department, COUNT(*) AS worker_count
FROM worker
GROUP BY department
HAVING COUNT(*) < 5;

-- 41. Write SQL Query to Show All Departments with the Number of People in There.
SELECT department, COUNT(*) AS worker_count
FROM worker
GROUP BY department
HAVING COUNT(*);

-- 42. Write SQL Query to Show the Last Record from a Table.
-- Method 1
select * from worker order by worker_id desc limit 1;
-- Method 2
Select * from Worker where WORKER_ID = (SELECT max(WORKER_ID) from Worker);

-- 43. Write SQL Query to Fetch the First Row of a Table.
-- Method 1
select * from worker order by worker_id asc limit 1;
-- Method 2
Select * from Worker where WORKER_ID = (SELECT min(WORKER_ID) from Worker);

-- 44. Write SQL Query to Fetch the Last Five Records from a Table.
select * from worker order by worker_id asc limit 5 offset 3;

-- Solution 2
SELECT * FROM Worker ORDER BY WORKER_ID DESC LIMIT 5;

-- 45. Write SQL Query to Show Employees with the Highest Salary in Each Department.
SELECT t.DEPARTMENT, t.FIRST_NAME, t.Salary from (SELECT max(Salary) as TotalSalary, DEPARTMENT 
from Worker group by DEPARTMENT) as TempNew Inner Join Worker t 
on TempNew.DEPARTMENT = t.DEPARTMENT and TempNew.TotalSalary = t.Salary;

SELECT department, MAX(salary) 
FROM worker  
group by department;

-- 46. Write SQL Query to Fetch the Top Three Max Salaries from a Table.
SELECT distinct Salary from Worker a WHERE 3 >= (SELECT count(distinct Salary) 
from Worker b WHERE a.Salary <= b.Salary) order by a.Salary desc;

select distinct salary  from worker order by salary desc limit 3 offset 1;

SELECT DISTINCT Salary
FROM Worker a
WHERE 3 >= (
    SELECT COUNT(DISTINCT Salary)
    FROM Worker b
    WHERE a.Salary <= b.Salary
)
ORDER BY Salary DESC;

-- 47. Write SQL Query to Fetch the Three Min Salaries from a Table.
select distinct salary from worker order by salary asc limit 3;
select salary from worker order by salary asc;

-- 48. Write SQL Query to Fetch the Nth Max Salaries from a Table.
select salary from worker order by salary desc limit 1 offset 2;

-- 49. Write SQL Query to Fetch Departments and Their Total Salaries.
select Department ,sum(salary) from worker group by department;

-- 50. Write SQL Query to Fetch Workers with the Highest Salary.
select  max(salary)  from worker;

    
    
    
    
