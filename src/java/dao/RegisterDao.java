package dao;

import bean.RegisterBean;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class RegisterDao {
    public boolean registerCandidate(RegisterBean register) throws SQLException {
        String sql = "INSERT INTO REGISTER (ID, NAME, ICNUMBER, DOB, ADDRESS) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.createConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, register.getCandidateId());
            statement.setString(2, register.getCandidateName());
            statement.setString(3, register.getIcNumber());
            statement.setString(4, register.getDOB());
            statement.setString(5, register.getAddress());

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            throw e; // Rethrow the exception to be handled by the servlet
        }
    }
}
