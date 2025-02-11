import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private PreparedStatement pstmt;

    public void init() throws ServletException {
        initializeJdbc();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("Type"); // Getting the selected type (User/Admin)

        try {
            if (username == null || username.isEmpty() || password == null || password.isEmpty()) {
                out.println("<html><body>");
                out.println("<script>");
                out.println("alert('Username and password are required.');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
                out.println("</body></html>");
                return;
            }

            if (validateLogin(username, password)) {
                // Create a session
                HttpSession session = request.getSession();
                session.setAttribute("user", username);

                // Redirect based on user type
                if ("User".equalsIgnoreCase(userType)) {
                    response.sendRedirect("Userprofile.jsp");  // Redirect Users to UserProfile.jsp
                } else if ("Admin".equalsIgnoreCase(userType)) {
                    response.sendRedirect("link.jsp");  // Redirect Admins to link.jsp
                } else {
                    out.println("<html><body>");
                    out.println("<script>");
                    out.println("alert('Invalid user type selected.');");
                    out.println("window.location.href='login.jsp';");
                    out.println("</script>");
                    out.println("</body></html>");
                }
            } else {
                out.println("<html><body>");
                out.println("<script>");
                out.println("alert('Invalid username or password. Please try again.');");
                out.println("window.location.href='login.jsp';");
                out.println("</script>");
                out.println("</body></html>");
            }
        } catch (Exception ex) {
            out.println("Error: " + ex.getMessage());
        } finally {
            out.close();
        }
    }

    private void initializeJdbc() {
        try {
            // Declare driver and connection string
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Career;create=true;user=app;password=app";

            // Load the driver
            Class.forName(driver);

            // Connect to the database
            Connection conn = DriverManager.getConnection(connectionString);

            // Create a PreparedStatement
            pstmt = conn.prepareStatement("SELECT username, password FROM LOGIN WHERE username = ? AND password = ?");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private boolean validateLogin(String username, String password) throws SQLException {
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();

        return rs.next();
    }
}

}
