-- Create Park - Tyler

-- Update Park - Jack

-- Create zone - Tyler

-- Create ride - Phineas

-- Update ride - Jack

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