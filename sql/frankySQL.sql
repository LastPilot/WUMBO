drop table if exists persons;
drop table if exists cins;
drop table if exists semester;

create table persons (
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
insert into semester values(7, 300300300, 'CS3035', 'CS3186', 'CS4440', 'CSElective1');
insert into semester values(8, 300300300, 'CS3220', 'CS3337', 'CSElective2', 'CSElective3');
insert into semester values(9, 300300300, 'CS4961', 'CSElective4', 'CSElective5', null);
insert into semester values(10, 300300300, 'CS4962', 'CS4963', 'CSElective6', null);

-- student courses for 200200200
insert into semester values(1, 200200200, 'CS1090', 'MATH2110', 'GE', 'GE');
insert into semester values(2, 200200200, 'CS1222', 'MATH2120', 'GE', 'GE');
insert into semester values(3, 200200200, 'CS2011', 'MATH2740', 'MATH2550', 'GE');
insert into semester values(4, 200200200, 'CS2012', 'GE', 'GE', 'GE');
insert into semester values(5, 200200200, 'CS2013', 'CS2148', 'PHYS2100', 'GE');
insert into semester values(6, 200200200, 'CS3112', 'CS3801', 'EE3445', 'PHYS2200');
insert into semester values(7, 200200200, 'CS3035', 'CS3186', 'CS4440', 'CSElective1');
insert into semester values(8, 200200200, 'CS3220', 'CS3337', 'CSElective2', 'CSElective3');
insert into semester values(9, 200200200, 'CS4961', 'CSElective4', 'CSElective5', null);
insert into semester values(10, 200200200, 'CS4962', 'CS4963', 'CSElective6', null);

-- student courses for 400400400
insert into semester values(1, 400400400, 'CS1090', 'MATH2110', 'GE', 'GE');
insert into semester values(2, 400400400, 'CS1222', 'MATH2120', 'GE', 'GE');
insert into semester values(3, 400400400, 'CS2011', 'MATH2740', 'MATH2550', 'GE');
insert into semester values(4, 400400400, 'CS2012', 'GE', 'GE', 'GE');
insert into semester values(5, 400400400, 'CS2013', 'CS2148', 'PHYS2100', 'GE');
insert into semester values(6, 400400400, 'CS3112', 'CS3801', 'EE3445', 'PHYS2200');
insert into semester values(7, 400400400, 'CS3035', 'CS3186', 'CS4440', 'CSElective1');
insert into semester values(8, 400400400, 'CS3220', 'CS3337', 'CSElective2', 'CSElective3');
insert into semester values(9, 400400400, 'CS4961', 'CSElective4', 'CSElective5', null);
insert into semester values(10, 400400400, 'CS4962', 'CS4963', 'CSElective6', null);

-- student courses for 500500500
insert into semester values(1, 500500500, 'CS1090', 'MATH2110', 'GE', 'GE');
insert into semester values(2, 500500500, 'CS1222', 'MATH2120', 'GE', 'GE');
insert into semester values(3, 500500500, 'CS2011', 'MATH2740', 'MATH2550', 'GE');
insert into semester values(4, 500500500, 'CS2012', 'GE', 'GE', 'GE');
insert into semester values(5, 500500500, 'CS2013', 'CS2148', 'PHYS2100', 'GE');
insert into semester values(6, 500500500, 'CS3112', 'CS3801', 'EE3445', 'PHYS2200');
insert into semester values(7, 500500500, 'CS3035', 'CS3186', 'CS4440', 'CSElective1');
insert into semester values(8, 500500500, 'CS3220', 'CS3337', 'CSElective2', 'CSElective3');
insert into semester values(9, 500500500, 'CS4961', 'CSElective4', 'CSElective5', null);
insert into semester values(10, 500500500, 'CS4962', 'CS4963', 'CSElective6', null);

-- student courses for 600600600, all the rest would have this default scheme
insert into semester values(1, 600600600, 'CS1090', 'MATH2110', 'GE', 'GE');
insert into semester values(2, 600600600, 'CS1222', 'MATH2120', 'GE', 'GE');
insert into semester values(3, 600600600, 'CS2011', 'MATH2740', 'MATH2550', 'GE');
insert into semester values(4, 600600600, 'CS2012', 'GE', 'GE', 'GE');
insert into semester values(5, 600600600, 'CS2013', 'CS2148', 'PHYS2100', 'GE');
insert into semester values(6, 600600600, 'CS3112', 'CS3801', 'EE3445', 'PHYS2200');
insert into semester values(7, 600600600, 'CS3035', 'CS3186', 'CS4440', 'CSElective1');
insert into semester values(8, 600600600, 'CS3220', 'CS3337', 'CSElective2', 'CSElective3');
insert into semester values(9, 600600600, 'CS4961', 'CSElective4', 'CSElective5', null);
insert into semester values(10, 600600600, 'CS4962', 'CS4963', 'CSElective6', null);


-- sample student accounts
insert into persons values('Pamula', 'godmula', 'rpamula@calstatela.edu', 100100100, 'a', true);
insert into persons values('Franky Gudino', 'fgudino3', 'fgudino3@calstatela.edu', 300300300, 'a', false);
insert into persons values('Roi Chico','rchico2', 'Roi.chico21@gmail.com', 200200200, 'a', false);
insert into persons values('Kristen Marenco','kmarenco4', 'kristenmarenco@gmail.com', 400400400, 'a', false);
insert into persons values('Luis Gonzales','lgonzales5', 'LuisGnzlz33@gmail.com', 500500500, 'a', false);
-- enter your own student values here, choose a cin, then set its last value to true below


-- sample cins
insert into cins values(100100100, 'rpamula@calstatela.edu', 10.0, true);
insert into cins values(200200200, 'rchico@calstatela.edu', 3.8, true);
insert into cins values(300300300, 'fgudino3@calstatela.edu', 3.8, true);
insert into cins values(400400400, 'kristenmarenco@gmail.com', 3.8, false);
insert into cins values(500500500, 'LuisGnzlz33@gmail.com', 3.8, false);
insert into cins values(600600600, 'addyouremail', 3.0, false);
insert into cins values(700700700, 'addyouremail', 4.0, false);
insert into cins values(800800800, 'addyouremail', 4.0, false);
insert into cins values(900900900, 'addyouremail', 4.0, false);
