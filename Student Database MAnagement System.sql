-- Student Database MAnagement System
CREATE DATABASE student_database
;
use student_database;
CREATE TABLE student_table (
    Student_id SERIAL PRIMARY KEY,
    Stu_name TEXT,
    Department TEXT,
    Email_id TEXT,
    Phone_no TEXT,
    Address TEXT,
    Date_of_birth DATE,
    Gender TEXT,
    Major TEXT,
    GPA NUMERIC,
    Grade TEXT CHECK (Grade IN ('A', 'B', 'C', 'D', 'F'))
);


INSERT INTO student_table (Stu_name, Department, Email_id, Phone_no, Address, Date_of_birth, Gender, Major, GPA, Grade)
VALUES
('Liam Nguyen', 'Mechanical Engineering', 'lnguyen@example.com', '123-456-7890', '123 Willow Rd, Anytown USA', '1993-04-10', 'Male', 'Robotics', 4, 'B'),
('Isabella Hernandez', 'Mechanical Engineering', 'ihernandez@example.com', '987-654-3210', '456 Oak Ave, Anytown USA', '1996-11-22', 'Female', 'Critical Care Nursing', 5, 'A'),
('Noah Diaz', 'Electrical Engineering', 'ndiaz@example.com', '555-123-4567', '789 Pine Ln, Anytown USA', '1995-07-03', 'Male', 'Power Electronics', 3, 'C'),
('Mia Morales', 'Psychology', 'mmorales@example.com', '111-222-3333', '321 Elm St, Anytown USA', '1997-09-18', 'Female', 'Developmental Psychology', 4, 'B'),
('Lucas Sanchez', 'Biology', 'lsanchez@example.com', '456-789-0123', '159 Cedar Ave, Anytown USA', '1992-02-28', 'Male', 'Genetics', 5, 'A'),
('Charlotte Ramirez', 'Business Administration', 'cramirez@example.com', '888-999-0000', '753 Maple Rd, Anytown USA', '1994-06-15', 'Female', 'Finance', 3, 'C'),
('Alexander Vargas', 'Civil Engineering', 'avagas@example.com', '222-333-4444', '951 Birch St, Anytown USA', '1998-12-01', 'Male', 'Transportation Engineering', 4, 'B'),
('Sophia Gomez', 'Biology', 'sgomez@example.com', '987-654-3210', '852 Oak Ln, Anytown USA', '1996-05-07', 'Female', 'Data Science', 4, 'B'),
('Ethan Reyes', 'Mechanical Engineering', 'ereyes@example.com', '555-666-7777', '159 Walnut Ave, Anytown USA', '1993-11-14', 'Male', 'Automotive Engineering', 3, 'C'),
('Isabella Castillo', 'Nursing', 'icastillo@example.com', '444-555-6666', '369 Pine St, Anytown USA', '1995-08-22', 'Female', 'Pediatric Nursing', 4, 'B');

SELECT * FROM student_table ORDER BY Grade DESC;
SELECT * FROM student_table WHERE Gender = 'Male';
SELECT * FROM student_table WHERE GPA < 5.0;
UPDATE student_table
SET Email_id = 'newemail@example.com', Grade = 'A'
WHERE Student_id = 1; 

SELECT Stu_name, TIMESTAMPDIFF(YEAR, Date_of_birth, CURDATE()) AS Age
FROM student_table
WHERE Grade = 'B'
LIMIT 0, 1000;

SELECT Department, Gender, AVG(GPA) AS Average_GPA
FROM student_table
GROUP BY Department, Gender;

ALTER TABLE student_table RENAME TO student_info;

SELECT Stu_name FROM student_info
ORDER BY GPA DESC
LIMIT 1;



