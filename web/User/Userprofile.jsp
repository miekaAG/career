<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Pathway Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* Same CSS styling as provided in your HTML file */
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
        .profile-card input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            margin-top: 20px;
        }
        .profile-card input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .back-button {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Career Pathway</h1>
        <div class="user-info">
            <!-- Dynamically display username and user ID -->
            <h1>Welcome, <%= session.getAttribute("username") %>, <%= session.getAttribute("userID") %></h1>
        </div>
    </div>

    <div class="layout">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="UserProfile.jsp" class="active"><i class="fas fa-user"></i> Profile</a>
            <a href="BookAppointment.jsp"><i class="fas fa-taxi"></i> Book Appointment</a>
            <a href="ApplicationProgress.jsp"><i class="fas fa-history"></i> Application Progress</a>
            <form action="LogoutServlet" method="post">
                <button type="submit" class="logout-btn">Log Out</button>
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
                        <!-- Dynamically fetch user details -->
                        <td><%= session.getAttribute("userID") %></td>
                        <td><%= session.getAttribute("username") %></td>
                        <td><%= session.getAttribute("email") %></td>
                        <td>********</td> <!-- Mask password -->
                    </tr>
                </table>
                <a href="EditUserProfile.jsp">Edit Profile</a>
            </div>
        </div>
    </div>
</body>
</html>
