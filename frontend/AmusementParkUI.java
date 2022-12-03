package frontend;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Scanner;

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

        System.out.println("\tQ - Quit");

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
    private String getParkStatus(Scanner scanner, String message) {
        String statusCode;
        String status;

        System.out.println(message);
        System.out.println("\t1 - Open");
        System.out.println("\t2 - Temporarily Closed");
        System.out.println("\t3 - Permanently Closed");
        statusCode = scanner.nextLine();
        switch (statusCode) {
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
                status = getParkStatus(scanner, message);
        }
        return status;
    }

    public void createPark(Scanner scanner) {
        String name;
        String status;
        String description;

        System.out.println("Create Park:");
        System.out.println("Type the park name, then press enter.");
        name = scanner.nextLine();
        status = getParkStatus(scanner, "Choose from one of the following statuses, then press enter.");
        System.out.println("Type the description of the park, then press enter.");
        description = scanner.nextLine();

        System.out.printf("Name: %s\nStatus: %s\nDescription: %s\n", name, status, description);

        // CALL PROCEDURE
        String callProcedure = "{call dbo.createPark(?,?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {

            // set the name, description, and status
            procedure.setString(2, name);
            procedure.setString(3, description);
            procedure.setString(4, status);
            // The ID is generated by SQL, so we make it an output parameter
            procedure.registerOutParameter(1, java.sql.Types.INTEGER);
            procedure.execute();

            System.out.println("Successfully generated park with ID = " + procedure.getInt(1));
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("Failed to generate park!");
        }
    }

    public void updatePark(Scanner scanner) {
        int id;
        String name;
        String status;
        String description;

        System.out.println("Update Park:");
        id = scanInt(scanner, "Type the integer id of the park you want to update, then press enter.");
        System.out.println("Type the new park name, then press enter.");
        name = scanner.nextLine();
        status = getParkStatus(scanner, "Choose the new status from one of the following statuses, then press enter.");
        System.out.println("Type the new description of the park, then press enter.");
        description = scanner.nextLine();

        System.out.printf("ID: %d\nName: %s\nStatus: %s\nDescription: %s\n", id, name, status, description);

        // CALL PROCEDURE
        String callProcedure = "{call dbo.updatePark(?,?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setInt(1, id);
            procedure.setString(2, name);
            procedure.setString(3, description);
            procedure.setString(4, status);
            procedure.execute();

            System.out.println("Successfully updated park with ID = " + id);
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Helper to get an integer from input -- tries again if no valid result
    private int scanInt(Scanner scanner, String message) {
        String value;
        System.out.println(message);
        value = scanner.nextLine();
        try {
            return Integer.valueOf(value);
        } catch (NumberFormatException e) {
            System.out.println("Invalid input, integer required.");
            return scanInt(scanner, message);
        }
    }

    public void createZone(Scanner scanner) {
        int parkId;
        String name;

        System.out.println("Create Zone:");
        parkId = scanInt(scanner, "Type the Park's ID, then press enter.");
        System.out.println("Type the zone name, then press enter.");
        name = scanner.nextLine();

        System.out.printf("Park ID: %d\nName: %s\n", parkId, name);

        // CALL PROCEDURE
        String callProcedure = "{call dbo.createZone(?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {

            procedure.setInt(1, parkId);
            procedure.setString(2, name);
            procedure.execute();

            System.out.println("Successfully generated zone with primary key (" + parkId + ", " + name + ")");
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("Failed to create zone!");

        }
    }

    // Helper for createpark
    private String getRating(Scanner scanner, String message) {
        String ratingCode;
        String rating;

        System.out.println(message);
        System.out.println("\t1 - Baby");
        System.out.println("\t2 - Intermediate");
        System.out.println("\t3 - Concussion");
        ratingCode = scanner.nextLine();
        switch (ratingCode) {
            case "1":
                rating = "baby";
                break;
            case "2":
                rating = "intermediate";
                break;
            case "3":
                rating = "concussion";
                break;
            default:
                System.out.println("Invalid input");
                rating = getRating(scanner, message);
        }
        return rating;
    }

    public void createRide(Scanner scanner) {
        String name;
        int maxspeed;
        String description;
        int parkId;
        String zonename;
        String rating;

        System.out.println("Create Ride:");
        System.out.println("Type the ride name then press enter.");
        name = scanner.nextLine();
        maxspeed = scanInt(scanner, "Type the integer max speed, then press enter.");
        System.out.println("Type the ride description, then press enter");
        description = scanner.nextLine();
        rating = getRating(scanner, "Select the ride rating from one of the following, then press enter.");
        parkId = scanInt(scanner, "Type the Park's ID, then press enter.");
        System.out.println("Type the zone name where the ride is located, then press enter.");
        zonename = scanner.nextLine();

        System.out.printf("Name: %s\nMax Speed: %d\nDescription: %s\nRating: %s\nPark ID: %d\nZone Name: %s\n", name,
                maxspeed, description, rating, parkId, zonename);

        // CALL PROCEDURE
        String callProcedure = "{call dbo.createRide(?,?,?,?,?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setString(2, name);
            procedure.setInt(3, maxspeed);
            procedure.setString(4, description);
            procedure.setInt(5, parkId);
            procedure.setString(6, zonename);
            procedure.setString(7, rating);
            procedure.registerOutParameter(1, java.sql.Types.INTEGER);
            procedure.execute();

            System.out.println("Successfully generated ride with ID = " + procedure.getInt(1));
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("Failed to create ride!");
        }
    }

    public void updateRide(Scanner scanner) {
        int id;
        String name;
        int maxspeed;
        String description;

        System.out.println("Update Ride:");
        id = scanInt(scanner, "Type the id of the ride you would like to update, then press enter.");
        System.out.println("Type the updated ride name, then press enter.");
        name = scanner.nextLine();
        maxspeed = scanInt(scanner, "Type the updated max speed integer of the ride, then press enter.");
        System.out.println("Type the updated description of the ride, then press enter.");
        description = scanner.nextLine();

        System.out.printf("Name: %s\nMax Speed: %d\nDescription: %s\n", name, maxspeed, description);

        String callProcedure = "{call dbo.updateRide(?,?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setInt(1, id);
            procedure.setString(2, name);
            procedure.setInt(3, maxspeed);
            procedure.setString(4, description);
            procedure.execute();

            System.out.println("Successfully updated ride with ID = " + id);
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("Failed to update ride!");
        }
    }

    public void deleteRide(Scanner scanner) {
        System.out.println("Delete Ride:");
        int id = scanInt(scanner, "Type the ID of the ride being deleted, then press enter.");

        // CALL PROCEDURE
        String callProcedure = "{call dbo.deleteRide(?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setInt(1, id);
            procedure.execute();

            System.out.println("Successfully deleted ride with ID = " + id);
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            System.out.println("Failed to delete ride!");
        }

    }

    // TODO: this is unverified
    public void selectTopSpeed(Scanner scanner) {
        System.out.println("Top Speed Ride at Park:");
        int parkid = scanInt(scanner, "Type the park id of the park you would like to search in, then press enter.");

        String callProcedure = "{call dbo.selectFastestRide(?,?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setInt(1, parkid);
            procedure.registerOutParameter(2, java.sql.Types.INTEGER);  // the id of the ride
            procedure.registerOutParameter(3, java.sql.Types.VARCHAR);  // the name of the ride
            procedure.registerOutParameter(4, java.sql.Types.INTEGER);  // the speed of the ride
            // whatever other parameters
            procedure.execute();

            int id = procedure.getInt(2);
            String name = procedure.getString(3);
            int speed = procedure.getInt(4);

            System.out.printf("\tFastest ride =\n\t\tRideID:\t%d\n\t\tName:\t%s\n\t\tSpeed:\t%d\n", id, name, speed);
        }
        // Handle any errors that may have occurred.
        catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void selectZone(Scanner scanner) {
        int parkId;
        String rating;

        System.out.println("Zone at Park with most rides of a rating:");
        parkId = scanInt(scanner, "Type the park id of the park you would like to search in, then press enter.");
        rating = getRating(scanner, "Select the rating type you would like to search for, then press enter.");

        String callProcedure = "{call dbo.selectZoneWithRating(?,?,?)}";
        try (Connection connection = DriverManager.getConnection(connectionUrl);
                CallableStatement procedure = connection.prepareCall(callProcedure);) {
            procedure.setInt(1, parkId);
            procedure.setString(2, rating);
            procedure.registerOutParameter(3, java.sql.Types.VARCHAR);  // the name of the zones
            procedure.execute();

            String name = procedure.getString(3);

            System.out.printf("\tZone =\n\t\tName:\t%s\n", name);
        }
        // Handle any errors that may have occurred.
        catch (Exception e) {
            System.out.println("Failed to Execute Query!");
        }
    }

    // Connect to your database.
    // Replace server name, username, and password with your credentials
    public static void main(String[] args) {
        String connectionUrl = "jdbc:sqlserver://localhost;"
                + "database=themeparks;"
                + "user=dbuser;"
                + "password=scsd431134dscs;"
                + "encrypt=true;"
                + "trustServerCertificate=true;"
                + "loginTimeout=30;";

        AmusementParkUI ui = new AmusementParkUI(connectionUrl);
        ui.menu();
    }
}
