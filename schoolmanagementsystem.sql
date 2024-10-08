create table students 
( student_id int primary key ,
 first_name varchar(100), 
 last_name varchar(100),
age int, 
contact_number varchar(100));

insert into students values
 (11,"alex","j",14,8767593425),
 (12, "deepak" ,"k",16, 7896354789),
 (13,"shalini","d",15,9444308088),
 (14,"mani","k",15,8776765678),
 (15,"hariharan","k",16,9878987564),
 (16,"shek","a",14,8765643298),
 (17,"shylender","h",14,9845456799),
 (18,"rajesh","a",16,8766456874),
 (19,"naresh","k",14,9876765423),
 (20,"naveen","l",14,987865378);
 
 select * from students;

create table marks ( mark_id int primary key ,
 student_id int,
 english int,
 tamil int,
 maths int,
 science int,
 social int,
 evs int ,
foreign key (student_id) references students(student_id));

insert into marks values
 (51,11,90,50,60,89,78,59),
 (52,12,78,64,83,93,90,60),
 (53,13,60,78,94,72,71,90),
 (54,14,90,92,93,99,90,91),
 (55,15,51,41,39,49,52,50),
 (56,16,71,82,49,60,70,40),
 (57,17,90,69,59,70,80,48),
 (58,18,50,67,87,94,80,99),
 (59,19,99,79,90,86,84,88),
 (60,20,70,73,75,67,69,77);
 
 select* from marks;
 
 create table subject ( subject_id int primary key ,
 subject_name varchar(100));
 
 insert into subject ( subject_id ,subject_name ) values
 ( 1, "english"),
 ( 2, "tamil"),
 (3,"maths"),
 (4, "science"),
 (5," social"),
 (6,"evs");

create table teachers
 ( teacher_id int primary key , 
 first_name varchar(100),
 last_name varchar(100),
subject_id int ,
 contact_number varchar(100) ,
 email varchar(100),
foreign key (subject_id) references subject(subject_id));

insert into teachers values
 ( 01,"priya","a",1,987654675, "priya1100@gmail.com"),
 (02,"kavya","k",2,8787698743,"kavya1100@gmail.com"),
 (03,"shalini","d",3,9823412567,"shalini1100@gmail.com"),
 (04,"sharini","d",4,9876565633,"sharini1100@gmail.com"),
 (05,"abinaya","k",5,8787654327,"abinaya1100@gmail.com"),
 (06,"rashmika","n",6,9873234546,"rashmika1100@gmail.com");
 
update teachers
set contact_number = '9444308088'
where teacher_id = 3;

 create table classes ( class_id int primary key , 
class_name varchar(100),
teacher_id int,
foreign key (teacher_id) references teachers (teacher_id));

insert into classes values
 (21,"english_class",01),
 (22,"tamil_class",02),
 (23,"maths_class",03),
 (24,"science_class",04),
 (25,"social_class",05),
 (26,"evs_class",06);
 
 show tables from schoolmanagement;
 
 delimiter $$
create procedure highmark ( in id int)
begin
select *from marks
where english > 80;
select subject_name from subject;
end  $$
call highmark (11)

delimiter $$
create procedure age ( in id int)
begin
select *from students
where age < 16;
select first_name , contact_number 
from students;
end  $$
 call age (1);
 
 
create view lowmark as
select student_id , evs
from marks
where evs < 80;

select*from lowmark;

call age(1);

SELECT student_id,
(english + tamil + maths + science + social + evs) AS total_marks
FROM marks;

select student_id , maths,
rank() over (order by maths desc) as "rank"
from marks;

create view rank_list as
select student_id,total_marks,
rank() over (order by total_marks desc) as total_rank
from (select student_id,
(english + tamil + maths + science + social + evs) as total_marks
from marks) as total_scores;

select*from rank_list;

select s.first_name,m.student_id,total_marks,
rank() over (order by total_marks desc) as total_rank
from (select student_id,(english + tamil + maths + science + social + evs) AS total_marks
from marks) as m 
join students as s on m.student_id = s.student_id;






    
    
