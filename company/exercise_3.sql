-- Questions
-- 1. Get all the details about employees whose first name begins with ‘B’.
SELECT * FROM Employee WHERE name LIKE "B%";

-- 2. Get all the details about employees whose first name contains ‘o’.
SELECT * FROM Employee WHERE NAME LIKE "%o%";

-- 3. Get all the details of the employees whose first name ends with ‘n’.
SELECT * FROM Employee WHERE NAME LIKE "%n";

-- 4. Get all the details about employees whose first name ends with ‘n’ and contains 4 letters.
SELECT * FROM Employee WHERE name LIKE "___n";

-- 5. Get all the details about employees whose first name begins with ‘J’ and contains 4 letters.
SELECT * FROM Employee WHERE name LIKE "J___";

-- 6. Get all the details of employees whose salary is over 3,000,000.
SELECT * FROM Employee WHERE salary > 3000000;

-- 7. Get all the details about employees whose salary is less than 3,000,000.
SELECT * FROM Employee WHERE salary < 3000000;

-- 8. Get all the details about employees with a salary between 2,000,000 and 5,000,000.
SELECT * FROM Employee WHERE salary BETWEEN 2000000 AND 5000000;

-- 9. Get all the details about employees whose first name is ‘Bob’ or ‘Alex’.
SELECT * FROM Employee WHERE name IN ("Bob", "Alex");

-- 10. Get all the details about employees whose joining year is “2019”.
SELECT * FROM Employee WHERE YEAR(joining_date)="2019";
