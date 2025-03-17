CREATE DATABASE employing
USE employing
CREATE TABLE employees (EmpID int, name varchar(50), salary decimal(10,2))
INSERT into employees VALUES (1, 'Hasan', 3450.20)
INSERT into employees VALUES (2, 'Ali', 6500.34)
INSERT into employees VALUES (3, 'sardor', 7000.43)
SELECT* FROM employees
INSERT into employees VALUES
(4, 'HUsan', 3456.78), (5, 'Chaqir', 56789.78), (6, 'Kim', 3498.89)
UPDATE employees
SET salary = 4000.00 WHERE EmpID = 1
UPDATE employees 
SET name = 'Sardor' WHERE salary = 7000.43
UPDATE employees
SET name ='Husan' WHERE  EmpID = 4
BEGIN TRAN
DELETE employees WHERE EmpID =2
COMMIT
SELECT* FROM employees
-- ma'lumotlar jadval ko'rinishida beryapman farqlarini aidan so'radim
CREATE TABLE farq ("DELETE" text , "truncate" text , "drop" text )
BEGIN TRAN
ALTER TABLE farq
ADD xususiyatlar text
SELECT * FROM farq
INSERT farq VALUES('Ha, faqat tanlangan qatorlarni', 'Ha, barcha qatorlarni', 'Ha, butun jadvalni', 'Ma’lumotlarni o‘chirish')
insert farq VALUES ('ha', 'yoq', 'yoq', 'WHERE sharti mavjudmi?'), ('Ha (tranzaksiya bo‘lsa)', 'ha', 'yoq', 'Rollback (qayta tiklash)'), ('yoq', 'ha', 'N/A (jadval yo‘q bo‘ladi)', 'IDENTITY qayta boshlanadimi?'),
('Sekinroq', 'Tezroq', 'Eng tez', 'Tezligi'), ('ha', 'ha', 'yoq', 'Jadval tuzilishi saqlanadimi?'), ('Mavjud bo‘lsa ishlaydi', 'Ba’zan cheklovlar talab qiladi', 'Cheklovlarga bog‘liq bo‘lishi mumkin', 'Jadvalga bog‘langan bog‘lamalar (Foreign Key) ta’siri')
SELECT xususiyatlar, "delete", "truncate", "drop" FROM farq
-- Test jadvalini yaratish
CREATE TABLE TestTable (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(50))

-- Ma'lumot qo'shish
INSERT INTO TestTable (Name) VALUES ('Ali'), ('Bobur'), ('Laylo')

-- DELETE ni sinash
DELETE FROM TestTable WHERE Name = 'Ali'
SELECT * FROM TestTable

-- TRUNCATE ni sinash
TRUNCATE TABLE TestTable
SELECT * FROM TestTable

-- DROP ni sinash
DROP TABLE TestTable
BEGIN TRAN
ALTER TABLE employees  alter COLUMN name VARCHAR (100)
ROLLBACK
ALTER table employees ALTER COLUMN name VARCHAR (100)
ALTER TABLE employees
ADD departmant VARCHAR (50)
SELECT * FROM employees
ALTER TABLE employees ALTER COLUMN salary FLOAT

CREATE TABLE deparments ( departmentID int PRIMARY Key, departmentName varchar (50))

BEGIN TRAN
DELETE FROM employees
SELECT * FROM employees
COMMIT
CREATE TABLE gh (g int PRIMARY Key, de varchar(50))
INSERT gh VALUES(1, 'Ali'), (2, 'Vali'), (3, 'Mali')

INSERT into deparments (departmentID, departmentName) SELECT g, de FROM gh
SELECT * FROM deparments
ALTER TABLE deparments
ADD department VARCHAR (50),
salary INT
--INSERT into deparments (department, salary) VALUES ( 'HR', 4900), ('IT', 5300), ('Finance', 5000), shunday qilib qo'shmoqchi edim o'xshamadi nega?
UPDATE deparments
SET department = 'HR', salary = 4900
WHERE departmentID = 1
UPDATE deparments
SET department = 'IT', salary = 5300
WHERE departmentID = 2
UPDATE deparments
SET department = 'Finance', salary = 5000
WHERE departmentID = 3
UPDATE deparments
SET department = 'manadment'
WHERE salary > 5000
TRUNCATE TABLE deparments
ALTER TABLE deparments
DROP COLUMN department
SELECT * FROM deparments
/*ALTER TABLE deparments rename TO staffmembers
ALTER TABLE deparments RENAME TO StaffMembers; shu kodlar ishlamadi nega? */
EXEC sp_rename 'deparments', 'StaffMembers';
EXEC sp_rename 'employees', 'department'
DROP TABLE department

CREATE TABLE products (productsID int PRIMARY Key, productsName varchar (50), category varchar(50), price decimal)
ALTER TABLE products
ADD CONSTRAINT chk_price CHECK (price > 0)
ALTER TABLE products
ADD StockQuantity INT DEFAULT 50

SELECT * FROM products
EXEC sp_rename 'products.category', 'ProductCategory', 'column'
INSERT INTO products VALUES (1, 'apple', 'fruit', 20, 20)
INSERT INTO products VALUES (2, 'phone', 'electronic', 400, 20), (3, 'tv', 'electronic', 500, 35), (4, 'pineapple', 'fruit', 35, 50), (5, 'banana', 'fruit', 25, 55)

SELECT * INTO Products_Backup FROM Products;

SELECT * FROM Products_Backup

EXEC sp_rename 'products', 'inventory'
SELECT * FROM inventory
ALTER TABLE inventory ALTER COLUMN price FLOAT

ALTER TABLE inventory DROP CONSTRAINT chk_price;

ALTER TABLE inventory ADD CONSTRAINT chk_price CHECK (price > 0);

ALTER TABLE inventory ADD ProductCode INT IDENTITY(1000,5);


SP_HELP 'Inventory';
BEGIN TRAN
SELECT COLUMN_NAME, COLUMNPROPERTY(OBJECT_ID('Inventory'), COLUMN_NAME, 'IsIdentity') AS IsIdentity
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Inventory';
COMMIT
