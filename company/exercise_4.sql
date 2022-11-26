-- Questions
-- 1. Get all the details on employees whose participation month (Joining_date) is “January”
SELECT * FROM Employee WHERE MONTH(joining_date)="01";

-- 2. Get all the details of the employees who joined before March 1, 2019
SELECT * FROM Employee WHERE joining_date<"2019-03-01";

-- 3. Get all the details on employees who joined after March 31, 2019
SELECT * FROM Employee WHERE joining_date>"2019-03-01";

-- 4. Get the date and time of the employee’s enrollment.
SELECT CONVERT(DATE_FORMAT(joining_date, "%y-%m-%d-%h:%i:00"), DATETIME) FROM Employee;

-- 5. Get the date and time, including milliseconds of the employee’s membership.
SELECT MICROSECOND(joining_date) FROM Employee;

-- 6. Get the difference between the “Joining_date” and “date_reward” column
SELECT E.joining_date - R.date_reward FROM Employee as E, Reward as R WHERE employee_ref_id=employee_id;

-- 7. Get the employee’s department and total salary, grouped by department.
SELECT department, SUM(salary) as total_salary FROM Employee GROUP BY department;

