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

-- Rides:
insert into ride values('001', 'Top Thrill Cheester', 120, "The Top Thrill Cheester is a hydraulically-launched steel roller coaster located at CheeseLand in Terra-Haute Indiana. It can accelerate from 0 to 120mph in 4 seconds.", '001');
insert into ride values('002', 'Millenium Churn', 93, "The Millenium Churn is a steel roller coaster located at CheeseLand in Terra-Haute Indiana. It was the world's first giga coaster.", '001');

-- Ride Zones:
insert into ridezone values('001', 'Cheddar Palace');
insert into ridezone values('002', 'Curd Science Lab');

-- MPA Film Ratings:
-- example: insert into rating values ('G', 'General Audiences');