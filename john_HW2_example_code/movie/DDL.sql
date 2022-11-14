drop table actor cascade;
drop table genre cascade;
drop table rating cascade;
drop table movie cascade;
drop table movieactor cascade;
drop table moviegenre cascade;

create table actor
	(
	id			varchar(8) 		not null,
	name		varchar(100) 	not null,
	status		varchar(8)		not null check (status in ('active', 'deceased', 'inactive')),
	primary key (id)
	);

create table genre
	(
	name		varchar(30) 	not null,
	description	varchar(200)	not null,
	primary key (name)
	);
	
create table rating
	(
	rating 		varchar(5) 		not null,
	description varchar(200),
	primary key (rating)
	);

create table movie
	(
	id			varchar(8)		not null,
	title		varchar(100) 	not null,
	rating		varchar(5),
	primary key (id),
	foreign key (rating) references rating (rating)
	);

create table movieactor
	(
	movieid 	varchar(8)		not null,
	actorid 	varchar(8)		not null,
	star		char(1)			not null check (star = 'Y' or star = 'N'),
	primary key (movieid, actorid),
	foreign key (movieid) references movie (id),
	foreign key (actorid) references actor (id)
	);

create table moviegenre
	(
	id			varchar(8)		not null,
	name 		varchar(8)		not null,
	primary key (id, name),
	foreign key (id) references movie (id),
	foreign key (name) references genre (name)
	);