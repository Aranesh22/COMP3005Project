import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Scanner;

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
                "jdbc:postgresql://localhost:5000/postgres", "postgres", "Rishie2001!")) {

            if (conn != null) {
                System.out.println("Connected to the database!");
            } else {
                System.out.println("Failed to make connection!");
            }
            
            Scanner scanner = new Scanner(System.in);
            String owner_1 = "Rishie"; //password kugathasan
            String owner_2 = "Aranesh"; //password aathavan
            System.out.println("Existing user (1) or new user (2) or owner (3)");
            int num_users = 10004;
            int num_books = 10004;

            String answer_1 = scanner.nextLine();
            if (answer_1.equals("1")) {
                System.out.println("Please enter your username and password.");
                String userName = scanner.nextLine();
                String passWord = scanner.nextLine();
                
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(
                "select * " +
                "from main_user;");
                int made_it = -1;
                while (rset.next()) {
                    for (int i = 1; i < 6; ++i) {
                        if (rset.getString(i).equals(userName)) {
                            System.out.println("Welcome to the bookstore!");
                            made_it = 1;
                            break;
                        }
                    }
                }
                if (made_it < 0) {System.out.println("You are not in the database please choose sign up next time."); System.exit(0);}
            }else if (answer_1.equals("2")) {
                System.out.println("Please enter your new username.");
                String newUsername = scanner.nextLine();
                System.out.println("Please enter your billing street name.");
                String b_street_name = scanner.nextLine();
                System.out.println("Please enter your billing postal code.");
                String b_postal_code = scanner.nextLine();
                System.out.println("Please enter your billing province.");
                String b_province = scanner.nextLine();
                System.out.println("Please enter your billing country.");
                String b_country = scanner.nextLine();
                System.out.println("Please enter your street name.");
                String street_name = scanner.nextLine();
                System.out.println("Please enter your postal code.");
                String postal_code = scanner.nextLine();
                System.out.println("Please enter your province.");
                String province = scanner.nextLine();
                System.out.println("Please enter your country.");
                String country = scanner.nextLine();

                Statement stmt_user = conn.createStatement();
                num_users += 1;

                //String query = "\"insert into main_user values('" + num_users + "', '" + newUsername + "', '" + b_street_name + "', '" + b_postal_code + "', '" + b_province + "', '" + b_country + "', '" + street_name + "', '" + postal_code + "', '" + province + "', '" + country + "')\"";
                
                try { 
                    stmt_user.executeUpdate("insert into main_user values('" + num_users + "', '" + newUsername + "', '" + b_street_name + "', '" + b_postal_code + "', '" + b_province + "', '" + b_country + "', '" + street_name + "', '" + postal_code + "', '" + province + "', '" + country + "')");
                    System.exit(0);
                }catch (SQLException sqle) {
                    System.out.println("Couldn't insert new user, please try again.");
                    System.exit(0);
                }
            }else if (answer_1.equals("3")) {
                System.out.println("Please enter your username and password.");
                String owner_userName = scanner.nextLine();
                String owner_passWord = scanner.nextLine();

                if (!(owner_passWord.equals("aathavan")) && !(owner_passWord.equals("kugathasan"))) {
                    System.out.println("Incorrect password, please try again.");
                    System.exit(0);
                }
                
                Statement stmt = conn.createStatement();
                ResultSet rset = stmt.executeQuery(
                "select * " +
                "from main_user;");
                int made_it = -1;
                while (rset.next()) {
                    for (int i = 1; i < 6; ++i) {
                        if (rset.getString(i).equals(owner_userName)) {
                            System.out.println("Welcome to the bookstore!");
                            made_it = 1;
                            break;
                        }
                    }
                }
                if (made_it < 0) {System.out.println("You are not in the database please choose sign up next time."); System.exit(0);}
                
                while(true) {
                    System.out.println("Would you like to add books (1) or remove books (2) or leave (3), please enter the corresponding number.");
                    String response = scanner.nextLine();

                    if (response.equals("1")) {
                        System.out.println("Please enter the values for the book.");
                        num_books += 1;

                        //Yes we're assuming the owner knows what publisher and author to input
                        //Remember when creating, the price must be in the format xx.xx
                        String id = Integer.toString(num_books);
                        System.out.println("Please enter the publisher ID for the new book.");
                        String publisher_id = scanner.nextLine();
                        System.out.println("Please enter the author ID for the new book.");
                        String author_id = scanner.nextLine();
                        System.out.println("Please enter the book name for the new book.");
                        String book_name = scanner.nextLine();
                        System.out.println("Please enter the genre for the new book.");
                        String genre = scanner.nextLine();
                        System.out.println("Please enter the number of pages for the new book.");
                        String num_pages = scanner.nextLine();
                        System.out.println("Please enter the price for the new book.");
                        String price = scanner.nextLine();

                        Statement stmt_book = conn.createStatement();
                        String check = "insert into book values('" + id + "', '" + publisher_id + "', '" + author_id + "', '" + book_name + "', '" + genre + "', " + num_pages + ", " + price + ")";
                        System.out.println(check);

                        try { 
                            stmt_book.executeUpdate("insert into book values('" + id + "', '" + publisher_id + "', '" + author_id + "', '" + book_name + "', '" + genre + "', " + num_pages + ", " + price + ")");
                            continue;

                        }catch (SQLException sqle) {
                            System.out.println("Couldn't insert new book, please try again.");
                            System.exit(0);
                        }


                    }else if (response.equals("2")) {
                        System.out.println("Please enter the ID of the book to remove.");
                        String remove_id = scanner.nextLine();

                        Statement stmt_remove = conn.createStatement();
                        ResultSet rset_remove = stmt.executeQuery(
                        "select ID " +
                        "from book " +
                        "where ID ='" + remove_id+"'");

                        if (rset_remove.next()) {
                            try { 
                                String query = "delete from book where id='" + rset_remove.getString(1) + "'";
                                stmt_remove.executeUpdate(query);
                                continue;
    
                            }catch (SQLException sqle) {
                                System.out.println("Couldn't delete book, please try again.");
                                System.exit(0);
                            }
                        }else {
                            System.out.println("ID not found, please try again.");
                        }
                        

                    }else if (response.equals("3")) {
                        System.out.println("Thank you owner, see you next time.");
                        break;
                    }

                }
                
                //System.exit(0);
            }
            
            float user_cost = 0.0f;
            while (true) {
                System.out.println("Would you like to view books (1) or leave (0), please enter the corresponding number.");
                String response = scanner.nextLine();

                if (response.equals("1")) {
                    System.out.println("Here are your options: ");

                    Statement stmt = conn.createStatement();
                    ResultSet rset = stmt.executeQuery(
                        "select * " +
                        "from book;");
                    while (rset.next()) {
                        for (int i = 1; i < 8; ++i) {
                            System.out.print(rset.getString(i));
                            System.out.print(" ");
                        }
                        System.out.println("");
                    }

                    System.out.println("Enter the ID of the book you want to purchase.");
                    String bookID = scanner.nextLine();
                    ResultSet rset_2 = stmt.executeQuery(
                        "select price " +
                        "from book " +
                        "where ID='" + bookID +"'");
                    
                    if (rset_2.next()) {
                        float newOne = Float.parseFloat(rset_2.getString(1));
                        user_cost += newOne;
                        System.out.println("Your new cost is $" + user_cost);
                    }else {
                        System.out.println("ID not found, please try again.");
                    }

                }else if (response.equals("0")) {
                    System.out.println("Thank you, your total cost is $" + user_cost +  ". Please come again.");
                    
                    break;
                }else {
                    System.out.println("Please enter a proper value. \n\n\n");
                }
            }
            

            
        } catch (SQLException e) {
            System.err.format("SQL State: %s\n%s", e.getSQLState(), e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}