delete from ridezone;
delete from riderating;
delete from attractionzone;
delete from attraction;
delete from location;
delete from zone;
delete from ride;
delete from rating;
delete from park;

-- Parks:
insert into park(name, description, status) values ('CheeseLand', 'Cheese-themed park with rides and attractions themed after cheese and the cheesemaking process.  Fresh cheese available everywehre.', 'permanently closed');
insert into park(name, description, status) values ('Coal Town', 'Coal-themed park with rides and attractions themed around coal and coal mining.', 'open');

-- Locations:
insert into location (city, state, country) values ('Terra-Haute', 'Indiana', 'United States');
insert into location (city, state, country) values ('Weston', 'West Virginia', 'United States');

-- Zones:
insert into zone(parkid, zonename) values (1, 'Cheddar Palace');
insert into zone(parkid, zonename) values (1, 'Curd Science Lab');
insert into zone(parkid, zonename) values (1, 'Swiss Land');
insert into zone(parkid, zonename) values (1, 'Dystopian Cow Processing Factory');
insert into zone(parkid, zonename) values (1, 'Havarti Castle');

-- Rides:
insert into ride(name, maxspeed, description) values('Top Thrill Cheester', 120, 'The Top Thrill Cheester is a hydraulically-launched steel roller coaster located at CheeseLand in Terra-Haute Indiana.');
insert into ride(name, maxspeed, description) values('Millenium Churn', 93, 'The Millenium Churn is a steel roller coaster located at CheeseLand in Terra-Haute Indiana. The worlds first giga coaster.');
insert into ride(name, maxspeed, description) values('The Baby Swisster', 93, 'The Baby Swisster is a kid friendly rollercoaster.');

-- Ride Zones:
insert into ridezone(rideid, parkid, zonename) values(1, 1, 'Cheddar Palace');
insert into ridezone(rideid, parkid, zonename) values(2, 1, 'Swiss Land');
insert into ridezone(rideid, parkid, zonename) values(3, 1, 'Swiss Land');

-- Attractions
insert into attraction(name, description) values('The Giant Curd', 'Its just a massive cheese curd.');
insert into attraction(name, description) values('Mozerella Mosque', 'Its a mosque made of cheese.')
insert into attraction(name, description) values('The Colby Crater', 'A cheesey meteor landing zone.')

-- AttractionZone
insert into attractionzone(attractionid, parkid, zonename) values(1, 1, 'Curd Science Lab');
insert into attractionzone(attractionid, parkid, zonename) values(2, 1, 'Havarti Castle');
insert into attractionzone(attractionid, parkid, zonename) values(3, 1, 'Dystopian Cow Processing Factory');

-- Ratings
insert into rating values('baby', 'Slow and safe, suitable for young children', 4);
insert into rating values('intermediate', 'Fast, with quick turns, but no loops or extreme heights. Suitable for older children.', 10);
insert into rating values('concussion', 'The fastest speeds and highest highs. Anything is fair game. Suitable for teenagers and adults.', 15)

-- RideRatings
insert into riderating(rideid, rating) values(1, 'concussion');
insert into riderating(rideid, rating) values(2, 'intermediate');
insert into riderating(rideid, rating) values(3, 'baby');

