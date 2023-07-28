create database assignments_day1;
use assignments_day1;
create table department(
department_id int auto_increment primary key,
department_name varchar(200)
);

create table positionn(
position_id int auto_increment primary key,
position_name varchar(200)
);

create table account(
account_id int auto_increment primary key,
email varchar(300),
username varchar(300),
fullname varchar(300),
department_id int,
foreign key (department_id) references department(department_id),
position_id int,
foreign key(position_id) references positionn(position_id),
create_date date
);

create table groupp(
group_id int auto_increment primary key,
group_name varchar(200),
creator_id int unique key,
create_date date
);

create table group_account(
group_id int,
foreign key (group_id) references groupp(group_id),
account_id int,
foreign key (account_id) references account(account_id),
join_date date
);

create table type_question(
type_id int auto_increment primary key,
type_name varchar(50)
);

create table category_question(
category_id int auto_increment primary key,
category_name varchar(100)
);

create table question(
question_id int auto_increment primary key,
content varchar(3000),
category_id int,
foreign key (category_id) references category_question(category_id),
type_id int,
foreign key (type_id) references type_question(type_id),
creator_id int,
foreign key (creator_id) references groupp(creator_id),
create_date date
);

create table answer(
answer_id int auto_increment primary key,
content varchar(3000),
question_id int,
foreign key (question_id) references question(question_id),
isCorrect enum('true','false')
);

create table exam(
exam_id int auto_increment primary key,
code varchar(10),
title varchar(200),
category_id int unique key,
duration datetime,
creator_id int unique key,
create_date date
);

create table exam_question(
exam_id int, 
foreign key (exam_id) references exam(exam_id),
question_id int,
foreign key (question_id) references question(question_id)
)

