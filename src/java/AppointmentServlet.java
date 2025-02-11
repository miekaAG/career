import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String candidateId = request.getParameter("candidate_id");
        String candidateName = request.getParameter("candidate_name");
        String appointmentDate = request.getParameter("appointment_date");

        AppointmentBean appointment = new AppointmentBean();
        appointment.setCandidateId(candidateId);
        appointment.setCandidateName(candidateName);
        appointment.setAppointmentDate(appointmentDate);

        AppointmentDao dao = new AppointmentDao();
        boolean isScheduled = dao.scheduleAppointment(appointment);

        response.sendRedirect("appointmentList.jsp?status=" + (isScheduled ? "success" : "error"));
    }
}
