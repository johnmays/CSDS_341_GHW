package frontend;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

// Create Park
// Update Park
//      Create: id, name, description, status = {"open", "permanently closed", "temporarily closed"}

// Create zone
//      Create: parkid, zonename
//      

// Create ride
//      id, name, maxspeed, zone, description
//      need to add to ridezone as well
//          rideid, parkid, zonename
//      need to add to riderating as well
//          rideid, rating
// Update ride
// Delete ride

// Select top speed ride at park
// Select zone at a park with most baby rides

public class AmusementParkUI {

    private final String connectionUrl;

    public AmusementParkUI(String connectionUrl) {
        this.connectionUrl = connectionUrl;
    }

    // Allows the user to choose between the various use cases
    public void menu() {
        Scanner scanner = new Scanner(System.in);
        String useCaseCode;

        // Print Menu Options
        System.out.println("Choose from one of the following, then press enter.");
        
        System.out.println("\t1 - Create Park");
        System.out.println("\t2 - Update Park");

        System.out.println("\t3 - Create Zone");

        System.out.println("\t4 - Create Ride");
        System.out.println("\t5 - Update Ride");
        System.out.println("\t6 - Delete Ride");

        System.out.println("\t7 - Select top speed ride at park");
        System.out.println("\t8 - Select zone at a park with most baby rides");

        System.out.println("\tq - Quit");

        useCaseCode = scanner.nextLine().toLowerCase();

        // Activate the correct use case
        switch (useCaseCode) {
            case "1":
                createPark(scanner);
                break;
            case "2":
                updatePark(scanner);
                break;
            case "3":
                createZone(scanner);
                break;
            case "4":
                createRide(scanner);
                break;
            case "5":
                updateRide(scanner);
                break;
            case "6":
                deleteRide(scanner);
                break;
            case "7":
                selectTopSpeed(scanner);
                break;
            case "8":
                selectZone(scanner);
                break;
            case "q":
                scanner.close();
                return;
            default:
                System.out.println("Invalid input");
        }
        menu();
        scanner.close();
    }

    // Helper for createpark
    private String getParkStatus(Scanner scanner) {
        String statusCode;
        String status;

        System.out.println("Choose from one of the following statuses, then press enter.");
        System.out.println("\t1 - Open");
        System.out.println("\t2 - Temporarily Closed");
        System.out.println("\t3 - Permanently Closed");
        statusCode = scanner.nextLine();
        switch(statusCode) {
            case "1":
                status = "open";
                break;
            case "2":
                status = "temporarily closed";
                break;
            case "3":
                status = "permanently closed";
                break;
            default:
                System.out.println("Invalid input");
                status = getParkStatus(scanner);
        }
        return status;
    }

    public void createPark(Scanner scanner) {
        String name;
        String description;
        String status;

        System.out.println("Create Park:");
        System.out.println("Type the park name, then press enter.");
        name = scanner.nextLine();
        System.out.println("Type the description of the park, then press enter.");
        description = scanner.nextLine();
        status = getParkStatus(scanner);
        
    }

    public void updatePark(Scanner scanner) {

    }

    public void createZone(Scanner scanner) {

    }

    public void createRide(Scanner scanner) {

    }

    public void updateRide(Scanner scanner) {

    }

    public void deleteRide(Scanner scanner) {

    }

    public void selectTopSpeed(Scanner scanner) {

    }

    public void selectZone(Scanner scanner) {

    }

    private void EXAMPLE_DELETE_THIS_LATER() {
        Scanner scanner = new Scanner(System.in);
        String inpDeptName, inpBuilding;
        float inpBudget;

        // Coalesce variables
        System.out.println("Enter dept_name then enter. ");
        inpDeptName = scanner.nextLine();
        System.out.println("Enter building then enter.");
        inpBuilding = scanner.nextLine();
        System.out.println("Enter budget as numeric (12,2) then enter. ");
        inpBudget = scanner.nextFloat();
        scanner.close();

        System.out.println("dept_name: " + inpDeptName + "  building: "
                + inpBuilding + "   budget: " + inpBudget);

        // 4 ? because 4 parameters to stored proc needed. Index for paramters start at
        // 1.
        String callStoredProc = "{call dbo.insertDeptID(?,?,?,?)}";

        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement prepsStoredProc = connection.prepareCall(callStoredProc);) {
            // 4 parameters to stored proc start with a parameter index of 1
            prepsStoredProc.setString(1, inpDeptName);
            prepsStoredProc.setString(2, inpBuilding);
            prepsStoredProc.setFloat(3, inpBudget);
            // the 4th parameter is an output parameter
            prepsStoredProc.registerOutParameter(4, java.sql.Types.INTEGER);
            prepsStoredProc.execute();

            System.out.println("Generated Identity: " + prepsStoredProc.getInt(4));
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public static void main(String[] args) {
        String connectionUrl = "jdbc:sqlserver://localhost;"
                + "database=university;"
                + "user=dbuser;"
                + "password=scsd431134dscs;"
                + "encrypt=true;"
                + "trustServerCertificate=true;"
                + "loginTimeout=30;";

        AmusementParkUI ui = new AmusementParkUI(connectionUrl);
        ui.menu();
    }
}
