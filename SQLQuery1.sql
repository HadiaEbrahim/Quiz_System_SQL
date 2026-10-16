create database Exam_System;

create table Users(
ID int primary key identity(1,1),
Name varchar(255) not null,
Email varchar(255) unique not null,
Title varchar(255) not null,
password varchar(255) not null check(len(trim(password))>8),
Role int not null
);

create table Courses(
ID int identity(1,1) primary key,
Name varchar(255) not null,
Category varchar(255) not null,
NumberOfLessons int not null,
Duration varchar(255) not null,
AdminID int not null,
TeacherID int not null,
foreign key (AdminID) references Users(ID),
foreign key (TeacherID) references Users(ID)
);

create table StudentCourse(
ID int identity(1,1) primary key,
StudentId int not null,
CourseId int not null,
foreign key (StudentId) references Users(ID),
foreign key (CourseId) references Courses(ID)

);

create table Exams(
ID int identity(1,1) primary key,
Title varchar(255) not null,
CourseId int not null,
foreign key (CourseId) references Courses(ID)
);

create table Questions(
ID int identity(1,1) primary key,
ExamId int not null,
HeaderText varchar(255) not null,
Mark decimal(10,2) not null check(Mark>0),
Type int not null,
Options varchar(MAX) not null,
CorrectAnswer varchar(255) not null,
foreign key (ExamId) references Exams(ID)
);

create table StudentExamResult(
ID int identity(1,1) primary key,
StudentId int not null,
ExamId int not null,
TotalScore int not null,
SubmitDate DateTime default GetDate(),
foreign key (StudentId) references Users(ID),
foreign key (ExamId) references Exams(ID)
);


INSERT INTO Users (Name, Email, Title, password, Role) VALUES 
('Admin', 'admin@system.com', 'System Administrator', 'AdminPass123', 0),
('Ahmed Mohamed', 'ahmed.teacher@system.com', 'Programming Instructor', 'TeacherPass123', 1),
('Mohamed Ali', 'mohamed.student@system.com', 'Computer Science Student', 'StudentPass123', 2);

INSERT INTO Courses (Name, Category, NumberOfLessons, Duration, AdminID, TeacherID) VALUES 
('C# Programming Basics', 'Programming', 12, '10 Hours', 1, 2),
('SQL Server Database', 'Databases', 8, '6 Hours', 1, 2);


INSERT INTO StudentCourse (StudentId, CourseId) VALUES 
(3, 1);

INSERT INTO Exams (Title, CourseId) VALUES 
('C# Final Quiz', 1);

INSERT INTO Questions (ExamId, HeaderText, Mark, Type, Options, CorrectAnswer) VALUES 
(1, 'What is the extension of C# files?', 5.00, 1, 'A) .cs, B) .cpp, C) .java', 'A');

INSERT INTO StudentExamResult (StudentId, ExamId, TotalScore) VALUES 
(3, 1, 5);
GO

