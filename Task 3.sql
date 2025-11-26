CREATE DATABASE SchoolDB;
USE SchoolDB;

CREATE TABLE Students (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Age INT CHECK (Age BETWEEN 6 AND 20),
    Email NVARCHAR(255) UNIQUE,
    Score INT DEFAULT 0 CHECK (Score BETWEEN 0 AND 100)
);

INSERT INTO Students (FullName, Age, Email, Score)
VALUES
('Ali Hasanov', 15, 'ali@example.com', 78),
('Nigar Mammadova', 18, 'nigar@example.com', 92),
('Rashad Aliyev', 12, 'rashad@example.com', 56),
('Kamran Suleymanov', 20, 'kamran@example.com', 99),
('Lala Valiyeva', 10, 'lala@example.com', 34);

ALTER TABLE Students
ADD CreatedAt DATETIME DEFAULT GETDATE();

UPDATE Students
SET Email = CONCAT('updated_', Email)
WHERE Score > 90;

DELETE FROM Students
WHERE Age < 10;

ALTER TABLE Students
ADD CONSTRAINT CK_Students_Score_DivisibleBy5
CHECK (Score % 5 = 0);

CREATE TABLE TopStudents (
    Id INT PRIMARY KEY,
    FullName NVARCHAR(100),
    Score INT
);

INSERT INTO TopStudents (Id, FullName, Score)
SELECT Id, FullName, Score
FROM Students
WHERE Score > 90;
