<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");

    if (id != null && !id.isEmpty()) {
        String jdbcURL = "jdbc:derby://localhost:1527/Career";
        String jdbcUsername = "app";
        String jdbcPassword = "app";

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String deleteSQL = "DELETE FROM PROGRESS WHERE ID = ?";
            PreparedStatement preparedStatement = connection.prepareStatement(deleteSQL);
            preparedStatement.setString(1, id);
            int rowsAffected = preparedStatement.executeUpdate();

            preparedStatement.close();
            connection.close();

            if (rowsAffected > 0) {
                response.sendRedirect("progressRecord.jsp");
            } else {
                out.println("<script>alert('Error: No record found to delete.'); window.location.href='progressRecord.jsp';</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert('Database error: " + e.getMessage() + "'); window.location.href='progressRecord.jsp';</script>");
        }
    } else {
        out.println("<script>alert('Invalid ID'); window.location.href='progressRecord.jsp';</script>");
    }
%>
