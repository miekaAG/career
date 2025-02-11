import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ProgressDao {
    private String jdbcURL = "jdbc:derby://localhost:1527/Career";
    private String jdbcUsername = "app";
    private String jdbcPassword = "app";

    private static final String INSERT_PROGRESS_SQL = "INSERT INTO PROGRESS (ID, NAME, QUALIFICATION, PROGRESS, NOTES) VALUES (?, ?, ?, ?, ?)";

    public void addProgress(ProgressBean progress) throws SQLException {
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PROGRESS_SQL)) {
            preparedStatement.setInt(1, progress.getId());
            preparedStatement.setString(2, progress.getName());
            preparedStatement.setString(3, progress.getQualification());
            preparedStatement.setString(4, progress.getProgress());
            preparedStatement.setString(5, progress.getNotes());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error while inserting progress data", e);
        }
    }
}
