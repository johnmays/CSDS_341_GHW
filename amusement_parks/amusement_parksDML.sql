-- Create Park - Tyler
CREATE PROCEDURE createPark (@id int output,
                             @name varchar(128),
                             @description varchar(512),
                             @status varchar(32))
  AS
    BEGIN
      INSERT  into park(name, description, status) values (@name, @description, @status);
    SELECT @id = SCOPE_IDENTITY();
    END

-- Update Park - Jack
CREATE PROCEDURE updatePark (@id int,
                             @name varchar(128),
                             @description varchar(512),
                             @status varchar(32))
  AS
    BEGIN
      UPDATE park
      SET name = IsNull(@name, name),
          description = IsNull(@description, description),
          status = IsNull(@status, status)
      WHERE id = @id
    END

-- Create zone - Tyler
CREATE PROCEDURE createZone (@parkid int,
                             @zonename varchar(128))
  AS
    BEGIN
      INSERT  into zone(parkid, zonename) values (@parkid, @zonename);
    END

-- Create ride - Phineas
CREATE PROCEDURE createRide (@id int output,
                             @name varchar(128),
                             @maxspeed int,
                             @description varchar(512),
                             @parkid int,
                             @zonename varchar(128),
                             @rating varchar(16))
  AS
    BEGIN
      INSERT into ride(name, maxspeed, description) values (@name, @maxspeed, @description);
      SELECT @id = SCOPE_IDENTITY();
      INSERT into ridezone(rideid, parkid, zonename) values (@id, @parkid, @zonename);
      INSERT into riderating(rideid, rating) values (@id, @rating);
    END

-- Update ride - Jack
CREATE PROCEDURE updateRide (@rideid int,
                             @name varchar(128),
	                           @maxspeed int,
	                           @description varchar(512))
  AS
    BEGIN
      UPDATE ride
      SET name = IsNull(@name, name),
          maxspeed = IsNull(@maxspeed, maxspeed),
          description = IsNull(@description, description)
      WHERE rideid = @rideid
    END

-- Delete ride - Phineas
CREATE PROCEDURE deleteRide (@id int)
  AS
    BEGIN
      DELETE from ridezone WHERE rideid = @id
      DELETE from riderating WHERE rideid = @id
      DELETE from ride WHERE rideid = @id
    END

-- Select top speed ride at park - John
CREATE PROCEDURE selectFastestRide (@name varchar(128))
  AS
    BEGIN
      SELECT ride.name, ride.maxspeed from ride WHERE ride.maxspeed = (
        SELECT MAX(maxspeed) from ride, ridezone, park WHERE ride.rideid = ridezone.rideid AND ridezone.parkid = park.id AND park.name = @name
        )
    END

-- Select zone at a park with most rides of a selected rating - John
CREATE PROCEDURE selectZoneWithRating (@parkid int,
                                       @rating varchar(16))
  AS
    BEGIN
     SELECT a.zonename, MAX(a.numrating) as maximum from (SELECT COUNT(*) AS numrating, ridezone.zonename as zonename from ride, riderating, ridezone WHERE ride.rideid = riderating.rideid AND ride.rideid = ridezone.rideid AND riderating.rating = @rating and ridezone.parkid = @parkid GROUP BY ridezone.zonename) a GROUP BY a.zonename
    END