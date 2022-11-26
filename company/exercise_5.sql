-- Questions
-- 1. Get the department and total salary, grouped by department, and sorted by total salary in descending order.
SELECT department, SUM(salary) as total_salary FROM Employee
    GROUP BY department
    ORDER BY total_salary DESC;

-- 2. Get the department, the number of employees in that department, and the total salary grouped by department, and sorted by total salary in descending order.
SELECT department, COUNT(name), SUM(salary) AS total FROM Employee
    GROUP BY department
    ORDER BY total DESC;

-- 3. Get the average salary by department in ascending order of salary.
SELECT department, AVG(salary) AS avg_salary FROM Employee
    GROUP BY department
    ORDER BY avg_salary ASC;

-- 4. Get the maximum salary by department in ascending order of salary.
SELECT department, MAX(salary) AS max_salary FROM Employee
    GROUP BY department
    ORDER BY max_salary ASC;

-- 5. Get the minimum salary by department in ascending order of salary.
SELECT department, MIN(salary) AS min_salary FROM Employee
    GROUP BY department
    ORDER BY min_salary ASC;

-- 6. Get the number of employees grouped by year and month of membership.
SELECT joining_date, COUNT(name) FROM Employee
    GROUP BY YEAR(joining_date), MOUTH(joining_date);

-- 7. Get the department and total salary grouped by the department, where the
-- total salary is greater than 1,000,000, and sorted in descending order of
-- the total salary.
SELECT department, SUM(salary) as total_salary FROM Employee
    GROUP BY department
    HAVING total_salary>1000000
    ORDER BY total_salary DESC;

-- 8. Get all the details of an employee if the employee exists in the Reward
-- table? Or in other words, find employees with bonuses.
SELECT E.* FROM Employee as E
    WHERE EXISTS(
        SELECT R.employee_ref_id FROM Reward AS R
        WHERE E.employee_id=R.employee_ref_id
    );
