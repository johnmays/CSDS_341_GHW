// Example of preparing a SQL statement within code to run
// Make certain to always prepare any parameters input by users of the app;
// see prepInsert object.
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner; 
import java.sql.SQLException;

public class SQLInsertRowUserInput {

    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public static void main(String[] args) {
        String connectionUrl = 
        "jdbc:sqlserver://localhost;"
                + "database=university;"
                + "user=dbuser;" //May need to change this for your database user; if using "sa" for example
                + "password=CHANGE-TO-YOUR-PASSWORD-FOR-USER-dbuser;"
                + "encrypt=true;"
                + "trustServerCertificate=true;"
                + "loginTimeout=30;";
        Scanner myObj = new Scanner(System.in);
        String inpDeptName, inpBuilding;
        float inpBudget;

        // Enter username and press Enter
       System.out.println("Enter dept_name then enter. "); 
       inpDeptName = myObj.nextLine();   
       System.out.println("Enter Building then enter.");
       inpBuilding = myObj.nextLine();
       System.out.println("Enter budget max of 12 digits with the last two following the decimal point then hit enter. "); 
       inpBudget = myObj.nextFloat();
       
       myObj.close();

       System.out.println("Dept: " + inpDeptName + "  Building: " 
             + inpBuilding + "   Budget: " + inpBudget);
       String insertSql = "INSERT INTO department (dept_name, building, budget) " +
              " values (?, ?, ?); " ;
       ResultSet resultSet = null;
       try (Connection connection = DriverManager.getConnection(connectionUrl);
                PreparedStatement prepsInsert = 
                      connection.prepareStatement(insertSql, Statement.RETURN_GENERATED_KEYS);) {
            prepsInsert.setString(1, inpDeptName);
            prepsInsert.setString(2, inpBuilding);
            prepsInsert.setFloat(3,inpBudget);
            prepsInsert.execute();
            // Retrieve the generated key from the insert. None in this example.
            resultSet = prepsInsert.getGeneratedKeys();
            // Print the ID of the inserted row. Again, will be null because no keys auto gen
            while (resultSet.next()) {
                System.out.println("Generated: " + resultSet.getString(1));
            }
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
}
