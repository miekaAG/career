<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Candidate Information</title>
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
        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        form label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        form input[type="text"], form input[type="date"] {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 80%;
        }
        form input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 30%;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
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
        <h1>Edit Candidate Information</h1>
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
            <% 
            Connection conn = null; 
            PreparedStatement pstmt = null; 
            ResultSet rs = null; 
            String dbURL = "jdbc:derby://localhost:1527/Career"; 
            String user = "app"; 
            String password = "app"; 
            String candidateId = request.getParameter("id"); 
            try { 
                Class.forName("org.apache.derby.jdbc.ClientDriver"); 
                conn = DriverManager.getConnection(dbURL, user, password); 
                String sql = "SELECT * FROM REGISTER WHERE ID = ?"; 
                pstmt = conn.prepareStatement(sql); 
                pstmt.setString(1, candidateId); 
                rs = pstmt.executeQuery(); 
                if (rs.next()) { 
                    String candidateName = rs.getString("NAME"); 
                    String icNumber = rs.getString("ICNUMBER"); 
                    String dob = rs.getString("DOB"); 
                    String address = rs.getString("ADDRESS"); 
            %>
            <form action="information.jsp" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="candidate_id" value="<%= candidateId %>">
                <label for="candidate_name">Candidate Name:</label>
                <input type="text" id="candidate_name" name="candidate_name" value="<%= candidateName %>" required>
                <label for="ic_number">IC Number:</label>
                <input type="text" id="ic_number" name="ic_number" value="<%= icNumber %>" required>
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" value="<%= dob %>" required>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%= address %>" required>
                <input type="submit" value="Update Information">
            </form>
            <% 
                } else { 
                    out.println("<p>Candidate not found.</p>"); 
                } 
            } catch (Exception e) { 
                e.printStackTrace(); 
                out.println("<p>Error: " + e.getMessage() + "</p>"); 
            } finally { 
                if (rs != null) { 
                    try { rs.close(); } catch (SQLException e) { e.printStackTrace(); } 
                } 
                if (pstmt != null) { 
                    try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); } 
                } 
                if (conn != null) { 
                    try { conn.close(); } catch (SQLException e) { e.printStackTrace(); } 
                } 
            } 
            %>
        </div>
    </div>
</body>
</html>