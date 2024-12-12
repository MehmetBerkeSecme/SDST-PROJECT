CREATE DATABASE UniversityManagment;
USE UniversityManagment;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'teacher', 'student') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100),
    department VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    full_name VARCHAR(100),
    enrollment_year YEAR,
    email VARCHAR(100) UNIQUE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    department VARCHAR(100),
    credit_hours INT
);

CREATE TABLE Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

CREATE TABLE Teachings (
    teaching_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT NOT NULL,
    course_id INT NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) ON DELETE CASCADE
);

INSERT INTO Users (username, password_hash, role)  
VALUES  
('admin1', MD5('Team7'), 'admin'), 
('teacher1', MD5('Ralitza Raynova'), 'teacher'), 
('student1', MD5('AleynaAkkaya'), 'student'),
('teacher2', MD5('Adelina Aleksieva'), 'teacher'),
('teacher3', MD5('Adnan Redzheb'), 'teacher'),
('teacher4', MD5('Caitlyn Timberwolves'), 'teacher'),
('teacher5', MD5('Ahmet Mersin'), 'teacher'),
('teacher6', MD5('Viktor Wemby'), 'teacher'),
('student7', MD5('BerkeYilmaz'), 'student'),
('student8', MD5('CerenDemir'), 'student'),
('student9', MD5('DenizKaya'), 'student'),
('student10', MD5('ErenYildiz'), 'student'),
('student11', MD5('FundaAydin'), 'student');

INSERT INTO Admins (user_id, full_name, email) 
VALUES 
(1, 'TEAM7 Admin', 'team7@tus.com'),
(2, 'Backup Admin', 'backupadmin@tus.com');

INSERT INTO Teachers (user_id, full_name, department, email) 
VALUES 
(2, 'Ralitza Raynova', 'Software Design and Software Testing', 'rraynova@tus.com'),
(3, 'Adelina Aleksieva', 'Software Design and Software Testing Lecture', 'aaleksieva@tu-sofia.bg'),
(4, 'Adnan Redzheb', 'C#', 'aredzheb@tu-sofia.bg'),
(5, 'Caitlyn Timberwolves', 'Programming Language', 'ctimberwolves@tu-sofia.bg'),
(6, 'Ahmet Mersin', 'Python Programming', 'amersin@tu-sofia.bg'),
(7, 'Viktor Wemby', 'Computer Science', 'vwemby@tu-sofia.bg');

INSERT INTO Students (user_id, full_name, enrollment_year, email) 
VALUES 
(3, 'Aleyna Akkaya', 2024, 'aakkaya@tus.com'),
(8, 'Berke Yilmaz', 2024, 'byilmaz@tus.com'),
(9, 'Ceren Demir', 2024, 'cdemir@tus.com'),
(10, 'Deniz Kaya', 2024, 'dkaya@tus.com'),
(11, 'Eren Yildiz', 2024, 'eyildiz@tus.com'),
(12, 'Funda Aydin', 2024, 'faydin@tus.com');

INSERT INTO Courses (course_name, department, credit_hours) 
VALUES 
('Software Design and Software Testing', 'Computer Science', 3),
('Programming Language', 'Computer Science', 4),
('Data Structures', 'Computer Science', 4),
('Artificial Intelligence', 'Computer Science', 3),
('Database Management Systems', 'Information Technology', 3);


















