drop table park cascade
drop table location cascade
drop table zone cascade

-- Main Tables:
create table park
	(
	id			varchar(3) 		not null,
	name		varchar(128) 	not null,
	description	varchar(512)	not null,
	status		varchar(32)		not null check (status in ('open', 'permanently closed', 'temporarily closed')),
	primary key (id)
	)

create table location
	(
	parkid		varchar(3) 		not null,
	city		varchar(128) 	not null,
	state		varchar(128)	not null,
	country		varchar(128)	not null,
	primary key (parkid),
	foreign key (parkid) references park (id)
	)

create table zone
	(
	parkid		varchar(3) 		not null,
	zonename	varchar(128)	not null,
	primary key (parkid, zonename),
	foreign key (parkid) references park (id)
	)

create table ride
	(
	id varchar(3) not null,
	name varchar(128) not null,
	maxspeed int not null,
	description varchar(512) not null,
	parkid varchar(3) not null,
	primary key (id),
	foreign key (parkid) references park (id)
	)

create table ridezone
	(
	rideid varchar(3) not null,
	parkid varchar(3) not null,
	zonename varchar(128) not null,
	primary key (rideid),
	foreign key (rideid) references ride (id),
	foreign key (parkid, zonename) references zone (parkid, zonename)
	)

create table attraction
	(
	id varchar(3) not null, 
	parkid varchar(3) not null,
	name varchar(128) not null, 
	description varchar (128) not null, 
	primary key (id),
	foreign key (parkid) references park (id)
	)
	-- This table stores the various possible ride ratings
create table rating
	(
		rating varchar(16) check (rating in('baby', 'intermediate', 'concussion'))	not null,
		description varchar(512)	not null,
		agelimit int check (agelimit > 0)	not null,
		primary key (rating)
	)

create table riderating
	(
	rideid varchar(3) not null,
	rating varchar(16) check (rating in ('baby', 'intermediate', 'concussion')),
	primary key (rideid),
	foreign key (rideid) references ride (id),
	foreign key (rating) references rating (rating)
	)



-- This table relates an attraction to its corresponding zonename
create table attractionzone
	(
		attractionid varchar(3) not null,
		zonename varchar(128),
		primary key (attractionid),
		foreign key (attractionid) references attraction (id)
	)


-- Misc. Tables
create table state_abbreviations
	(
		state			varchar(128)	not null,
		abbreviation	varchar(2) 		not null,
		primary key (abbreviation)
	)