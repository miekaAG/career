<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Candidate Progress</title>
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
            padding: 15px 20px;
            text-align: center;
            font-size: 20px;
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
        .main-container {
            display: flex;
            flex: 1;
            justify-content: center;
            align-items: flex-start;
            padding: 40px;
        }
        .profile-card {
            width: 100%;
            max-width: 700px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .profile-card h1, .profile-card h2 {
            text-align: center;
        }
        .profile-card label {
            font-weight: 600;
            margin-top: 15px;
            display: block;
        }
        .profile-card input[type="text"], .profile-card textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: left;
        }
        .profile-card input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
            margin-top: 10px;
        }
        .profile-card input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-bottom: 10px;
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
    <div class="header">Candidate Progress</div>

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
                <h2>Candidate Progress</h2>
                <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                <% if (errorMessage != null) { %>
                    <p class="error-message"><%= errorMessage %></p>
                <% } %>
                <form action="TrackProgressServlet" method="post">
                    <label for="id">Candidate ID:</label>
                    <input type="text" id="id" name="id" required>
                    <label for="name">Candidate Name:</label>
                    <input type="text" id="name" name="name" required>
                    <label for="qualification">Qualification:</label>
                    <input type="text" id="qualification" name="qualification" required>
                    <label for="progress">Progress:</label>
                    <textarea id="progress" name="progress" required></textarea>
                    <label for="notes">Desired Job:</label>
                    <textarea id="notes" name="notes" required></textarea>
                    <input type="submit" value="Add Candidate Qualification">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
