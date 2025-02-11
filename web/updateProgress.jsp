<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String qualification = request.getParameter("qualification");
    String progress = request.getParameter("progress");
    String notes = request.getParameter("notes");
    
    String jdbcURL = "jdbc:derby://localhost:1527/Career";
    String jdbcUsername = "app";
    String jdbcPassword = "app";
    
    String updateSQL = "UPDATE PROGRESS SET NAME=?, QUALIFICATION=?, PROGRESS=?, NOTES=? WHERE ID=?";
    
    try {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        PreparedStatement statement = connection.prepareStatement(updateSQL);
        statement.setString(1, name);
        statement.setString(2, qualification);
        statement.setString(3, progress);
        statement.setString(4, notes);
        statement.setString(5, id);
        
        int rowsUpdated = statement.executeUpdate();
        statement.close();
        connection.close();
        
        if (rowsUpdated > 0) {
            response.sendRedirect("progressRecord.jsp");
        } else {
            out.println("<p>Error updating record.</p>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
