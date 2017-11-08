use cs3337stu04;

#google 
#varchar20, varchar100, float, varchar100, boolean
drop table if exists courses;

CREATE TABLE courses  (
	code varchar(20),
	name varchar(180),
	units float,
	coordinator varchar(100),
	available boolean,
    semester varchar(100),
    prerequisites varchar(200),
    year float
); 

insert into courses values('CS1010', 'Introduction To Higher Education For Computer Science Majors', 3, 'Raj Pamula', 1, 'Spring, Fall', null, 1);

insert into courses values ('CS1090', 'BASIC Programming', 2, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values ('CS1200', 'Living in a Technology-Based World', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values ('CS1220', 'Introduction to Website Development', 3, 'Chengyu Sun', false, 'Spring, Fall', null, 1.5);

insert into courses values ('CS1222', 'Introduction to Relational Databases', 3, 'Chengyu Sun', false, 'Spring, Fall', 'CS1010', 1.5);

insert into courses values ('CS2010', 'Computer Programming Fundamentals', 3, 'Yuqing Zhu', false, 'Spring, Fall', null, 0);

insert into courses values ('CS2011', 'Introduction to Programming I', 3, 'Yuqing Zhu', false, 'Spring, Fall', 'CS1010', 1.5);

insert into courses values ('CS2012', 'Introduction to Programming II', 3, 'Yuqing Zhu', false, 'Spring, Fall', 'CS2011', 2);

insert into courses values ('CS2013', 'Programming with Data Structures', 3, 'Yuqing Zhu', false, 'Spring, Fall', 'CS2012', 2.5);

insert into courses values ('CS2148', 'Discrete Structures', 3, 'Behzad Parviz', 1, 'Spring, Fall', 'CS2012, MATH2120', 2.5);

insert into courses values ('CS2445', 'Introduction to Computer Systems', 3, 'Zilong Ye', false, 'Spring, Fall', null, 0);

insert into courses values ('CS2540', 'Special Topics in Computer Science', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values ('CS2550', 'Introduction to Computer Graphics Tools', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS3034', 'Widely-Used Programming Languages', 3, 'Russ Abbott', false, 'Spring, Fall', null, 0);

insert into courses values ('CS3035', 'Programming Language Paradigms', 3, 'Russ Abbott', false, 'Spring, Fall', 'CS2013', 3);

insert into courses values ('CS3112', 'Analysis of Algorithms', 3, 'Behzad Parviz', 1, 'Spring, Fall', 'CS2013', 3);

insert into courses values ('CS3186', 'Introduction to Automata Theory', 3, 'Vladimir Akis', 1, 'Spring, Fall', 'CS2013', 3.5);

insert into courses values ('CS3220', 'Web and Internet Programming', 3, 'Chengyu Sun', 1, 'Spring, Fall', 'CS2013', 3);

insert into courses values ('CS3337', 'Software Engineering', 3, 'Jiang Guo', 1, 'Spring, Fall', 'CS2013', 3);

insert into courses values ('CS3550', 'Game Development for Graphic Communications', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS3555', 'Mobile Development for Graphic Communications', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS3660', 'Complex Social and Economic Systems', 3, 'Mohammad Pourhomayoun', false, 'Spring, Fall', null, 0);

insert into courses values ('CS3801', 'Societal and Ethical Issues in Computing', 3, 'Russ Abbott', 1, 'Spring, Fall', 'CS3801', 3.5);

insert into courses values ('CS3890', 'Cooperative Education', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values('EE3445', 'Computer Organization', 3, 'Electrical Engineering Department', 1, 'Spring, Fall', 'CS2013', 3);


insert into courses values ('CS4075', 'Concurrent and Distributed Programming', 3, 'Yuqing Zhu', true, 'Spring, Fall', null, 0);

insert into courses values ('CS4112', 'Competitive Programming', 3, 'Russ Abbott', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4188', 'Compilers', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4220', 'Current Trends in Web Design and Development', 3, 'Chengyu Sun', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4222', 'Principles of Database Systems', 3, 'Huiping Guo', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4440', 'Introdcution to Operating Systems', 3, 'Jiang Guo', true, 'Spring, Fall', 'CS2013', 3.5);

insert into courses values ('CS4470', 'Computer Networking Protocols', 3, 'Zilong Ye', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4471', 'Computer Networks Configuration and Management', 3, 'Zilong Ye', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4540', 'Special Topics in Computer Science', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4550', 'Computer Graphics', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4551', 'Multimedia Software Systems', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4555', 'Introduction to 3D Computer Game Programming', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4556', 'Multiplayer Online Game Design and Development', 3, 'Elaine Kang', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4635', 'Modeling and Simulation', 3, 'Russ Abbott', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4660', 'Artificial Intelligence', 3, 'Mohammad Pourhomayoun', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4661', 'Introduction to Data Science', 3, 'Mohammad Pourhomayoun', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4780', 'Cryptography and Information Security', 3, 'Huiping Guo', false, 'Spring, Fall', null, 0);

insert into courses values ('CS4961', 'Software Design Laboratory I', 3, 'Raj Pamula', true, 'Fall', 'CS3112, CS3220, CS3035, CS3337, CS3186, CS3801', 4);

insert into courses values ('CS4962', 'Software Design Laboratory II', 3, 'Raj Pamula', false, 'Spring', 'CS4961', 4.5);

insert into courses values ('CS4963', 'Computer Science Recapitulation', 3, 'Zilong Ye', false, 'Spring, Fall', 'MATH2550, PHYS2200', 4.5);

insert into courses values ('CS4990', 'Undergraduate Directed Study', 3, 'Raj Pamula', false, 'Spring, Fall', null, 0);

insert into courses values('MATH2110', 'Calculus I', 4, 'Math Department', 1, 'Spring, Fall', null, 1);
insert into courses values('MATH2120', 'Calculus II', 4, 'Math Department', 1, 'Spring, Fall', 'MATH2110', 1.5);
insert into courses values('MATH2550', 'Introduction to Linear Algebra', 3, 'Math Department', 1, 'Spring, Fall', null, 2);
insert into courses values('MATH2740', 'Introduction to Statistics', 3, 'Math Department', 1, 'Spring, Fall', null, 2);
insert into courses values('PHYS2100', 'General Physics I: Mechanics', 5, 'Physics Department', 1, 'Spring, Fall', null, 2);
insert into courses values('PHYS2200', 'General Physics II: Electromagnetism and Circuits', 5, 'Physics Department', 1, 'Spring, Fall', 'PHYS2100', 2.5);
insert into courses values('COMM1100', 'Oral Communication', 3, 'Communications Department', 1, 'Spring, Fall', null, 1);
insert into courses values('ENGL1010', 'Accelerated College Writing', 3, 'English Department', 1, 'Spring, Fall', null, 1);

insert into courses values('GE B2/B3', 'General Education Course', 3, 'Respective', 1, 'Spring, Fall', null, 1);
insert into courses values('HIST2020', 'United States History 1877 to Present', 3, 'History Department', 1, 'Spring, Fall', null, 1.5);
insert into courses values('POLS1000', 'Government and American Society', 3, 'Political Science Department', 1, 'Spring, Fall', null, 1.5);
insert into courses values('GEC1', 'General Education Course', 3, 'Respective', 1, 'Spring, Fall', null, 2);
insert into courses values('GED1', 'General Education Course', 3, 'Respective', 1, 'Spring, Fall', null, 2.5);
insert into courses values('ENGL2030', 'Introduction to Technical Writing', 3, 'English Department', 1, 'Spring, Fall', 'ENGL1010', 2.5);
insert into courses values('GED2', 'General Education Course', 3, 'Respective', 1, 'Spring, Fall', null, 3.5);

insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 3.5);
insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 4);
insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 4);
insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 4);
insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 4.5);
insert into courses values ('CSElective', 'CS Elective Student Choice', 3, 'Computer Science Department', 1, 'Spring, Fall', 'CS2013', 4.5);

select * from courses;