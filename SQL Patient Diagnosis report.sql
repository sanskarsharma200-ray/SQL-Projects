DROP DATABASE IF EXISTS patient_details;
CREATE DATABASE patient_details;
USE patient_details;
DROP TABLE IF EXISTS patients_table;
CREATE TABLE patients_table (
    visit_date DATE,
    patient_id VARCHAR(10) PRIMARY KEY,
    patient_name VARCHAR(50),
    age INT,
    weight DECIMAL(5,2),
    gender VARCHAR(10),
    location VARCHAR(50),
    phone_number VARCHAR(15),
    disease VARCHAR(50),
    doctor_name VARCHAR(50),
    doctor_id INT
);
INSERT INTO patients_table 
(visit_date, patient_id, patient_name, age, weight, gender, location, phone_number, disease, doctor_name, doctor_id)
VALUES
('2019-06-15', 'AP2021', 'Sarath', 67, 76, 'Male', 'Chennai', '5462829', 'Cardiac', 'Mohan', 21),
('2019-02-13', 'AP2022', 'John', 62, 80, 'Male', 'Bangalore', '1234731', 'Cancer', 'Suraj', 22),
('2018-01-08', 'AP2023', 'Henry', 43, 65, 'Male', 'Kerala', '9028320', 'Liver', 'Mehta', 23),
('2020-02-04', 'AP2024', 'Carl', 56, 72, 'Female', 'Mumbai', '9293829', 'Asthma', 'Karthik', 24),
('2017-09-15', 'AP2025', 'Shikar', 55, 71, 'Male', 'Delhi', '7821281', 'Cardiac', 'Mohan', 21),
('2018-07-22', 'AP2026', 'Piyush', 47, 59, 'Male', 'Haryana', '8912819', 'Cancer', 'Suraj', 22),
('2017-03-25', 'AP2027', 'Stephen', 69, 55, 'Male', 'Gujarat', '8888211', 'Liver', 'Mehta', 23),
('2019-04-22', 'AP2028', 'Aaron', 75, 53, 'Male', 'Bangalore', '9012192', 'Asthma', 'Karthik', 24);
SELECT COUNT(patient_id) AS total_patients FROM patients_table;
SELECT patient_id, patient_name, gender, disease
FROM patients_table
WHERE age = (SELECT MAX(age) FROM patients_table);
SELECT patient_id, patient_name, CURDATE() AS `current_date` FROM patients_table;
SELECT UPPER(patient_name) AS old_patient_name
FROM patients_table
LIMIT 4;
SELECT UPPER(patient_name) AS new_patient_name
FROM patients_table
ORDER BY visit_date DESC
LIMIT 4;
SELECT patient_name, LENGTH(patient_name) AS name_length
FROM patients_table;
SELECT patient_name,
       CASE
           WHEN gender = 'Male' THEN 'M'
           WHEN gender = 'Female' THEN 'F'
           ELSE 'Other'
       END AS gender_short
FROM patients_table;
SELECT CONCAT(patient_name, ' - ', doctor_name) AS patient_doctor_combined
FROM patients_table;
SELECT patient_name, age, LOG10(age) AS log_age
FROM patients_table;
SELECT patient_name, YEAR(visit_date) AS visit_year
FROM patients_table;
SELECT 
    CASE 
        WHEN patient_name = doctor_name THEN NULL
        ELSE patient_name
    END AS result_name
FROM patients_table;
SELECT patient_name,
       CASE 
           WHEN age > 40 THEN 'Yes'
           ELSE 'No'
       END AS age_above_40
FROM patients_table;
SELECT doctor_name, COUNT(*) AS occurrences
FROM patients_table
GROUP BY doctor_name
HAVING COUNT(*) > 1;

