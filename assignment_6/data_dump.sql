-- Create a database named "university"
CREATE DATABASE university;

-- Use the "university" database
USE university;

-- Create a table for students
CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    birth_date DATE,
    major VARCHAR(50)
);

-- Create a table for courses
CREATE TABLE course (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(50),
    department VARCHAR(50)
);

-- Create a table for enrollments
CREATE TABLE enrollment (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5)
);

-- Insert sample data into the tables

-- Students
INSERT INTO student (first_name, last_name, birth_date, major) VALUES
    ('Alice', 'Johnson', '1998-05-15', 'Computer Science'),
    ('Bob', 'Smith', '1997-09-12', 'Engineering'),
    ('Charlie', 'Brown', '1999-06-25', 'Mathematics'),
    ('David', 'Williams', '1998-11-05', 'Physics');

-- Courses
INSERT INTO course (course_name, instructor, department) VALUES
    ('Database Management', 'Prof. Davis', 'Computer Science'),
    ('Advanced Calculus', 'Prof. Adams', 'Mathematics'),
    ('Computer Networks', 'Prof. Wilson', 'Computer Science'),
    ('Mechanical Engineering', 'Prof. Roberts', 'Engineering');

-- Enrollments
INSERT INTO enrollment (student_id, course_id, enrollment_date, grade) VALUES
    (1, 1, '2023-03-01', 'A'),
    (2, 2, '2023-03-01', 'B'),
    (3, 3, '2023-03-01', 'A'),
    (4, 4, '2023-03-01', 'B'),
    (1, 3, '2023-03-05', 'A'),
    (2, 1, '2023-03-05', 'B'),
    (3, 4, '2023-03-05', 'C'),
    (4, 2, '2023-03-05', 'A');
