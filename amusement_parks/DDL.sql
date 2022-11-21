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
	parkid		varchar(4) 		not null,
	city		varchar(128) 	not null,
	state		varchar(128)	not null,
	country		varchar(128)	not null,
	primary key (parkid),
	foreign key (parkid) references park (id)
	)

create table zone
	(
	parkid		varchar(4) 		not null,
	zonename	varchar(128)	not null,
	primary key (parkid, zonename),
	foreign key (parkid) references park (id)
	)

create table ride
	(
	id varchar(3) not null,
	name varchar(128) not null,
	maxspeed int(3) not null,
	description varchar(512) not null,
	parkid varchar(3) not null,
	primary key (id),
	foreign key (parkid) references park (id)
	)

create table ridezone
	(
	rideid varchar(3) not null,
	zonename varchar(128) not null,
	primary key (rideid),
	foreign key (rideid) referneces ride (id),
	foreign key (zonename) references zone (zonename)
	)

-- Misc. Tables
create table state_abbreviations
	(
		state			varchar(128)	not null,
		abbreviation	varchar(2) 		not null,
		primary key (abbreviation)
	)