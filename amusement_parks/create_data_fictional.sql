delete from park;
delete from location;
delete from zone;
delete from rating;
delete from attractionzone;

-- Parks:
insert into park values ('001', 'CheeseLand', 'Cheese-themed park with rides and attractions themed after cheese and the cheesemaking process.  Fresh cheese available everywehre.', 'permanently closed');
insert into park values ('002', 'Coal Town', 'Coal-themed park with rides and attractions themed around coal and coal mining.', 'open');

-- Locations:
insert into location values ('001', 'Terra-Haute', 'Indiana', 'United States');
insert into location values ('002', 'Weston', 'West Virginia', 'United States');

-- Zones:
insert into zone values ('001', 'Cheddar Palace');
insert into zone values ('001', 'Curd Science Lab');
insert into zone values ('001', 'Swiss Land');
insert into zone values ('001', 'Dystopian Cow Processing Factory');
insert into zone values ('001', 'Havarti Castle');

-- Rides:
insert into ride values('001', 'Top Thrill Cheester', 120, "The Top Thrill Cheester is a hydraulically-launched steel roller coaster located at CheeseLand in Terra-Haute Indiana. It can accelerate from 0 to 120mph in 4 seconds.");
insert into ride values('002', 'Millenium Churn', 93, "The Millenium Churn is a steel roller coaster located at CheeseLand in Terra-Haute Indiana. It was the world's first giga coaster.");
insert into ride values('003', 'The Baby Swisster', 93, "The Baby Swisster is a kid friendly rollercoaster.");

-- Ride Zones:
insert into ridezone values('001', 'Cheddar Palace');
insert into ridezone values('002', 'Curd Science Lab');

-- Attractions
insert into attraction values('001', 'The Giant Curd', 'Its just a massive cheese curd.');
insert into attraction values('002', 'Mozerella Mosque', 'Its a mosque made of cheese.')
insert into attraction values('003', 'The Colby Crater', 'A cheesey meteor landing zone.')

-- AttractionZone
insert into attractionzone values('001', '001');
insert into attractionzone values('002', '002');
insert into attractionzone values('003', '001');

-- Ratings
insert into rating values('baby', 'Slow and safe, suitable for young children', 4);
insert into rating values('intermediate', 'Fast, with quick turns, but no loops or extreme heights. Suitable for older children.', 10);
insert into rating values('concussion', 'The fastest speeds and highest highs. Anything is fair game. Suitable for teenagers and adults.')

-- RideRatings
insert into riderating values('001', '003');
insert into riderating values('002', '002');
insert into riderating values('003', '001');
