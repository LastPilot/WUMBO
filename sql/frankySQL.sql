drop table if exists persons;
drop table if exists cins;

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
