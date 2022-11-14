--delete from statements
delete from park;
delete from locaiton;
delete from zone;

-- Parks:
insert into park values ('001', 'CheeseLand', 'Cheese-themed park with rides and attractions themed after cheese and the cheesemaking process.  Fresh cheese available everywehre.', 'permanently closed');

-- Locations:
insert into location values ('001', 'Terra-Haute', 'Indiana', 'United States');

-- Zones:
insert into zone values ('001', 'Cheddar Palace');
insert into zone values ('001', 'Curd Science Lab');
insert into zone values ('001', 'Swiss Land');
insert into zone values ('001', 'Dystopian Cow Processing Factory');
insert into zone values ('001', 'Havarti Castle');

-- MPA Film Ratings:
-- example: insert into rating values ('G', 'General Audiences');