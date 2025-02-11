<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>
<%
    // Simulating a session check for a logged-in user
    HttpSession session = request.getSession(false);
    String username = (String) session.getAttribute("user"); // Assuming the username is stored in session
    String userID = "";
    String email = "";
    String password = "";

    if (username == null) {
        response.sendRedirect("login.jsp"); // Redirect to login page if session is invalid
    } else {
        try {
            // Database connection setup
            String driver = "org.apache.derby.jdbc.ClientDriver";
            String connectionString = "jdbc:derby://localhost:1527/Career;create=true;user=app;password=app";

            Class.forName(driver);
            Connection conn = DriverManager.getConnection(connectionString);

            // Query to fetch user details
            String query = "SELECT user_id, username, email, password FROM LOGIN WHERE username = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                userID = rs.getString("user_id");
                email = rs.getString("email");
                password = rs.getString("password");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Pathway Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* CSS styles (as in your provided code) */
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
        .header .user-info {
            display: flex;
            align-items: center;
        }
        .layout {
            display: flex;
            flex: 1;
        }
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
        .sidebar a i {
            margin-right: 10px;
        }
        .sidebar a:hover {
            background-color: #495057;
            transform: scale(1.05);
        }
        .sidebar a.active {
            background-color: #007bff;
        }
        .logout-btn {
            margin-top: auto;
            background-color: #dc3545;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }
        .main-content {
            display: flex;
            justify-content: center;
            align-items: center;
            max-width: 1000px;
            background: #ffffff;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            flex-grow: 1;
            margin: auto;
            padding: 30px;
        }
        .profile-card {
            width: 100%;
            max-width: 800px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }
        .profile-card h1 {
            font-size: 32px;
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
        .profile-card table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        .profile-card th, .profile-card td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .profile-card th {
            background-color: #f8f9fa;
        }
        .profile-card a {
            display: inline-block;
            margin-top: 20px;
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Career Pathway</h1>
        <div class="user-info">
            <h1>Welcome, <%= username %>, <%= userID %></h1>
        </div>
    </div>

    <div class="layout">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="UserProfile.jsp" class="active"><i class="fas fa-user"></i> Profile</a>
            <a href="#"><i class="fas fa-taxi"></i> Book Appointment</a>
            <a href="ApplicationProgress.jsp"><i class="fas fa-history"></i> Application Progress</a>
            <form action="LogoutServlet" method="post" style="margin-top: auto;">
                <button class="logout-btn" type="submit">Log Out</button>
            </form>
        </div>

        <div class="main-content">
            <div class="profile-card">
                <h1>User Profile</h1>
                <table>
                    <tr>
                        <th>User ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Password</th>
                    </tr>
                    <tr>
                        <td><%= userID %></td>
                        <td><%= username %></td>
                        <td><%= email %></td>
                        <td><%= password %></td>
                    </tr>
                </table>
                <a href="UserEditProfile.jsp">Edit Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
