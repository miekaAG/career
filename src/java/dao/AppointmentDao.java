import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AppointmentDao {
    private static final String URL = "jdbc:derby://localhost:1527/Career";
    private static final String USER = "app";
    private static final String PASSWORD = "app";

    public boolean scheduleAppointment(AppointmentBean appointment) {
        String sql = "INSERT INTO APPOINTMENT (ID, NAME, DATE) VALUES (?, ?, ?)";
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, appointment.getCandidateId());
            statement.setString(2, appointment.getCandidateName());
            statement.setString(3, appointment.getAppointmentDate());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
