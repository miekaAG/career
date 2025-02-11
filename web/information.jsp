<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Candidate Information</title>
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f8f9fa;
            color: #333;
        }
        /* Header */
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .header h1 {
            font-size: 24px;
        }
        /* Sidebar */
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px 10px;
        }
        .sidebar h2 {
            font-size: 20px;
            text-align: center;
            margin-bottom: 20px;
        }
        .sidebar a {
            display: flex;
            align-items: center;
            text-decoration: none;
            color: white;
            padding: 10px;
            margin-bottom: 10px;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }
        .sidebar a:hover {
            background-color: #495057;
            transform: scale(1.05);
        }
        /* Main Content */
        .layout {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: center;
            max-width: 1000px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            margin: auto;
            padding: 30px;
        }
        /* Profile Card */
        .profile-card {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .profile-card h2 {
            color: #333;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f8f9fa;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .layout {
                flex-direction: column;
            }
            .sidebar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Candidate Information</h1>
    </div>
    <div class="sidebar">
        <h2>Menu</h2>
        <a href="register.jsp">Candidate Registration</a>
        <a href="information.jsp">Candidate Information</a>
        <a href="progress.jsp">Candidate Progress</a>
        <a href="progressRecord.jsp">Progress Record</a>
        <a href="appointment.jsp">Calendar of Appointment</a>
        <a href="appointmentList.jsp">Appointment List</a>
        <a href="LogoutServlet">Logout</a>
    </div>
    <div class="layout">
        <div class="profile-card">
            <h2>Candidate Information</h2>
            <table>
                <thead>
                    <tr>
                        <th>Candidate ID</th>
                        <th>Name</th>
                        <th>IC Number</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    // Database connection parameters
                    String url = "jdbc:derby://localhost:1527/Career";
                    String user = "app";
                    String password = "app";
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        conn = DriverManager.getConnection(url, user, password);
                        stmt = conn.createStatement();
                        if ("delete".equals(request.getParameter("action"))) {
                            String id = request.getParameter("id");
                            String deleteSQL = "DELETE FROM REGISTER WHERE ID = ?";
                            PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
                            deleteStmt.setString(1, id);
                            deleteStmt.executeUpdate();
                        }
                        if ("update".equals(request.getParameter("action"))) {
                            String candidateId = request.getParameter("candidate_id");
                            String candidateName = request.getParameter("candidate_name");
                            String icNumber = request.getParameter("ic_number");
                            String dob = request.getParameter("dob");
                            String address = request.getParameter("address");
                            String updateSQL = "UPDATE REGISTER SET NAME = ?, ICNUMBER = ?, DOB = ?, ADDRESS = ? WHERE ID = ?";
                            PreparedStatement updateStmt = conn.prepareStatement(updateSQL);
                            updateStmt.setString(1, candidateName);
                            updateStmt.setString(2, icNumber);
                            updateStmt.setString(3, dob);
                            updateStmt.setString(4, address);
                            updateStmt.setString(5, candidateId);
                            updateStmt.executeUpdate();
                        }
                        String sql = "SELECT * FROM REGISTER";
                        rs = stmt.executeQuery(sql);
                        while (rs.next()) {
                            String candidateId = rs.getString("ID");
                            String candidateName = rs.getString("NAME");
                            String icNumber = rs.getString("ICNUMBER");
                            String dob = rs.getString("DOB");
                            String address = rs.getString("ADDRESS");
                    %>
                    <tr>
                        <td><%= candidateId %></td>
                        <td><%= candidateName %></td>
                        <td><%= icNumber %></td>
                        <td><%= dob %></td>
                        <td><%= address %></td>
                        <td class="actions">
                            <a href="editInformation.jsp?id=<%= candidateId %>">Edit</a>
                            <a href="javascript:void(0);" onclick="confirmDelete('<%= candidateId %>');">Delete</a>
                        </td>
                    </tr>
                    <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) {
                            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        if (stmt != null) {
                            try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                        if (conn != null) {
                            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>