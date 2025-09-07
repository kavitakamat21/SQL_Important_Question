 # 📌SQL Practice Project – Top 50 SQL Queries :-
 
This repository contains a SQL-based mini project where I created a sample database (worker_db) and solved 50 commonly asked SQL interview queries.
It’s designed for anyone who wants to learn SQL by practice and use a real database structure for queries.
This repository contains a collection of SQL queries, scripts, and exercises that demonstrate my ability to work with relational databases. 
It covers real-world use cases such as employee management, sales analysis, and reporting.

## 📊 SQL  Project :-

### Schema for Workers, Bonus, Title.

## 🛠️ Tech Stack :-

- Database: MySQL
- Concepts Covered:
   - ✅ SELECT basics
   - ✅ String functions
   - ✅ Filtering with WHERE, LIKE, IN, BETWEEN
   - ✅ Joins (INNER, LEFT)
   - ✅ Aggregations (COUNT, SUM, MAX, AVG)
   - ✅ Grouping + HAVING
   - ✅ Subqueries
   - ✅ current date and time
   - ✅ Table cloning & set operations

## 🏗️Sample Database Schema
Worker Table
```sql
Copy code
CREATE TABLE Worker (
    worker_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);
```
Title Table
```sql

CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);
```
Bonus Table
```sql
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) ON DELETE CASCADE
);
```

## 📂 Project Structure

  ### ├── create_database.sql   -  Create worker_db and tables
  ### ├── insert_data.sql       - Insert sample employee, bonus, and title data
  ### ├── queries.sql           - 50 solved SQL interview questions
  ### ├── README.md             - Project documentation


## 🚀 Getting Started

Clone the repository: 

    git clone https://github.com/kavitakamat21/sql-practice.git
     cd sql-practice

## 📚 Example Queries
1️⃣ Display FIRST_NAME with Alias WORKER_NAME
```sql
SELECT FIRST_NAME AS WORKER_NAME FROM Worker;
```
2️⃣ Fetch the Top 3 Maximum Salaries
```sql
SELECT DISTINCT Salary
FROM Worker
ORDER BY Salary DESC
LIMIT 3;
```

3️⃣ Fetch the Top 3 Maximum Salaries
```sql
SELECT DISTINCT Salary 
FROM Worker a 
WHERE 3 >= (
    SELECT COUNT(DISTINCT Salary) 
    FROM Worker b 
    WHERE a.Salary <= b.Salary
)
ORDER BY Salary DESC;
```

# 🎯 Learning Outcomes

By practicing these 50 SQL queries, you will master:
- How to manipulate strings in SQL (UPPER, SUBSTRING, INSTR, TRIM)
- How to filter data (WHERE, LIKE, BETWEEN)
- How to aggregate and group data (GROUP BY, HAVING)
- How to find top-N salaries using subqueries and window functions
- How to work with joins across multiple tables
- How to clone and intersect tables
- How to fetch nth highest salary (a very common interview question!)

## ☑️ Some important topic explain :-
  ### ♦ self join
  
  What is a Self Join?
  
  A self join is when a table is joined with itself. Useful when comparing rows in the same table (e.g., finding employees with the same salary, managers vs employees, etc.).
  You must use table aliases (e1, e2) to differentiate between the two instances.

 ### Syntax :-
 
table_name e1 → first instance of the table. 

table_name e2 → second instance of the same table.

ON e1.common_field = e2.common_field → join condition.

WHERE e1.id <> e2.id → avoids matching the row with itself.



## ✅ Conclusion

This project was built to serve as a comprehensive SQL practice guide with 50 real-world queries. By working through it, you will gain:

- A solid foundation in SQL for interviews and day-to-day database work.
-  ability to analyze data efficiently using filtering, grouping, and aggregation.
- Hands-on experience with joins, subqueries, and window functions.
- The skills to solve common SQL problems like Nth highest salary, duplicate detection, top-N queries, and department-wise analysis.


## 📬 Contact
👩‍💻 Author: Kavita Kamat

📧 Email: kavitakamat22@gmail.com







