<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Candidate Registration</title>
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
        .profile-card form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .profile-card form label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        .profile-card form input[type="text"], .profile-card form input[type="date"] {
            margin-bottom: 15px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .profile-card form input[type="submit"], .profile-card form input[type="reset"] {
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 48%;
            margin-top: 10px;
        }
        .profile-card form input[type="submit"] {
            background-color: #007bff;
            color: white;
        }
        .profile-card form input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .profile-card form input[type="reset"] {
            background-color: #007bff;
            color: white;
        }
        .profile-card form input[type="reset"]:hover {
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
        <h1>New Candidate Registration</h1>
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
            <%-- Display error message if it exists --%>
            <% String errorMessage = (String)request.getAttribute("errorMessage"); %>
            <% if (errorMessage != null && !errorMessage.isEmpty()) { %>
                <div class="error-message">
                    <%= errorMessage %>
                </div>
            <% } %>
            <form action="RegisterServlet" method="post">
                <label for="name">Name:</label>
                <input type="text" id="name" name="candidateName" required>
                <label for="ic_number">IC Number:</label>
                <input type="text" id="ic_number" name="icNumber" required>
                <label for="date_of_birth">Date of Birth:</label>
                <input type="date" id="date_of_birth" name="DOB" required>
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required>
                <label for="id">Candidate ID:</label>
                <input type="text" id="id" name="candidateId" required>
                <div class="button-group">
                    <input type="reset" value="CLEAR">
                    <input type="submit" value="CONFIRM">
                </div>
            </form>
        </div>
    </div>
</body>
</html>