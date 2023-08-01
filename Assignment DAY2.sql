DROP DATABASE IF EXISTS assignment;
create database assignment;

use assignment;

DROP TABLE IF EXISTS `Department`;
create table Department (
Departmet_ID int auto_increment primary key,
Department_Name varchar(100)
);

DROP TABLE IF EXISTS `Position`;
create table Position (
Position_ID int auto_increment primary key ,
Position_Name enum('Dev','Test','Scrum Master','PM', 'marketing')
);

DROP TABLE IF EXISTS `Account`;
create table `Account` (
Account_ID int auto_increment primary key,
Email text,
Username varchar(100) unique key,
Full_Name varchar(100),
Departmet_ID int,
Position_ID int,
Create_Date date,
age int ,
foreign key (Departmet_ID) references Department (Departmet_ID),
foreign key (Position_ID) references Position (Position_ID)
);

DROP TABLE IF EXISTS `Group`;
create table `Group` (
Group_ID int(200) auto_increment primary key,
Group_Name varchar(100),
Creator_ID int unique key,
Create_Date date
);

DROP TABLE IF EXISTS `GroupAccount`;
create table `GroupAccount` (
Group_ID int,
Account_ID int,
Join_Date date,
foreign key (Group_ID) references `Group` (Group_ID),
foreign key (Account_ID) references `Account` (Account_ID)
);

DROP TABLE IF EXISTS `TypeQuestion`;
create table TypeQuestion (
Type_ID int primary key,
Type_Name varchar(100) 
);

DROP TABLE IF EXISTS `CategoryQuestion`;
create table CategoryQuestion (
Category_ID int primary key,
Category_Name varchar(100)
);

DROP TABLE IF EXISTS `Question`;
create table Question (
Question_ID int auto_increment primary key,
Content text,
Category_ID int,
Type_ID int,
Creator_ID int,
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Type_ID) references TypeQuestion (Type_ID),
foreign key (Creator_ID) references `Account` (Account_id)
);

DROP TABLE IF EXISTS `Answer`;
create table Answer (
Answer_ID int auto_increment primary key,
Content text,
Question_ID int,
is_Correct enum('1','0') ,
foreign key (Question_ID) references Question (Question_ID)
);

DROP TABLE IF EXISTS `Exam`;
create table Exam (
Exam_ID int auto_increment primary key,
`Code` varchar(20) unique key,
Title text,
Category_ID int,
Duration int,
Creator_ID int, 
Create_Date date,
foreign key (Category_ID) references CategoryQuestion (Category_ID),
foreign key (Creator_ID) references `Account` (Account_id)
);


DROP TABLE IF EXISTS `ExamQuestion`;
create table ExamQuestion (
Exam_ID int,
Question_ID int,
foreign key (Exam_ID) references Exam (Exam_ID), 
foreign key (Question_ID) references Question (Question_ID)
);

INSERT INTO account (Account_ID, Email, Username, Full_name, Create_Date, age) values 
('1','nguyenvana@gmail.com','nguyenvana', 'nguyenvanab','2023-07-31','30'),
('2','nguyenvanb@gmail.com','nguyenvanb', 'nguyenvanb','2023-07-31','30'),
('3','nguyenvanc@gmail.com','nguyenvanc', 'nguyenvanc','2023-07-31','30'),
('4','nguyenvand@gmail.com','nguyenvand', 'nguyenvand','2023-07-31','30'),
('5','nguyenvane@gmail.com','nguyenvane', 'nguyenvane','2023-07-31','30'),
('6','nguyenvanf@gmail.com','nguyenvanf', 'nguyenvanf','2023-07-31','30'),
('7','nguyenvang@gmail.com','nguyenvang', 'nguyenvang','2023-07-31','30'),
('8','nguyenvanh@gmail.com','nguyenvanh', 'nguyenvanh','2023-07-31','30'),
('9','nguyenvani@gmail.com','nguyenvani', 'nguyenvani','2023-07-31','30'),
('10','nguyenvanj@gmail.com','nguyenvanj', 'nguyenvanj','2023-07-31','30');

INSERT INTO answer (Content, is_Correct) values
('ab','1'),
('bc','0'),
('cd','0'),
('de','1'),
('ef','0'),
('fg','1'),
('gh','1'),
('hi','1'),
('ij','0'),
('jk','0');

INSERT INTO categoryquestion (Category_ID, Category_Name) values
('1','a1'),
('2','a2'),
('3','a3'),
('4','a4'),
('5','a5'),
('6','a6'),
('7','a7'),
('8','a8'),
('9','a9'),
('10','a10');

INSERT INTO department (Department_Name) values
('Sale'),
('b'),
('c'),
('d'),
('e'),
('f'),
('g'),
('h'),
('i'),
('j');

INSERT INTO exam (Code, Title, Duration, Create_Date) values
('a1','ab','1','2023-07-31'),
('a2','bc','1','2023-07-31'),
('a3','cd','1','2023-07-31'),
('a4','de','1','2023-07-31'),
('a5','ef','1','2023-07-31'),
('a6','fg','1','2023-07-31'),
('a7','gh','1','2023-07-31'),
('a8','hi','1','2023-07-31'),
('a9','ij','1','2023-07-31'),
('a10','jk','1','2023-07-31');

INSERT INTO `group` (Group_Name, Creator_ID, Create_Date) values
('a','1','2023-07-31'),
('b','2','2023-07-31'),
('c','3','2023-07-31'),
('d','4','2023-07-31'),
('e','5','2023-07-31'),
('f','6','2023-07-31'),
('g','7','2023-07-31'),
('h','8','2023-07-31'),
('i','9','2023-07-31'),
('k','10','2023-07-31');

INSERT INTO groupaccount (Join_Date) values
('2019-12-19'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30'),
('2023-07-30');

INSERT INTO position (Position_Name) values 
('Dev'),
('Test'),
('Scrum Master'),
('PM'),
('marketing'),
('Scrum Master'),
('Dev'),
('PM'),
('Test'),
('marketing');

INSERT INTO question (Content, Create_Date) values
('ba','2023-07-31'),
('ca','2023-07-31'),
('da','2023-07-31'),
('ea','2023-07-31'),
('fa','2023-07-31'),
('ga','2023-07-31'),
('ha','2023-07-31'),
('ia','2023-07-31'),
('ja','2023-07-31'),
('ka','2023-07-31');

INSERT INTO typequestion (Type_ID, Type_Name) values
('1','c1'),
('2','c2'),
('3','c3'),
('4','c4'),
('5','c5'),
('6','c6'),
('7','c7'),
('8','c8'),
('9','c9'),
('10','c10');
#2
SELECT * FROM department;
#3
SELECT Departmet_ID FROM department WHERE Department_Name = 'Sale';
#4
SELECT * FROM `account`
ORDER BY length(Full_Name) desc;
#5
SELECT * FROM `account` WHERE Departmet_ID = 3
ORDER BY length(Full_Name) desc
limit 1;
#6
SELECT DISTINCT g.Group_Name FROM `group` g join groupaccount ga on g.Group_ID = ga.Group_ID WHERE ga.Join_Date < '2019-12-19';
#7
SELECT Question_ID FROM answer GROUP BY Question_ID having count(*)>=4;
#8
SELECT `Code` FROM exam WHERE Duration >=60 and Create_Date < 2019-12-19;
#9
SELECT Group_ID, Group_Name, Create_Date FROM `group` ORDER BY Create_Date desc limit 5;
#10
SELECT COUNT(*) FROM `account` WHERE Departmet_ID = 2;
#11
SELECT * FROM `account` WHERE Full_Name like 'D%o';
#12
DELETE FROM exam WHERE Create_Date < '2019-12-19';
#13
DELETE FROM question WHERE Content like 'câu hỏi%';
#14
UPDATE `account` SET Full_Name = 'Nguyễn Bá Lộc', Email = 'loc.nguyenba@vti.com.vn' WHERE Account_ID = 5;
#15
UPDATE `account` SET Group_ID = 4 WHERE Account_ID = 5;