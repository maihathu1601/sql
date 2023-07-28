create database extra_assignments_DAY1;
use extra_assignments_DAY1;
create table trainee(
trainee_id int auto_increment primary key,
full_name varchar(300),
birth_date date,
gender enum('male', 'female', 'unknown'),
et_iq int(2),
et_gmath int(2),
et_english int(2),
training_class char(20),
evaluation_notes text,
check (et_iq <20 and et_iq >0),
check (et_gmath <20 and et_gmath >0),
check (et_english <50 and et_english >0)
)
alter table trainee add column VTI_Account varchar(200)

create table datatypes1(
id int auto_increment primary key,
name varchar(300), 
code char(5),
modified_date datetime
)

create table datatypes2(
id int auto_increment primary key,
name nvarchar(300),
birth_date date,
gender bit default null,
is_deleted_flag bit
)