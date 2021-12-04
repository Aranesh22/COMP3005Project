import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class App {
    public static void main(String[] args) throws Exception {
        // https://docs.oracle.com/javase/8/docs/api/java/sql/package-summary.html#package.description
        // auto java.sql.Driver discovery -- no longer need to load a java.sql.Driver class via Class.forName

        // register JDBC driver, optional, since java 1.6
        /*try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }*/
		
        // auto close connection
        try (Connection conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5000/Look_Inna_Book", "postgres", "Rishie2001!")) {

            if (conn != null) {
                System.out.println("Connected to the database!");
            } else {
                System.out.println("Failed to make connection!");
            }
            
            Statement stmt = conn.createStatement();
            ResultSet rset = stmt.executeQuery(
                "select * " +
                "from student;");
            while (rset.next()) {
                for (int i = 1; i < 5; ++i) {
                    System.out.print(rset.getString(i));
                    System.out.print(" ");
                }
                System.out.println("");
            }
            
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}