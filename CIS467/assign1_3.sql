DROP DATABASE IF EXISTS university;
CREATE DATABASE university;

USE university;


CREATE TABLE Student
(
	studentID			INT			    PRIMARY KEY 	NOT NULL,
    firstName		    VARCHAR(45)		NOT NULL,
    lastName			VARCHAR(45)		NOT NULL
    );

CREATE TABLE Course
(
	courseID			VARCHAR(45)		NOT NULL	PRIMARY KEY	,
    courseName			VARCHAR(45)		NOT NULL,
    courseDescription	VARCHAR(45)		NOT NULL,
    classroomID		    INT             NOT NULL,
    instructorD         INT             NOT NULL
    );
    
CREATE TABLE Instructor
(
	instructorD		     INT			    PRIMARY KEY     NOT NULL,
    instructorFirstName	 VARCHAR(45)	 	NOT NULL,
    instructorLastName	 VARCHAR(45)		NOT NULL
    );
    
CREATE TABLE Registration
(
    studentID            INT                    NOT NULL,
    courseID             VARCHAR(45)            NOT NULL,
    grade                VARCHAR(45),
    CONSTRAINT	Registration_pk  PRIMARY KEY (studentID, courseID)
    );
    
CREATE TABLE Classroom
(
	classroomID			    INT			PRIMARY KEY		NOT NULL,
    classroomNumber		    INT		    NOT NULL,
    classroomCapacity		INT	        NOT NULL
    );

ALTER TABLE Registration
ADD CONSTRAINT Registration_fk_Course
FOREIGN KEY (courseID) REFERENCES Course (courseID);

ALTER TABLE Registration
ADD CONSTRAINT Registration_fk_Student
FOREIGN KEY (studentID) REFERENCES Student (studentID);

ALTER TABLE Course
ADD CONSTRAINT Course_fk_Instructor
FOREIGN KEY (instructorD) REFERENCES Instructor (instructorD);

ALTER TABLE Course
ADD CONSTRAINT Course_fk_Classroom
FOREIGN KEY (classroomID) REFERENCES Classroom (classroomID);
