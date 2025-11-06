CREATE DATABASE IF NOT EXISTS school_db;
USE school_db;
CREATE TABLE IF NOT EXISTS students (
    student_id INT PRIMARY KEY NOT NULL,
    student_fname VARCHAR(50) NOT NULL,
    student_lname VARCHAR(50) NOT NULL,
    class INT,
    age INT
);
CREATE TABLE IF NOT EXISTS marksheet (
    score INT,
    year INT,
    ranking INT,
    class INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
INSERT INTO students (student_id, student_fname, student_lname, class, age) VALUES
(1, 'Krishna', 'Gee', 10, 18),
(2, 'Stephen', 'Christ', 10, 17),
(3, 'Kailash', 'Kumar', 10, 18),
(4, 'Ashish', 'Jain', 10, 16),
(5, 'Khusbu', 'Jain', 10, 17);
INSERT INTO marksheet (score, year, ranking, class, student_id) VALUES
(989, 2014, 1, 10, 1),
(454, 2014, 10, 10, 2),
(880, 2014, 4, 10, 3),
(870, 2014, 5, 10, 4),
(720, 2014, 7, 10, 5);
SELECT student_id, student_fname
FROM students
WHERE age >= 16
  AND LOWER(student_lname) = 'kumar';
SELECT *
FROM marksheet
WHERE score BETWEEN 800 AND 1000;
SELECT student_id, class, year, ranking, (score + 5) AS new_score
FROM marksheet;
SELECT *
FROM marksheet
ORDER BY score DESC;
SELECT *
FROM students
WHERE student_fname LIKE 'A%';