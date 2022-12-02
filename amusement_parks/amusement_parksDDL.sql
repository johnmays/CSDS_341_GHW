drop table ridezone
drop table riderating
drop table attractionzone
drop table attraction
drop table location
drop table zone
drop table ride
drop table rating
drop table park

-- Main Tables:
create table park
	(
	id			int IDENTITY(1, 1) 		not null,
	name		varchar(128) 	not null,
	description	varchar(512)	not null,
	status		varchar(32)		not null check (status in ('open', 'permanently closed', 'temporarily closed')),
	primary key (id)
	)

create table location
	(
	parkid		int IDENTITY(1, 1) 	not null,
	city		varchar(128) 	not null,
	state		varchar(128)	not null,
	country		varchar(128)	not null,
	primary key (parkid),
	foreign key (parkid) references park (id)
	)

create table zone
	(
	parkid		int 			not null,
	zonename	varchar(128)	not null,
	primary key (parkid, zonename),
	foreign key (parkid) references park (id)  on delete cascade
	)

create table ride
	(
	rideid int IDENTITY(1, 1) not null,
	name varchar(128) not null,
	maxspeed int not null,
	description varchar(512) not null,
	primary key (rideid),
	)

create table ridezone
	(
	rideid int not null,
	parkid int not null,
	zonename varchar(128) not null,
	primary key (rideid),
	foreign key (rideid) references ride (rideid) on delete cascade,
	foreign key (parkid, zonename) references zone (parkid, zonename) on delete cascade
	)

create table attraction
	(
	id int IDENTITY(1, 1) not null, 
	name varchar(128) not null, 
	description varchar (128) not null, 
	primary key (id),
	)

create table rating
	(
		rating varchar(16) check (rating in('baby', 'intermediate', 'concussion'))	not null,
		description varchar(512)	not null,
		agelimit int check (agelimit > 0)	not null,
		primary key (rating)
	)
	
-- This table stores the various possible ride ratings
create table riderating
	(
	rideid int not null,
	rating varchar(16) check (rating in ('baby', 'intermediate', 'concussion')),
	primary key (rideid),
	foreign key (rideid) references ride (rideid) on delete cascade,
	foreign key (rating) references rating (rating) on delete cascade
	)

-- This table relates an attraction to its corresponding zonename
create table attractionzone
	(
		attractionid int not null,
		zonename varchar(128),
		primary key (attractionid),
		foreign key (attractionid) references attraction (id) on delete cascade
	)
