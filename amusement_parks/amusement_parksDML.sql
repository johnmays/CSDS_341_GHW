-- find all parks in a country.
CREATE PROCEDURE findAllParksInCountry @Country varchar(128)
AS
SELECT park.name FROM park, location WHERE country = @Country
GO;
>>>>>>> Stashed changes

-- find all rides in a specific park
CREATE PROCEDURE findAllRidesInPark @Park varchar(128)
AS
SELECT * FROM ride WHERE park.name = @Park
GO;

-- find all rides in a specific zone
CREATE PROCEDURE findAllRidesInZone @Park varchar(3), @Zone varchar(128)
AS
SELECT ride.name FROM ridezone, ride, park WHERE park.name = @Park AND ridezone.zonename = @Zone
GO;

-- add ride to park
