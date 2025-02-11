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

    public void init() throws ServletException {
        initializeJdbc();
    }

public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();

    // Get form data
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmPassword");
    String userType = request.getParameter("userType");

    try {
        // Validate required fields
        if (username.isEmpty() || email.isEmpty() || phone.isEmpty() || password.isEmpty() || confirmPassword.isEmpty() || userType.isEmpty()) {
            sendAlert(out, "All fields are required.", "signup.jsp");
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            sendAlert(out, "Passwords do not match.", "signup.jsp");
            return;
        }

        // Store user in the database
        storeSignUp(username, email, phone, password, userType);

        // Store email and phone in session
        HttpSession session = request.getSession();
        session.setAttribute("userEmail", email);
        session.setAttribute("userPhone", phone);

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

            pstmt = conn.prepareStatement("INSERT INTO LOGIN (username, email, phone, password, userType) VALUES (?, ?, ?, ?, ?)");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private void storeSignUp(String username, String email, String phone, String password, String userType) throws SQLException {
        pstmt.setString(1, username);
        pstmt.setString(2, email);
        pstmt.setString(3, phone);
        pstmt.setString(4, password);
        pstmt.setString(5, userType);
        pstmt.executeUpdate();
    }

    private void sendAlert(PrintWriter out, String message, String redirectPage) {
        out.println("<html><body>");
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href='" + redirectPage + "';");
        out.println("</script>");
        out.println("</body></html>");
    }

    public void destroy() {
        try {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
