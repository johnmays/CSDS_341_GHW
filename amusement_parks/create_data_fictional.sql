delete from park;
delete from location;
delete from zone;
delete from rating;
delete from attractionzone;

-- Parks:
insert into park values (DEFAULT, 'CheeseLand', 'Cheese-themed park with rides and attractions themed after cheese and the cheesemaking process.  Fresh cheese available everywehre.', 'permanently closed');
insert into park values (DEFAULT, 'Coal Town', 'Coal-themed park with rides and attractions themed around coal and coal mining.', 'open');

-- Locations:
insert into location values (DEFAULT, 'Terra-Haute', 'Indiana', 'United States');
insert into location values (DEFAULT, 'Weston', 'West Virginia', 'United States');

-- Zones:
insert into zone values (1, 'Cheddar Palace');
insert into zone values (1, 'Curd Science Lab');
insert into zone values (1, 'Swiss Land');
insert into zone values (1, 'Dystopian Cow Processing Factory');
insert into zone values (1, 'Havarti Castle');

-- Rides:
insert into ride values(DEFAULT, 'Top Thrill Cheester', 120, "The Top Thrill Cheester is a hydraulically-launched steel roller coaster located at CheeseLand in Terra-Haute Indiana. It can accelerate from 0 to 120mph in 4 seconds.");
insert into ride values(DEFAULT, 'Millenium Churn', 93, "The Millenium Churn is a steel roller coaster located at CheeseLand in Terra-Haute Indiana. It was the world's first giga coaster.");
insert into ride values(DEFAULT, 'The Baby Swisster', 93, "The Baby Swisster is a kid friendly rollercoaster.");

-- Ride Zones:
insert into ridezone values(1, 'Cheddar Palace');
insert into ridezone values(2, 'Curd Science Lab');

-- Attractions
insert into attraction values(DEFAULT, 'The Giant Curd', 'Its just a massive cheese curd.');
insert into attraction values(DEFAULT, 'Mozerella Mosque', 'Its a mosque made of cheese.')
insert into attraction values(DEFAULT, 'The Colby Crater', 'A cheesey meteor landing zone.')

-- AttractionZone
insert into attractionzone values(1, 1);
insert into attractionzone values(2, 2);
insert into attractionzone values(3, 1);

-- Ratings
insert into rating values('baby', 'Slow and safe, suitable for young children', 4);
insert into rating values('intermediate', 'Fast, with quick turns, but no loops or extreme heights. Suitable for older children.', 10);
insert into rating values('concussion', 'The fastest speeds and highest highs. Anything is fair game. Suitable for teenagers and adults.')

-- RideRatings
insert into riderating values(1, 3);
insert into riderating values(2, 2);
insert into riderating values(3, 1);
