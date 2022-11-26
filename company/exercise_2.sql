-- Questions
-- 1. Get the length of the text in the “First_name” column.
SELECT LENGTH(name) FROM Employee;

-- 2. Get the employee’s first name after replacing ‘o’ with ‘#’.
SELECT REPLACE(name,"o", "#") FROM Employee;

-- 3. Get the employee’s last name and first name in a single column separated by a ‘_’.
SELECT CONCAT(name, "_", last_name) FROM Employee;

-- 4. Get the year, month, and day from the “Joining_date” column.
SELECT YEAR(joining_date), MONTH(joining_date), DAY(joining_date) from Employee;

-- 5. Get all employees in ascending order by first name.
SELECT * FROM Employee ORDER BY name ASC;

-- 6. Get all employees in descending order by first name.
SELECT * FROM Employee ORDER BY name DESC;

-- 7. Get all employees in ascending order by first name and descending order by salary.
SELECT * FROM Employee ORDER BY name ASC,salary DESC;

-- 8. Get employees whose first name is “Bob”.
SELECT * FROM Employee WHERE name="Bob";

-- 9. Get employees whose first name is “Bob” or “Alex”.
SELECT * FROM Employee WHERE name IN ("Bob","Alex");

-- 10. Get employees whose first name is neither “Bob” nor “Alex”.
SELECT * FROM Employee WHERE name NOT IN ("Bob","Alex");
