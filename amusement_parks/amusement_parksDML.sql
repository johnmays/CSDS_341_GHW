-- Create Park - Tyler

-- Update Park - Jack
CREATE PROCEDURE updatePark (@id varchar(3),
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

-- Create ride - Phineas

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