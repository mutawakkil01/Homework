CREATE DATABASE schooldb

use schooldb
/*Ma'lumot (Data) – Bu haqiqatlar, raqamlar, belgilar yoki boshqa shakldagi xom ma'lumot bo‘lib, kompyuter tizimida saqlanadi va qayta ishlanadi.
Ma'lumotlar bazasi (Database) – Bu ma'lumotlarni saqlash, boshqarish va ularga tezkor kirish imkonini beruvchi tuzilmali tizim.
Aloqador ma'lumotlar bazasi (Relational Database) – Bu ma'lumotlar jadvallar shaklida saqlanadigan va ular o‘rtasidagi bog‘liqliklar asosida boshqariladigan ma'lumotlar bazasi turi.
Jadval (Table) – Ma'lumotlar bazasida ma'lumotlarni satrlar (yozuvlar) va ustunlar (maydonlar) shaklida saqlash uchun ishlatiladigan asosiy tuzilma.
2. SQL Server-ning 5 ta asosiy xususiyati:
Ma'lumotlarni ishonchli saqlash – Xavfsizlik va zaxira nusxalash (backup) mexanizmlari mavjud.
Aloqador ma'lumotlar bazasini qo‘llab-quvvatlash – Jadval va ular orasidagi munosabatlarni boshqarish imkoniyati.
Transaktsiyalarni boshqarish – ACID (Atomicity, Consistency, Isolation, Durability) tamoyillariga asoslangan.
Katta hajmdagi ma'lumotlar bilan ishlash – Big Data va ko‘p foydalanuvchilar bilan ishlash imkoniyati.
Tahlil va hisobot tizimi – BI (Business Intelligence) vositalarini qo‘llab-quvvatlash.
3. SQL Server autentifikatsiya turlari (kamida 2 ta)
Windows Authentication – Windows tizimidagi foydalanuvchi hisobiga asoslangan autentifikatsiya.
SQL Server Authentication – SQL Server uchun alohida foydalanuvchi nomi va parolga asoslangan autentifikatsiya. */


CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT
);
/* Texnologiya	Tavsif
SQL Server	Microsoft tomonidan ishlab chiqilgan ma'lumotlar bazasi boshqaruv tizimi (DBMS). U katta hajmdagi ma'lumotlarni saqlash va boshqarish uchun ishlatiladi.
SSMS (SQL Server Management Studio)	SQL Server bilan ishlash uchun vizual interfeysga ega dastur. U orqali ma'lumotlar bazasini yaratish, tahrirlash va boshqarish mumkin.
SQL (Structured Query Language)	Ma'lumotlar bazasini boshqarish va manipulyatsiya qilish uchun ishlatiladigan so‘rov tili. U SQL Server, MySQL, PostgreSQL va boshqa DBMS-larda ishlatiladi.*/

INSERT INTO Students (StudentID, Name, Age) VALUES (1, 'Ali', 20);

CREATE TABLE Courses (CourseID INT PRIMARY KEY, CourseName VARCHAR(50));

SELECT * FROM students
SELECT * FROM Courses

BEGIN TRANSACTION;
UPDATE Students SET Age = 21 WHERE StudentID = 1;
ROLLBACK

SELECT * FROM students

INSERT INTO Students (StudentID, Name, Age) VALUES 
(4, 'Ali', 20),
(2, 'Zaynab', 22),
(3, 'Hasan', 19)

