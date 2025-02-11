<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Candidate Progress</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <style>
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
        .header {
            background-color: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
            display: flex;
            flex-direction: column;
            padding: 20px;
            min-height: 100vh;
        }
        .sidebar a {
            text-decoration: none;
            color: white;
            padding: 12px;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            text-align: center;
            display: block;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .main-container {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: flex-start;
            padding: 40px;
        }
        .profile-card {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }
        label {
            font-weight: 600;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }
        button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="header">Edit Candidate Progress</div>
    <div style="display: flex; flex: 1;">
        <div class="sidebar">
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
                <h1>Edit Progress</h1>
                <%
                    String id = request.getParameter("id");
                    String jdbcURL = "jdbc:derby://localhost:1527/Career";
                    String jdbcUsername = "app";
                    String jdbcPassword = "app";
                    String selectSQL = "SELECT * FROM PROGRESS WHERE ID=?";
                    Connection connection = null;
                    PreparedStatement statement = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("org.apache.derby.jdbc.ClientDriver");
                        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
                        statement = connection.prepareStatement(selectSQL);
                        statement.setString(1, id);
                        rs = statement.executeQuery();
                        if (rs.next()) {
                %>
                <form action="updateProgress.jsp" method="POST">
                    <input type="hidden" name="id" value="<%= rs.getString("ID") %>">
                    <div class="form-group">
                        <label>Name:</label>
                        <input type="text" name="name" value="<%= rs.getString("NAME") %>" required>
                    </div>
                    <div class="form-group">
                        <label>Qualification:</label>
                        <input type="text" name="qualification" value="<%= rs.getString("QUALIFICATION") %>" required>
                    </div>
                    <div class="form-group">
                        <label>Progress:</label>
                        <input type="text" name="progress" value="<%= rs.getString("PROGRESS") %>" required>
                    </div>
                    <div class="form-group">
                        <label>Desired Job:</label>
                        <input type="text" name="notes" value="<%= rs.getString("NOTES") %>" required>
                    </div>
                    <button type="submit">Update</button>
                </form>
                <%
                        } else {
                            out.println("<p>Candidate not found.</p>");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (statement != null) statement.close();
                        if (connection != null) connection.close();
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>