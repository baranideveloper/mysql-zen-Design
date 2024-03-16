create database guvi;
use guvi;
create table user(
user_id int primary key,
user_name varchar(70) unique,
user_mail varchar(70) unique,
user_course varchar(100) not null,
user_qualification varchar(100)
);

create table course(
course_id int primary key,
user_id int,
course_duration int,
course_sylabus text,
sylabus_id int,
foreign key (user_id) references user(user_id)

);

create table Query_doubt(
query_id int primary key,
user_id int,
category varcharacter(100),
query_title text,
query_description text,
availabe_time int,
foreign key (user_id) references user(user_id)
);

create table leave_application(
user_id int,
Leave_days int,
from_date int,
to_date int,
reason varchar(150),
foreign key (user_id) references user(user_id)
);

create table mockinterview(
mockinterview_id int primary key,
user_id int,
interview_round int,
interview_date int,
score int,
url text,
comments text,
foreign key(user_id) references user(user_id)
);

create table sylabus(
sylabus_id int primary key,
user_id int,
course_id int,
materials text,
authors text,
foreign key (user_id) references user(user_id),
foreign key (course_id) references course(course_id)
);

create table attendance(
roll_no int primary key,
user_id int,
days_present int,
days_absent int,
reason text,
percentage int,
foreign key(user_id) references user(user_id)
);

create table placement(
placement_id int primary key,
user_id int,
eligiblity text,
interview_round int,
score int,
roll_no int,
foreign key (user_id) references user(user_id),
foreign key (roll_no) references attendance(roll_no)
);

create table leaderboard(
board_id int primary key,
user_id int,
course_id int,
batch varchar(30),
submitted_task int,
foreign key(user_id) references user(user_id),
foreign key(course_id) references course(course_id)
);

create table codeketa(
user_id int,
course_id int,
scroe int,
solved_problems int,
board_id int,
foreign key(user_id) references user(user_id),
foreign key(course_id) references course(course_id),
foreign key(board_id) references leaderboard(board_id)
);


