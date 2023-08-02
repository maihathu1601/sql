DROP DATABASE IF EXISTS assignment;
create database assignment;

use assignment;

DROP TABLE IF EXISTS `Department`;
create table Department (
Departmet_ID int auto_increment primary key,
Department_Name varchar(100)
);
insert  into `department`(`Departmet_ID`,`Department_Name`) values 
(1,'Phòng kỹ thuật'),
(2,'Phòng nhân sự'),
(3,'Phòng kế toán'),
(4,'Ban giám đốc'),
(5,'Phòng bảo vệ');

DROP TABLE IF EXISTS `Position`;
create table Position (
Position_ID int auto_increment primary key ,
Position_Name enum('Dev','Test','Scrum Master','PM', 'marketing') 
);
insert  into `Position`(`Position_ID`,`Position_Name`) values 
(1,'Nhân viên'),
(2,'Trưởng phòng'),
(3,'Giám đốc');

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
insert  into `account`(`Account_ID`,`Email`,`Username`,`Full_Name`,`Create_Date`,`age`) values 
(1,'sonnv@gmail.com','sonnv','Nguyễn Văn Sơn','2023-07-04',18),
(2,'tuan@gmail.com','nvtuan','Nguyễn Văn Tuấn','2023-07-09',22),
(3,'van@gmail.com','van','nguyên văn vân','2023-07-17',40),
(4,'hong@gmail.com','hong','nguyễn thị hồng','2023-07-26',34),
(5,'phong@cnt.com','phong','Nguyen Văn Phong','2023-07-31',18),
(6,'anh@cnt.com','anh','Nguyễn Văn Anh','2023-07-26',45),
(7,'abc@cnt.com','abc','Trần Abc','2023-07-26',45),
(8,'gcde@gmai.com','gcde','nguyễn gcde','2023-07-09',18),
(9,'huong@gmail.com','huong','phùng thị hương','2023-07-17',34);

DROP TABLE IF EXISTS `Group`;
create table `Group` (
Group_ID int(200) auto_increment primary key,
Group_Name varchar(100),
Creator_ID int unique key,
Create_Date date
);
insert  into `group`(`Group_ID`,`Group_Name`,`Creator_ID`,`Create_Date`) values 
(1,'TESTER',1,'2023-07-30'),
(2,'JAVA',2,'2023-07-27'),
(3,'DOTNET',3,'2023-07-18'),
(4,'PM',4,'2023-07-04');

DROP TABLE IF EXISTS `GroupAccount`;
create table `GroupAccount` (
Group_ID int,
Account_ID int,
Join_Date date,
foreign key (Group_ID) references `Group` (Group_ID),
foreign key (Account_ID) references `Account` (Account_ID)
);
insert  into `groupaccount`(`Join_Date`) values 
('2023-07-18'),
('2023-07-27');

DROP TABLE IF EXISTS `TypeQuestion`;
create table TypeQuestion (
Type_ID int primary key,
Type_Name varchar(100) 
);
insert  into `typequestion`(`Type_ID`,`Type_Name`) values 
(1,'Khó'),
(2,'Dễ');

DROP TABLE IF EXISTS `CategoryQuestion`;
create table CategoryQuestion (
Category_ID int primary key,
Category_Name varchar(100)
);
insert  into `categoryquestion`(`Category_ID`,`Category_Name`) values 
(1,'Du lịch'),
(2,'Công nghệ thông tin'),
(3,'Lịch sử'),
(4,'Toán học');

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
insert  into `question`(`Question_ID`,`Content`,`Creator_ID`,`Create_Date`) values 
(1,'Kết quả của biểu thức sau là m ấy: 5 + 6 ?',1,'2023-07-26'),
(2,'Phep tính sau cho kết quả là mấy : 15:5?',2,'2023-07-11');

DROP TABLE IF EXISTS `Answer`;
create table Answer (
Answer_ID int auto_increment primary key,
Content text,
Question_ID int,
is_Correct enum('1','0') ,
foreign key (Question_ID) references Question (Question_ID)
);
insert  into `answer`(`Answer_ID`,`Content`,`is_Correct`) values 
(1,'kết quả là 11','1'),
(2,'kết quả là 12','0'),
(3,'kết quả là 13','0'),
(4,'kết quả là 14','0'),
(5,NULL,'0');

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

INSERT INTO `categoryquestion`(`Category_ID`,`Category_Name`) values
('5', 'Toán học'),
('6', 'Hóa học'),
('7', 'Sinh học'),
('8', 'Văn học'),
('9', 'Pháp luật');

INSERT INTO `question`(`Content`) values
('1x1 bằng mấy'),
('1x2 bằng mấy'),
('1x3 bằng mấy'),
('1x4 bằng mấy'),
('1x5 bằng mấy'),
('1x6 bằng mấy'),
('1x7 bằng mấy'),
('1x8 bằng mấy'),
('1x9 bằng mấy'),
('1x10 bằng mấy');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','1','1'),
('2','1','0'),
('3','1','0'),
('4','1','0');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','2','0'),
('2','2','1'),
('3','2','0'),
('4','2','0');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','3','0'),
('2','3','0'),
('3','3','1'),
('4','3','0');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','4','0'),
('2','4','0'),
('3','4','0'),
('4','4','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','5','0'),
('2','5','0'),
('3','5','0'),
('5','5','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','6','0'),
('2','6','0'),
('3','6','0'),
('6','6','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','7','0'),
('2','7','0'),
('3','7','0'),
('7','7','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','8','0'),
('2','8','0'),
('3','8','0'),
('8','8','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','9','0'),
('2','9','0'),
('3','9','0'),
('9','9','1');

INSERT INTO `answer`(`Content`,`Question_ID`,`is_Correct`) values
('1','10','0'),
('2','10','0'),
('3','10','0'),
('10','10','1');

SELECT question.Question_ID, question.Content, answer.Content FROM `question` JOIN `answer` ON question.Question_ID = answer.Question_ID WHERE answer.is_Correct = 1 ORDER BY question.Create_Date asc;

SELECT Question_ID, Content, Create_Date FROM `question` WHERE DATE(Create_Date) = curdate();

SELECT c.Category_Name, COUNT(q.Question_ID) AS Total_Questions,
       SUM(CASE WHEN tq.Type_Name = 'Khó' THEN 1 ELSE 0 END) AS Difficult_Questions,
       SUM(CASE WHEN tq.Type_Name = 'Dễ' THEN 1 ELSE 0 END) AS Easy_Questions
FROM CategoryQuestion c
LEFT JOIN Question q ON c.Category_ID = q.Category_ID
LEFT JOIN TypeQuestion tq ON q.Type_ID = tq.Type_ID
GROUP BY c.Category_Name;

SELECT COUNT(distinct Category_ID) as totalfield FROM `question`;