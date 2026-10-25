create database sql_project;
use sql_project;
create table events(event_id int primary key,event_name varchar(50),event_type varchar(20),event_date date,venue varchar(20),registration_fee int);
create table Participants (participant_id int primary key, participant_name varchar(20), email varchar(20), phone bigint, city varchar(20));
create table Registrations (registration_id int primary key, event_id int, participant_id INT, registration_date date,registration_status varchar(20));
create table Attendance (attendance_id int primary key, registration_id int, attendance_date date,attendance_status char(20));
create table Certificates (certificate_id int primary key, registration_id int, certificate_type varchar(20), issue_date date);
INSERT INTO Events
(event_id, event_name, event_type, event_date, venue, registration_fee)VALUES
(101, 'AI Summit 2026', 'Workshop', '2026-08-05', 'Hyderabad', 1500),
(102, 'Cloud Computing Expo', 'Conference', '2026-08-08', 'Bengaluru', 2000),
(103, 'Data Science Bootcamp', 'Workshop', '2026-08-12', 'Chennai', 1200),
(104, 'Cyber Security Meet', 'Seminar', '2026-08-15', 'Visakhapatnam', 800),
(105, 'Web Development Hackathon', 'Hackathon', '2026-08-18', 'Vijayawada', 500),
(106, 'Machine Learning Conference', 'Conference', '2026-08-20', 'Hyderabad', 1800),
(107, 'DevOps Hands-on Lab', 'Workshop', '2026-08-23', 'Pune', 1000),
(108, 'Tech Career Connect', 'Seminar', '2026-08-25', 'Kochi', 600);

INSERT INTO Participants(participant_id, participant_name, email, phone, city)VALUES
(201, 'Aarav', 'aarav@gmail.com', '9876501001', 'Hyderabad'),
(202, 'Bhavya', 'bhavya@gmail.com', '9876501002', 'Vijayawada'),
(203, 'Charan', 'charan@gmail.com', '9876501003', 'Visakhapatnam'),
(204, 'Divya', 'divya@gmail.com', '9876501004', 'Bengaluru'),
(205, 'Esha', 'esha@gmail.com', '9876501005', 'Chennai'),
(206, 'Farhan', 'farhan@gmail.com', '9876501006', 'Mumbai'),
(207, 'Gopi', 'gopi@gmail.com', '9876501007', 'Warangal'),
(208, 'Harini', 'harini@gmail.com', '9876501008', 'Guntur'),
(209, 'Ishaan', 'ishaan@gmail.com', '9876501009', 'Pune'),
(210, 'Kavya', 'kavya@gmail.com', '9876501010', 'Kochi'),
(211, 'Manoj', 'manoj@gmail.com', '9876501011', 'Hyderabad'),
(212, 'Nandini', 'nandini@gmail.com', '9876501012', 'Bengaluru');

INSERT INTO Registrations(registration_id, event_id, participant_id, registration_date, registration_status)VALUES
(301,101,201,'2026-07-20','Confirmed'),(302,101,202,'2026-07-21','Confirmed'),
(303,102,203,'2026-07-22','Confirmed'),(304,102,204,'2026-07-23','Cancelled'),
(305,103,205,'2026-07-24','Confirmed'),(306,103,206,'2026-07-25','Confirmed'),
(307,104,207,'2026-07-26','Confirmed'),(308,104,208,'2026-07-27','Confirmed'),
(309,105,209,'2026-07-28','Confirmed'),(310,106,210,'2026-07-29','Confirmed'),
(311,106,201,'2026-07-30','Confirmed'),(312,107,211,'2026-07-31','Confirmed'),
(313,107,212,'2026-08-01','Cancelled'),(314,108,203,'2026-08-02','Confirmed'),
(315,103,201,'2026-08-03','Confirmed'),(316,105,205,'2026-08-04','Confirmed');

INSERT INTO Attendance(attendance_id, registration_id, attendance_date, attendance_status)VALUES
(401,301,'2026-08-05','Present'),(402,302,'2026-08-05','Present'),
(403,303,'2026-08-08','Present'),(404,305,'2026-08-12','Absent'),
(405,306,'2026-08-12','Present'),(406,307,'2026-08-15','Present'),
(407,308,'2026-08-15','Absent'),(408,309,'2026-08-18','Present'),
(409,310,'2026-08-20','Present'),(410,311,'2026-08-20','Present'),
(411,312,'2026-08-23','Present'),(412,314,'2026-08-25','Absent'),
(413,315,'2026-08-12','Present'),(414,316,'2026-08-18','Present');

INSERT INTO Certificates(certificate_id, registration_id, certificate_type, issue_date)VALUES
(501,301,'Participation','2026-08-05'),(502,302,'Participation','2026-08-05'),
(503,303,'Participation','2026-08-08'),(504,306,'Participation','2026-08-12'),
(505,307,'Participation','2026-08-15'),(506,309,'Winner','2026-08-18'),
(507,310,'Participation','2026-08-20'),(508,311,'Participation','2026-08-20'),
(509,312,'Participation','2026-08-23'),(510,314,'Participation','2026-08-25'),
(511,315,'Participation','2026-08-12');


select * from events;
select * from participants;
select * from registrations;
select * from attendance;
select * from certificates;

#1
select event_id,event_name,event_type,venue from events;

#2
select participant_name,email,city from participants;

#3
update events set registration_fee=registration_fee*1.10  where event_type='workshop';
set sql_safe_updates=0;
select * from events;

#4
update registrations set registration_status="confirmed";
select * from registrations;

#5
delete  from registrations where registration_status='cancelled';
select * from registrations;

#6
select upper(participant_name) as participant_name from participants;

#7
select lower(event_name) as event_name from events;

#8
select left(event_name,4) as event_name from events;

#9
select concat(participant_name,'-',city) as particular_details from participants;

#10
update events set event_name=replace(event_type,'conference','summit') where event_type like '%conference%';
select * from events;

#11
select * from events where month(event_date)=month(curdate()) and year(event_date)=year(curdate());

#12
select event_name,event_date,dayname(event_date) as dayname from events;

#13
select r.registration_id,e.event_date,r.registration_date,DATEDIFF(e.event_date,r.registration_date) from events e join registrations r on e.event_id=r.event_id;

#14
select date_format(event_date,"%d-%M-%Y") as event_date from events;

#15
select certificate_id,date_format(issue_date,"%M-%Y")  as date from certificates;

#16
select e.event_id,e.event_name,count(r.participant_id) as count from events e join registrations r on e.event_id=r.event_id join participants p 
on p.participant_id=r.participant_id group by event_id,event_name;

#17
select event_type,avg(registration_Fee)  as avg_fee from events group by event_type;

#18
select event_type,max(registration_fee) as highest_fee from events group by event_type;


#19
select registration_status,count(registration_status) as total_registrations from registrations group by registration_status;


#20
select e.event_name,a.attendance_status,count(*) as total from events e join Registrations r on e.event_id = r.event_id join Attendance a 
on r.registration_id = a.registration_id group by e.event_id, e.event_name, a.attendance_status;

#21
select event_type,count(event_type)as total_events from events group by event_type having total_events>1;

#22
select distinct certificate_type,count(certificate_type) as total_certificates from certificates group by certificate_type;

#23
select p.participant_name,e.event_name from Participants p join Registrations r on p.participant_id = r.participant_id join events e on r.event_id = e.event_id;

#24
select e.event_name,p.participant_name,r.registration_date from Registrations r join events e on r.event_id = e.event_id join Participants p 
on r.participant_id = p.participant_id;

#25
select p.participant_name,e.event_name,a.attendance_status,a.attendance_date from Attendance a join Registrations r on a.registration_id = r.registration_id 
join Participants p on r.participant_id = p.participant_id JOIN events e on r.event_id = e.event_id;

#26
select p.participant_name,e.event_name,c.certificate_type,c.issue_date from certificates c join registrations r on c.registration_id = r.registration_id 
join participants p on r.participant_id = p.participant_id join events e on r.event_id = e.event_id;

#27
select e.event_name,p.participant_name from events e left join registrations r on e.event_id = r.event_id left join participants p on r.participant_id = p.participant_id;

#28
select p.participant_id,p.participant_name,r.registration_id,r.event_id,r.registration_date,r.registration_status from participants p left join registrations r 
on p.participant_id = r.participant_id;

#29
select e.event_name,p.participant_name,r.registration_status,c.certificate_type from registrations r join events e on r.event_id = e.event_id join participants p 
on r.participant_id = p.participant_id left join certificates c on r.registration_id = c.registration_id;

#30
select distinct p.participant_id,p.participant_name,e.event_name,e.registration_fee from participants p join registrations r on p.participant_id = r.participant_id 
join events e on r.event_id = e.event_id where e.registration_fee > (select avg(registration_fee) from events);

#31
select e.event_name,count(r.registration_id) as total_registrations from events e join registrations r on e.event_id = r.event_id group by e.event_id, e.event_name 
having count(r.registration_id) = ( select max(registration_count) from (select count(*) as registration_count from registrations group by event_id) as event_counts);

#32
select p.participant_id,p.participant_name,count(a.attendance_id) as events_attended from participants p join registrations r on p.participant_id = r.participant_id 
join attendance a on r.registration_id = a.registration_id where a.attendance_status = 'Present' group by p.participant_id, p.participant_name 
having count(a.attendance_id) > (select avg(attendance_count)from (select p2.participant_id,count(case when a2.attendance_status = 'Present' then 1 end) as attendance_count
from participants p2 left join registrations r2 on p2.participant_id = r2.participant_id left join attendance a2 on r2.registration_id = a2.registration_id 
group by p2.participant_id) as participant_counts);

#33
select distinct p.participant_id,p.participant_name,e.event_name from participants p join registrations r on p.participant_id = r.participant_id join events e 
on r.event_id = e.event_id join attendance a on r.registration_id = a.registration_id where e.event_type = 'Workshop' and a.attendance_status = 'Present';

#34
select e.event_id,e.event_name from events e left join registrations r on e.event_id = r.event_id where r.registration_id is null;

#35
create view participant_event_details as select p.participant_name,e.event_name,e.event_date,r.registration_status,a.attendance_status from participants p 
join registrations r on p.participant_id = r.participant_id join events e on r.event_id = e.event_id left join attendance a on r.registration_id = a.registration_id;
select * from participant_event_details;

#36
create view event_attendance_summary as select e.event_name,coalesce(r.total_registrations, 0) as total_registrations,coalesce(a.total_present, 0) as total_present,
coalesce(a.total_absent, 0) as total_absent from events e left join (select event_id,count(*) as total_registrations from registrations group by event_id)r  
on e.event_id = r.event_id left join (select r.event_id,sum(case when a.attendance_status = 'Present' then 1 else 0 end) as total_present,
sum(case when a.attendance_status = 'Absent' then 1 else 0 end) as total_absent from registrations r join attendance a on r.registration_id = a.registration_id 
group by r.event_id) a on e.event_id = a.event_id;
select * from participant_event_details;
select * from event_attendance_summary;

#37
start transaction;
update events set registration_fee = registration_fee + 100 where event_id = 101;
savepoint fee_updated;
update registrations set registration_status = 'Cancelled' where registration_id = 301;
rollback to savepoint fee_updated;
commit;

#38
call get_participant_registrations(201);

#39
call get_total_events_attended(201);

#40
create table registration_archive (registration_id int primary key, event_id int, participant_id INT, registration_date date,registration_status varchar(20));
delete from registrations where registration_id = 301;
select * from registration_archive;

#41
create table attendance_history (history_id int auto_increment primary key,registration_id int,old_status varchar(20),new_status varchar(20),change_date datetime);
update attendance set attendance_status = 'Absent' where registration_id = 301;
select * from attendance_history;