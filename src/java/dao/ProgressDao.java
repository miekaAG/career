import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProgressDao {
    private String jdbcURL = "jdbc:derby://localhost:1527/Career";
    private String jdbcUsername = "app";
    private String jdbcPassword = "app";

    private static final String INSERT_PROGRESS_SQL = "INSERT INTO PROGRESS (ID, NAME, QUALIFICATION, PROGRESS, NOTES) VALUES (?, ?, ?, ?, ?)";
    private static final String UPDATE_PROGRESS_SQL = "UPDATE PROGRESS SET NAME = ?, QUALIFICATION = ?, PROGRESS = ?, NOTES = ? WHERE ID = ?";
    private static final String CHECK_CANDIDATE_SQL = "SELECT COUNT(*) FROM PROGRESS WHERE ID = ?";

    public boolean isCandidateIdExists(int id) throws SQLException {
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(CHECK_CANDIDATE_SQL)) {
            preparedStatement.setInt(1, id);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    return resultSet.getInt(1) > 0;
                }
            }
        } catch (SQLException e) {
            throw new SQLException("Error while checking candidate ID", e);
        }
        return false;
    }

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

    public void updateProgress(ProgressBean progress) throws SQLException {
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_PROGRESS_SQL)) {
            preparedStatement.setString(1, progress.getName());
            preparedStatement.setString(2, progress.getQualification());
            preparedStatement.setString(3, progress.getProgress());
            preparedStatement.setString(4, progress.getNotes());
            preparedStatement.setInt(5, progress.getId());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            throw new SQLException("Error while updating progress data", e);
        }
    }
}
