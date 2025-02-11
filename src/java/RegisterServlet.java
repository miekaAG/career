import bean.RegisterBean;
import dao.RegisterDao;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters from the request
        String candidateId = request.getParameter("candidateId");
        String candidateName = request.getParameter("candidateName");
        String icNumber = request.getParameter("icNumber");
        String address = request.getParameter("address");
        String dob = request.getParameter("DOB");

        // Create a RegisterBean object and populate it
        RegisterBean registerBean = new RegisterBean();
        registerBean.setCandidateId(candidateId);
        registerBean.setCandidateName(candidateName);
        registerBean.setIcNumber(icNumber);
        registerBean.setAddress(address);
        registerBean.setDOB(dob);

        // Use Registerdao to insert the data into the database
        RegisterDao registerdao = new RegisterDao();
        boolean success = false;
        try {
            success = registerdao.registerCandidate(registerBean);
            if (success) {
                response.sendRedirect(request.getContextPath() + "/information.jsp");
            } else {
                request.setAttribute("errorMessage", "Registration failed. Please try again.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception for troubleshooting
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            request.getRequestDispatcher("/register.jsp").forward(request, response);
        }
    }
}
    