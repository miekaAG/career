<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointment List</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
        /* General Styles */
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            background-color: #f4f6f9;
            color: #333;
        }
        /* Header */
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        /* Sidebar */
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px;
            min-height: 100vh;
        }
        .sidebar h2 {
            font-size: 18px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: 600;
            text-transform: uppercase;
        }
        .sidebar a {
            text-decoration: none;
            color: white;
            padding: 12px;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            font-weight: 500;
            text-align: center;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        /* Layout */
        .main-container {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: flex-start;
            padding: 40px;
        }
        /* Profile Card */
        .profile-card {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .profile-card h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .actions a {
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 6px 10px;
            border-radius: 5px;
            font-size: 14px;
            transition: 0.3s;
            display: inline-block;
            margin: 2px;
        }
        .actions a:hover {
            background-color: #0056b3;
        }
        .delete-btn {
            background-color: #dc3545 !important;
        }
        .delete-btn:hover {
            background-color: #a71d2a !important;
        }
        @media (max-width: 768px) {
            .sidebar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
                min-height: auto;
                padding: 10px;
            }
            .main-container {
                flex-direction: column;
                align-items: center;
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        Appointment List
    </div>
    <div style="display: flex; flex: 1;">
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
        <div class="main-container">
            <div class="profile-card">
                <h2>Appointment List</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Candidate ID</th>
                            <th>Candidate Name</th>
                            <th>Appointment Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        String dbURL = "jdbc:derby://localhost:1527/Career";
                        String user = "app";
                        String password = "app";
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                            conn = DriverManager.getConnection(dbURL, user, password);
                            stmt = conn.createStatement();
                            if ("delete".equals(request.getParameter("action"))) {
                                String id = request.getParameter("id");
                                String deleteSQL = "DELETE FROM APPOINTMENT WHERE ID = ?";
                                PreparedStatement deleteStmt = conn.prepareStatement(deleteSQL);
                                deleteStmt.setString(1, id);
                                deleteStmt.executeUpdate();
                            }
                            String sql = "SELECT ID, NAME, DATE FROM APPOINTMENT";
                            rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getString("ID") %></td>
                            <td><%= rs.getString("NAME") %></td>
                            <td><%= rs.getString("DATE") %></td>
                            <td class="actions">
                                <a href="editAppointment.jsp?id=<%= rs.getString("ID") %>">Edit</a>
                                <a href="javascript:void(0);" class="delete-btn" onclick="confirmDelete('<%= rs.getString("ID") %>');">Delete</a>
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this appointment?")) {
                window.location.href = "appointmentList.jsp?action=delete&id=" + id;
            }
        }
    </script>
</body>
</html>
