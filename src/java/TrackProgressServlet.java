import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

@WebServlet("/TrackProgressServlet")
public class TrackProgressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String qualification = request.getParameter("qualification");
            String progress = request.getParameter("progress");
            String notes = request.getParameter("notes");

            ProgressDao progressDao = new ProgressDao();
            ProgressBean progressBean = new ProgressBean();
            progressBean.setId(id);
            progressBean.setName(name);
            progressBean.setQualification(qualification);
            progressBean.setProgress(progress);
            progressBean.setNotes(notes);

            // Check if candidate ID already exists
            if (progressDao.isCandidateIdExists(id)) {
                // Update existing record
                progressDao.updateProgress(progressBean);
                response.sendRedirect("progressRecord.jsp?status=updated");
            } else {
                // Insert new record
                progressDao.addProgress(progressBean);
                response.sendRedirect("progressRecord.jsp?status=success");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?status=invalid_id");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?status=sql_error");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?status=unknown_error");
        }
    }
}
