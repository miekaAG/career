<%@ page import="java.sql.*" %>
<%
    String appointmentId = request.getParameter("candidate_id");
    String candidateName = request.getParameter("candidate_name");
    String appointmentDate = request.getParameter("appointment_date");

    Connection conn = null;
    PreparedStatement pstmt = null;
    String dbURL = "jdbc:derby://localhost:1527/Career";
    String user = "app";
    String password = "app";

    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        conn = DriverManager.getConnection(dbURL, user, password);
        String sql = "UPDATE APPOINTMENT SET NAME = ?, DATE = ? WHERE ID = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, candidateName);
        pstmt.setString(2, appointmentDate);
        pstmt.setString(3, appointmentId);
        int rowsUpdated = pstmt.executeUpdate();

        if (rowsUpdated > 0) {
            out.println("<script>alert('Appointment updated successfully!'); window.location='appointmentList.jsp';</script>");
        } else {
            out.println("<script>alert('Update failed. Please try again.'); window.history.back();</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    }
%>
