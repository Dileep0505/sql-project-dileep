CREATE DATABASE IF NOT EXISTS college_db;
USE college_db;

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    age INT,
    department VARCHAR(50),
    marks DECIMAL(5,2)
);

INSERT INTO students
(student_name, age, department, marks)
VALUES
('Arun', 20, 'CSE', 85),
('Priya', 21, 'ECE', 92),
('Rahul', 20, 'CSE', 76),
('Sneha', 22, 'IT', 88),
('Kiran', 21, 'EEE', 32),
('Divya', 20, 'CSE', 95),
('Vamsi', 22, 'IT', 67),
('Pooja', 21, 'ECE', 81),
('Sai', 20, 'CSE', 29),
('Anusha', 22, 'IT', 73);

SELECT * FROM students;

SELECT *
FROM students
WHERE marks > 80;

UPDATE students
SET marks = 90
WHERE student_id = 3;

SELECT * FROM students
WHERE student_id = 3;

DELETE FROM students
WHERE marks < 35 ;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10,2) NOT NULL
);

INSERT INTO employees
(employee_name, department, salary)
VALUES
('Ravi', 'IT', 70000),
('Priya', 'HR', 55000),
('Arun', 'IT', 90000),
('Sneha', 'Finance', 60000),
('Kiran', 'HR', 50000),
('Divya', 'IT', 90000),
('Vamsi', 'Finance', 45000),
('Pooja', 'IT', 75000);

SELECT MAX(salary) AS second_highest_salary
FROM employees
WHERE salary < (
    SELECT MAX(salary)
    FROM employees
);


CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    fee DECIMAL(10,2) NOT NULL
);

INSERT INTO course (course_name, fee)
VALUES
('Python', 12000),
('Web Development', 15000),
('Data Analytics', 18000),
('Java', 14000),
('Cyber Security', 20000);

CREATE TABLE enrolments (
    enrolment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrolment_date DATE NOT NULL,
    FOREIGN KEY (student_id)
        REFERENCES students(student_id),
    FOREIGN KEY (course_id)
        REFERENCES course(course_id),
    UNIQUE (student_id, course_id)
);

INSERT INTO enrolments
(student_id, course_id, enrolment_date)
VALUES
(1, 1, '2026-01-10'),
(1, 3, '2026-01-15'),
(2, 2, '2026-01-12'),
(3, 1, '2026-02-01'),
(4, 4, '2026-02-05'),
(6, 3, '2026-02-10'),
(8, 2, '2026-02-15');



SELECT s.student_name, e.course_id
FROM students s
INNER JOIN enrolments e
ON s.student_id = e.student_id;


SELECT s.student_name, e.course_id
FROM students s
LEFT JOIN enrolments e
ON s.student_id = e.student_id;


SELECT s.student_name, e.course_id
FROM students s
RIGHT JOIN enrolments e
ON s.student_id = e.student_id;


SELECT s.student_name, c.course_name
FROM students s
CROSS JOIN course c;

SELECT s.student_name, c.course_name
FROM students s
INNER JOIN enrolments e
    ON s.student_id = e.student_id
INNER JOIN course c
    ON e.course_id = c.course_id;
    
    SELECT s.student_name, c.course_name
FROM students s
LEFT JOIN enrolments e
    ON s.student_id = e.student_id
LEFT JOIN course c
    ON e.course_id = c.course_id;
    
SELECT c.course_name, s.student_name
FROM course c
LEFT JOIN enrolments e
    ON c.course_id = e.course_id
LEFT JOIN students s
    ON e.student_id = s.student_id;
    
SELECT s.student_id, s.student_name
FROM students s
LEFT JOIN enrolments e
    ON s.student_id = e.student_id
WHERE e.enrolment_id IS NULL;

CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO departments (department_name)
VALUES ('IT'), ('HR'), ('Finance');

ALTER TABLE employees
ADD COLUMN department_id INT;

SET SQL_SAFE_UPDATES = 0;

UPDATE employees e
JOIN departments d
    ON e.department = d.department_name
SET e.department_id = d.department_id;

ALTER TABLE employees
ADD CONSTRAINT fk_employee_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

SELECT
    s.student_name,
    c.course_name,
    e.enrolment_date
FROM students s
JOIN enrolments e
    ON s.student_id = e.student_id
JOIN course c
    ON e.course_id = c.course_id;
    
    SELECT employee_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

SELECT employee_name, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM employees
    )
);

SELECT employee_name, department, salary
FROM employees
WHERE salary > (
    SELECT MAX(salary)
    FROM employees
    WHERE department = 'IT'
)
AND department <> 'IT';

SELECT student_name, marks
FROM students
WHERE marks > (
    SELECT AVG(marks)
    FROM students
);

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT AVG(salary) AS avg_salary
        FROM employees
        GROUP BY department
    ) AS department_averages
);

SELECT employee_name, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    GROUP BY salary
    HAVING COUNT(*) > 1
);

SELECT course_name, fee
FROM course
WHERE fee > (
    SELECT AVG(fee)
    FROM course
);

SELECT
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MAX(salary) AS highest_salary,
    MIN(salary) AS lowest_salary
FROM employees;

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 50000;

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;

SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department
ORDER BY employee_count DESC
LIMIT 1;


SELECT *
FROM employees
WHERE salary > 50000;

SELECT department, COUNT(*) AS student_count
FROM students
WHERE marks > 70
GROUP BY department;SELECT department, COUNT(*) AS student_count
FROM students
WHERE marks > 70
GROUP BY department;


SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 200000;

CREATE VIEW employee_salary_view AS
SELECT employee_name, salary
FROM employees;

SELECT *
FROM employee_salary_view
WHERE salary > 60000;

UPDATE employee_salary_view
SET salary = 72000
WHERE employee_name = 'Ravi';

DROP VIEW employee_salary_view;

CREATE INDEX idx_employee_name
ON employees(employee_name);


CREATE INDEX idx_department_salary
ON employees(department, salary);

DROP INDEX idx_employee_name
ON employees;

START TRANSACTION;

UPDATE employees
SET salary = salary + 1000
WHERE employee_id = 1;

SAVEPOINT salary_updated;

UPDATE employees
SET salary = salary + 2000
WHERE employee_id = 2;

ROLLBACK TO SAVEPOINT salary_updated;

COMMIT;

CREATE TABLE bank_accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(100) NOT NULL,
    balance DECIMAL(12,2) NOT NULL
) ENGINE = InnoDB;

INSERT INTO bank_accounts
VALUES
(101, 'Ravi', 20000.00),
(102, 'Priya', 10000.00);

START TRANSACTION;

UPDATE bank_accounts
SET balance = balance - 5000
WHERE account_id = 101
  AND balance >= 5000;

UPDATE bank_accounts
SET balance = balance + 5000
WHERE account_id = 102;

COMMIT;

SELECT * FROM bank_accounts;


START TRANSACTION;

INSERT INTO employees
(employee_name, department, salary)
VALUES ('Manoj', 'IT', 40000);

SAVEPOINT employee_added;

UPDATE employees
SET salary = 45000
WHERE employee_name = 'Manoj';

ROLLBACK TO SAVEPOINT employee_added;

COMMIT;


DELETE FROM employees
WHERE employee_id = 3;

TRUNCATE TABLE employees;

DROP TABLE employees;

CREATE TABLE college_staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(100) NOT NULL
);

CREATE TABLE students_demo (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

CREATE TABLE departments_demo (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE employees_demo (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES departments_demo(department_id)
);



INSERT INTO departments_demo
VALUES (1, 'IT');

INSERT INTO employees_demo
(employee_name, department_id)
VALUES ('Ravi', 1);

SHOW CREATE TABLE employees_demo;

CREATE TABLE pk_demo (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO pk_demo VALUES (1, 'Ravi');

INSERT INTO pk_demo VALUES (1, 'Priya');

