# MySQL SQL Practice Project

## Project Overview

This project demonstrates practical SQL skills using MySQL. It covers database creation, table relationships, data manipulation, joins, subqueries, aggregate functions, views, indexes, transactions, and constraints.

The project is designed for students and beginners who want to develop a strong foundation in database management and SQL query writing.

## Technologies Used

- **Database:** MySQL
- **SQL Editor:** MySQL Workbench
- **Language:** SQL

## Project Topics

### 1. Database and Table Creation
- Create and select databases.
- Create tables with appropriate data types.
- Insert sample records into tables.

### 2. CRUD Operations
- Create records using `INSERT`.
- Retrieve records using `SELECT`.
- Modify records using `UPDATE`.
- Remove records using `DELETE`.

### 3. Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN
- CROSS JOIN
- Joining multiple tables using primary and foreign keys.

### 4. Subqueries
- Find the second-highest salary.
- Compare salaries with the average salary.
- Find students scoring above average.
- Compare course fees with average fees.

### 5. Aggregate Functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MAX()`
- `MIN()`
- `GROUP BY`, `HAVING`, and `ORDER BY`

### 6. Views
- Create views.
- Retrieve data from views.
- Update data through an updatable view.
- Drop views.

### 7. Indexes
- Create indexes on columns.
- Create composite indexes.
- Drop indexes.
- Understand the purpose of indexes in query performance.

### 8. Transactions
- `START TRANSACTION`
- `COMMIT`
- `ROLLBACK`
- `SAVEPOINT`
- ACID properties of database transactions.

### 9. Constraints
- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK
- DEFAULT
- ON DELETE CASCADE
- ON UPDATE CASCADE

## Database Tables

The project includes the following main tables:

| Table | Purpose |
|---|---|
| `students` | Stores student information and marks |
| `employees` | Stores employee names, departments, and salaries |
| `course` | Stores course names and fees |
| `enrolments` | Connects students with their enrolled courses |
| `departments` | Stores department details |

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench and connect to your MySQL server.
3. Download the SQL file from this repository.
4. Open the downloaded `.sql` file in MySQL Workbench.
5. Execute the SQL statements in the correct order.
6. Check the Result Grid to verify the query outputs.

**Note:** Run the script in a fresh practice database if possible. If tables already exist, some `CREATE TABLE` and `INSERT` statements may produce errors or duplicate data.

## SQL Script

[Click here to view the complete SQL project](https://github.com/Dileep0505/sql-project-dileep/blob/main/sql%20project%28dileep%29.sql)

## Learning Outcomes

Through this project, I am developing practical skills in:

- Writing SQL queries.
- Managing relational databases.
- Establishing relationships between tables.
- Analysing data using joins and aggregate functions.
- Maintaining data integrity using constraints.
- Understanding database performance and transactions.

## Author

**Dileep**

Student | SQL Learner

## Purpose

This project is created for educational purposes and to practise SQL concepts through hands-on examples.
