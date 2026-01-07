CREATE DATABASE UniversityDB1;
USE UniversityDB1;

CREATE TABLE Instructor(
InstructorID INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Department VARCHAR(50)
);

CREATE TABLE Course(
CourseID INT PRIMARY KEY,
Title VARCHAR(100) NOT NULL,
Credits INT CHECK(Credits>0),
InstructorID INT,
FOREIGN KEY(InstructorID) REFERENCES Instructor(InstructorID)
ON DELETE SET NULL
ON UPDATE CASCADE
);

CREATE TABLE Student(
RollNo INT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
DOB DATE,
Department VARCHAR(50)
);

create table enrollment(
RollNo INT,
CourseID INT,
Grade CHAR(2),
primary key(RollNo,CourseID),
foreign key(RollNo)references Student(RollNo)
on delete cascade
on update cascade,
FOREIGN KEY(CourseID)references Course(CourseID)
on delete cascade
on update cascade
);

CREATE INDEX idx_student_dept ON Student(Department);
CREATE INDEX idx_course_instructor ON Course(InstructorID);

ALTER TABLE Student ADD Email VARCHAR(100);
DROP TABLE Enrollment;

select * from Course;
select * from Student;
select * from Instructor;
select * from Enrollment;

