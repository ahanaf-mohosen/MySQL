use university;
CREATE TABLE Faculty
(
	faculty_id char(2) PRIMARY KEY,
	faculty_name nvarchar(30) NOT NULL
);
/*=====================Student table===================*/
DROP TABLE Student;
CREATE TABLE Student
(
student_id char(3) NOT NULL PRIMARY KEY,
firstname nvarchar(30) NOT NULL ,
lastname nvarchar(30) NOT NULL ,
gender enum('male', 'female' , 'homo'),
date_of_birth date NOT NULL ,
country_of_bird nvarchar(20),
faculty_id char(2),
scholarship_id char(3)
);
/*=====================Subject table===================*/
CREATE TABLE Subject
(
subject_id char(3) NOT NULL PRIMARY KEY,
subject_name nvarchar(25) NOT NULL ,
prerequisite nvarchar(30) DEFAULT NULL,
requirement nvarchar(30) DEFAULT NULL,
credit decimal(3,1) /* 3 digits in total, 1 digit after the comma */
);
/*===================== Result table===================*/
CREATE TABLE Result
(
student_id char(3) NOT NULL,
subject_id char(3) NOT NULL,
attempt int DEFAULT 1,
score int,
PRIMARY KEY (student_id, subject_id, attempt)
);
/*===================== Enrolment table===================*/
CREATE TABLE Enrolment
(
enrolment_id char(3) NOT NULL PRIMARY KEY,
student_id char(3) NOT NULL,
class_id char(3),
title nvarchar(30)
);
/*===================== Class table===================*/
CREATE TABLE Class
(
class_id char(3) NOT NULL PRIMARY KEY,
convener_id char(3) NOT NULL,
subject_id char(3) NOT NULL,
title nvarchar(30)
);
/*===================== Class table===================*/
CREATE TABLE Room_Class
(
room_id char(3),
class_id char(3),
note nvarchar(30)
);
/*===================== Room table===================*/
CREATE TABLE Room
(
room_id char(3) NOT NULL PRIMARY KEY,
number_of_seat int NOT NULL,
reserve bool DEFAULT False
);
/*===================== Tutor table===================*/
CREATE TABLE Tutor
(
tutor_id char(3) NOT NULL PRIMARY KEY,
rank char(3),
tutor_name nvarchar(30) NOT NULL,
tutor_dob date NOT NULL,
tutor_desc nvarchar(30)
);
/*===================== Tutor_Class table===================*/
CREATE TABLE Tutor_Class 
(
class_id char(3) NOT NULL,
tutor_id char(3) NOT NULL,
note nvarchar(30)
);
/*===================== Convener table===================*/
CREATE TABLE Convener
(
convener_id char(3) NOT NULL PRIMARY KEY,
rank char(3),
convener_name nvarchar(30),
convener_dob date
);
/*===================== Faculty_Convener table===================*/
CREATE TABLE Faculty_Convener
(
convener_id char(3) NOT NULL,
faculty_id char(2) NOT NULL
); 
/*===================== Salary table===================*/
CREATE TABLE Salary
(
rank CHAR(3) NOT NULL PRIMARY KEY,
pay_rate decimal(6,3),
further_detail nvarchar(30)
);
/*===================== Scholarship table===================*/
CREATE TABLE Scholarship
(
scholarship_id char(3) NOT NULL PRIMARY KEY,
scholarship_value int(6) NOT NULL,
scholarship_condition nvarchar(30),
scholarship_desc nvarchar(30)
);
/*===================== Provider table===================*/
CREATE TABLE Provider 
(
provider_id CHAR(3) PRIMARY KEY,
provider_name nvarchar(30) NOT NULL,
provider_business_no INT(6) NOT NULL
);
/*===================== Scholarship_Provider table===================*/
CREATE TABLE Scholarship_Provider
(
scholarship_id char(3) NOT NULL,
provider_id char(3) NOT NULL,
note nvarchar(30)
);
/*===================== Foreign Key===================*/
/*==========Student=========*/
ALTER TABLE Student 
ADD CONSTRAINT fk_Student_Faculty
FOREIGN KEY (faculty_id) REFERENCES Faculty (faculty_id);

ALTER TABLE Student 
ADD CONSTRAINT fk_Student_Scholarship
FOREIGN KEY (scholarship_id) REFERENCES Scholarship (scholarship_id);
/*=========Result===========*/
ALTER TABLE Result 
ADD CONSTRAINT fk_Result_Student
FOREIGN KEY (student_id) REFERENCES Student (student_id);

ALTER TABLE Result 
ADD CONSTRAINT fk_Result_Subject
FOREIGN KEY (subject_id) REFERENCES Subject (subject_id);
/*=========Enrolment========*/
ALTER TABLE Enrolment
ADD CONSTRAINT fk_Enrolment_Student
FOREIGN KEY (student_id) REFERENCES Student (student_id);

ALTER TABLE Enrolment
ADD CONSTRAINT fk_Enrolment_Class
FOREIGN KEY (class_id) REFERENCES Class (class_id);
/*=========Scholarship_Provider======*/
ALTER TABLE Scholarship_Provider
ADD CONSTRAINT fk_Scholarship_Provider
FOREIGN KEY (scholarship_id) REFERENCES Scholarship (scholarship_id);

ALTER TABLE Scholarship_Provider
ADD CONSTRAINT fk_Provider_Scholarship
FOREIGN KEY (provider_id) REFERENCES Provider (provider_id);
/*==========Class==========*/
ALTER TABLE Class
ADD CONSTRAINT fk_Class_Convener
FOREIGN KEY (convener_id) REFERENCES Convener (convener_id);

ALTER TABLE Class
ADD CONSTRAINT fk_Class_Subject
FOREIGN KEY (subject_id) REFERENCES Subject (subject_id);
/*===========Room_class===========*/
ALTER TABLE Room_Class
ADD CONSTRAINT fk_Room_Class
FOREIGN KEY (room_id) REFERENCES Room (room_id);

ALTER TABLE Room_Class
ADD CONSTRAINT fk_Class_Room
FOREIGN KEY (class_id) REFERENCES Class (class_id);
/*============Convener============*/
ALTER TABLE Convener
ADD CONSTRAINT fk_Convener_Salary
FOREIGN KEY (rank) REFERENCES Salary (rank);
/*=============Tutor_Class==========*/
ALTER TABLE Tutor_Class
ADD CONSTRAINT fk_Tutor_Class
FOREIGN KEY (tutor_id) REFERENCES Tutor (tutor_id);

ALTER TABLE Tutor_Class
ADD CONSTRAINT fk_Class_Tutor
FOREIGN KEY (class_id) REFERENCES Class (class_id);
/*===============Tutor==============*/
ALTER TABLE Tutor
ADD CONSTRAINT fk_Tutor_Salary
FOREIGN KEY (rank) REFERENCES Salary (rank);
/*================Faculty_Convener==============*/
ALTER TABLE Faculty_Convener
ADD CONSTRAINT fk_Faculty_Convener
FOREIGN KEY (faculty_id) REFERENCES Faculty (faculty_id);

ALTER TABLE Faculty_Convener
ADD CONSTRAINT fk_Convener_Faculty
FOREIGN KEY (convener_id) REFERENCES Convener (convener_id);