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
CREATE PROCEDURE updateRide (@rideid varchar(3),
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
-- I HAVE NOT YET TESTED THIS
CREATE PROCEDURE deleteRide (@id int)
  AS
    BEGIN
      DELETE from ride, ridezone, riderating
      WHERE ride.id = @id
      AND ridezone.rideid = @id
      AND riderating.rideid = @id
    END

-- Select top speed ride at park - John

-- Select zone at a park with most baby rides - John



CREATE PROCEDURE Masterinsertupdatedelete (@id            INTEGER,
                                          @first_name    VARCHAR(10),
                                          @last_name     VARCHAR(10),
                                          @salary        DECIMAL(10, 2),
                                          @city          VARCHAR(20),
                                          @StatementType NVARCHAR(20) = '')
AS
  BEGIN
      IF @StatementType = 'Insert'
        BEGIN
            INSERT INTO employee
                        (id,
                         first_name,
                         last_name,
                         salary,
                         city)
            VALUES     ( @id,
                         @first_name,
                         @last_name,
                         @salary,
                         @city)
        END

      IF @StatementType = 'Select'
        BEGIN
            SELECT *
            FROM   employee
        END

      IF @StatementType = 'Update'
        BEGIN
            UPDATE employee
            SET    first_name = @first_name,
                   last_name = @last_name,
                   salary = @salary,
                   city = @city
            WHERE  id = @id
        END
      ELSE IF @StatementType = 'Delete'
        BEGIN
            DELETE FROM employee
            WHERE  id = @id
        END
  END