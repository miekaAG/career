import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.*;

public class SignupServlet extends HttpServlet {

    private PreparedStatement pstmt;
    private Connection conn;

    @Override
    public void init() throws ServletException {
        initializeJdbc();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        try {
            // Validate required fields
            if (username == null || username.isEmpty() || email == null || email.isEmpty()
                    || password == null || password.isEmpty() || confirmPassword == null || confirmPassword.isEmpty()) {
                sendAlert(out, "All fields are required.", "signup.jsp");
                return;
            }

            // Check if passwords match
            if (!password.equals(confirmPassword)) {
                sendAlert(out, "Passwords do not match.", "signup.jsp");
                return;
            }

            // Check if user already exists
            if (isUserExists(email)) {
                sendAlert(out, "User with this email already exists.", "signup.jsp");
                return;
            }

            // Store user in the database
            storeSignUp(username, email, password);

            // Store email in session
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", email);

            sendAlert(out, "Sign Up Successful! Redirecting...", "link.jsp");

        } catch (Exception ex) {
            out.println("<html><body><p style='color:red;'>Error: " + ex.getMessage() + "</p></body></html>");
            ex.printStackTrace();
        } finally {
            out.close();
        }
    }

    private void initializeJdbc() {
        try {
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Career;create=true;user=app;password=app";

            Class.forName(driver);
            conn = DriverManager.getConnection(connectionString);

            pstmt = conn.prepareStatement("INSERT INTO LOGIN (username, email, password) VALUES (?, ?, ?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void storeSignUp(String username, String email, String password) throws SQLException {
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, password);
        pstmt.executeUpdate();
    }

    private boolean isUserExists(String email) throws SQLException {
        String query = "SELECT COUNT(*) FROM LOGIN WHERE email = ?";
        try (PreparedStatement checkStmt = conn.prepareStatement(query)) {
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0; // Returns true if a user with the email exists
            }
        }
        return false;
    }

    private void sendAlert(PrintWriter out, String message, String redirectPage) {
        out.println("<html><body>");
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href='" + redirectPage + "';");
        out.println("</script>");
        out.println("</body></html>");
    }

    @Override
    public void destroy() {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
