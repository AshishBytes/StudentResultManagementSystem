use result;

-- 1. Drop existing tables to avoid duplication or conflicts
DROP TABLE IF EXISTS result;
DROP TABLE IF EXISTS student;

-- Create the `student` table
CREATE TABLE student (
    course_name VARCHAR(255),
    branch_name VARCHAR(255),
    roll_number VARCHAR(20) PRIMARY KEY,
    name VARCHAR(255),
    father_name VARCHAR(255),
    gender VARCHAR(10)
);

-- Create the `result` table
CREATE TABLE result (
    roll_number VARCHAR(20),
    operating_system INT,
    dbms INT,
    advance_java INT,
    artificial_intelligence INT,
    data_science INT,
    advance_java_lab INT,
    ai_lab INT,
    FOREIGN KEY (roll_number) REFERENCES student(roll_number) ON DELETE CASCADE
);

-- Alter `student` table to add additional constraints if needed
ALTER TABLE student 
    ADD CONSTRAINT gender_check CHECK (gender IN ('Male', 'Female', 'Other'));

-- Alter `result` table to add constraints for scores
ALTER TABLE result 
    ADD CONSTRAINT os_score_check CHECK (operating_system BETWEEN 0 AND 100),
    ADD CONSTRAINT dbms_score_check CHECK (dbms BETWEEN 0 AND 100),
    ADD CONSTRAINT java_score_check CHECK (advance_java BETWEEN 0 AND 100),
    ADD CONSTRAINT ai_score_check CHECK (artificial_intelligence BETWEEN 0 AND 100),
    ADD CONSTRAINT ds_score_check CHECK (data_science BETWEEN 0 AND 100),
    ADD CONSTRAINT java_lab_score_check CHECK (advance_java_lab BETWEEN 0 AND 100),
    ADD CONSTRAINT ai_lab_score_check CHECK (ai_lab BETWEEN 0 AND 100);

-- Sample Insert for student data
INSERT INTO student (course_name, branch_name, roll_number, name, father_name, gender)
VALUES 
('B.Tech', 'Computer Science & Engineering', 'A60205222046', 'Ashish Singh', 'Narendra Singh', 'Male'),
('B.Tech', 'Electronics', 'A60205322067', 'Ravi Kumar', 'Rajesh Kumar', 'Male'),
('B.Tech', 'Computer Science', 'A60205422024', 'Priya Sharma', 'Rajeev Sharma', 'Female'),
('B.Tech', 'Electronics', 'A60205522003', 'Sandeep Verma', 'Sunil Verma', 'Male');

-- Select to verify data in student table
SELECT * FROM student;

-- Sample Insert for student results data
INSERT INTO result (roll_number, operating_system, dbms, advance_java, artificial_intelligence, data_science, advance_java_lab, ai_lab)
VALUES 
('A60205222046', 85, 90, 78, 92, 88, 80, 85),
('A60205322067', 78, 82, 75, 88, 80, 70, 75),
('A60205422024', 92, 87, 84, 89, 92, 88, 90),
('A60205522003', 80, 85, 78, 82, 79, 75, 80);

-- Select to verify data in result table
SELECT * FROM result;