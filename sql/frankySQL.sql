drop table if exists persons;
drop table if exists cins;
drop table if exists semester;

create table persons (
    id          	integer auto_increment primary key,
    person_name		varchar(255) not null,
    username		varchar(255) not null unique,    
    email			varchar(255) not null,
    cin				integer references cins(cin),
    password		varchar(255) not null,
    is_admin		boolean default false
);

create table cins (
	cin				integer primary key,
    email			varchar(255) not null,
    gpa				float not null,
    is_used			boolean default false
);

create table semester (
	sem				integer,
	cin				integer references cins(cin),
    c1				varchar(20) references courses(code),
    c2				varchar(20) references courses(code),
    c3				varchar(20) references courses(code),
    c4				varchar(20) references courses(code)
);

-- student courses for 300300300
insert into semester values(1, 300300300, 'CS1090', 'MATH2110', 'GE', 'GE');
insert into semester values(2, 300300300, 'CS1222', 'MATH2120', 'GE', 'GE');
insert into semester values(3, 300300300, 'CS2011', 'MATH2740', 'MATH2550', 'GE');
insert into semester values(4, 300300300, 'CS2012', 'GE', 'GE', 'GE');
insert into semester values(5, 300300300, 'CS2013', 'CS2148', 'PHYS2100', 'GE');
insert into semester values(6, 300300300, 'CS3112', 'CS3801', 'EE3445', 'PHYS2200');
insert into semester values(7, 300300300, 'CS3035', 'CS3186', 'CS4440', 'CS Elective');
insert into semester values(8, 300300300, 'CS3220', 'CS3337', 'CS Elective', 'CS Elective');
insert into semester values(9, 300300300, 'CS4961', 'CS Elective', 'CS Elective', null);
insert into semester values(10, 300300300, 'CS4962', 'CS4963', 'CS Elective', null);




-- sample student accounts
insert into persons values(1, 'Pamula', 'godmula', 'rpamula@calstatela.edu', 100100100, 'a', true);
insert into persons values(2, 'Franky Gudino', 'fgudino3', 'frankyjg96@gmail.com', 300300300, 'a', false);
insert into persons values(3, 'firstname lastname','a', 'a@a.gov', 200200200, 'a', false);
-- enter your own student values here, choose a cin, then set its last value to true below


-- sample cins
insert into cins values(100100100, 'rpamula@calstatela.edu', 10.0, true);
insert into cins values(200200200, 'a@a.gov', 2.0, true);
insert into cins values(300300300, 'frankyjg96@gmail.com', 4.0, true);
insert into cins values(400400400, 'addyouremail', 3.0, false);
insert into cins values(500500500, 'addyouremail', 3.0, false);
insert into cins values(600600600, 'addyouremail', 3.0, false);
insert into cins values(700700700, 'addyouremail', 4.0, false);
insert into cins values(800800800, 'addyouremail', 4.0, false);
insert into cins values(900900900, 'addyouremail', 4.0, false);
