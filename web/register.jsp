<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Registration</title>
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
            padding: 3px 10px;
            text-align: center;
            font-size: 10px;
            font-weight: 600;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        /* Layout Container */
        .container {
            display: flex;
            flex: 1;
            align-items: flex-start;
        }
        /* Sidebar */
        .sidebar {
            background-color: #343a40;
            color: white;
            width: 250px;
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
            padding: 12px 15px;
            margin-bottom: 10px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            font-weight: 500;
            display: block;
            text-align: center;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        /* Main Content */
        .main-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px;
            flex: 1;
        }
        /* Profile Card (Form Box) */
        .profile-card {
            width: 100%;
            max-width: 600px;
            background-color: #fff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
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
        .profile-card form input[type="text"], 
        .profile-card form input[type="date"] {
            margin-bottom: 15px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .profile-card form input[type="submit"], 
        .profile-card form input[type="reset"] {
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
        .profile-card form input[type="submit"]:hover,
        .profile-card form input[type="reset"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
            font-weight: bold;
        }
        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                align-items: center;
            }
            .sidebar {
                width: 100%;
                text-align: center;
                min-height: auto;
            }
            .main-container {
                padding: 20px;
            }
            .profile-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>New Candidate Registration</h1>
    </div>
    <div class="container">
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
                    <div style="display: flex; justify-content: space-between; width: 100%;">
                        <input type="reset" value="CLEAR">
                        <input type="submit" value="CONFIRM">
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
