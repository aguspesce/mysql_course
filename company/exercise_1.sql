-- Create a database
DROP DATABASE IF EXISTS company;
CREATE DATABASE IF NOT EXISTS company;

USE company;

-- create table if not exists employee(
    -- id int unsigned primary key
-- );
-- Create employee table
CREATE TABLE IF NOT EXISTS Employee(
    employee_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    last_name VARCHAR(50),
    salary INT,
    joining_date DATE,
    department VARCHAR(50)
);

-- Create reward table
CREATE TABLE IF NOT EXISTS Reward(
    employee_ref_id INT UNSIGNED NOT NULL,
    date_reward DATE,
    amount INT,
    FOREIGN KEY (employee_ref_id) REFERENCES Employee(employee_id)
);

-- Insert tables values
INSERT INTO Employee (name, last_name, salary, joining_date, department)
    VALUES
        ("Bob", "Kinto", 1000000, "2019-01-20", "Finance"),
        ("Jerry", "Kansxo", 6000000, "2019-01-15", "IT"),
        ("Philip", "Jose", 8900000, "2019-02-05", "Banking"),
        ("John", "Abraham", 2000000, "2019-02-25", "Insurance"),
        ("Michael", "Mathew", 2200000, "2019-02-28", "Finance"),
        ("Alex", "chreketo", 4000000, "2019-05-10", "IT"),
        ("Yohan", "Soso", 1230000, "2019-06-20", "Banking");

INSERT INTO Reward (Employee_ref_id, date_reward, amount)
    VALUES
        (1, "2019-05-11", "1000"),
        (2, "2019-02-15", "5000"),
        (3, "2019-04-22", "2000"),
        (1, "2019-06-20", "8000");

-- Questions
-- 1. Get all employees.
 SELECT * FROM Employee;

-- 2. Display the first name and last name of all employees.
SELECT name, last_name FROM Employee;

-- 3. Display all the values of the “First_Name” column using the alias “Employee Name”
SELECT name as "Employee Name" FROM Employee;

-- 4. Get all “Last_Name” in lowercase.
SELECT LOWER(last_name) FROM Employee;

-- 5. Get all “Last_Name” in uppercase.
SELECT UPPER(name) FROM Employee;

-- 6. Get unique “DEPARTMENT”.
SELECT DISTINCT department FROM Employee;

-- 7. Get the first 4 characters of “FIRST_NAME” column.
SELECT LEFT(NAME, 4) FROM Employee;

-- 8. Get the position of the letter ‘h’ in ‘John’.
SELECT LOCATE("h", name) FROM Employee WHERE name="John";

-- 9. Get all values from the “FIRST_NAME” column after removing white space on the right.
SELECT RTRIM(name) FROM Employee;

-- 10. Get all values from the “FIRST_NAME” column after removing white space on the left.
SELECT LTRIM(NAME) FROM Employee;
