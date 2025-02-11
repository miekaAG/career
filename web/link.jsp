<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio</title>
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
        <h1>CAREER PATHWAY</h1>
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
            <h1>Welcome to My Portfolio</h1>
            <p>This is a sample portfolio page.</p>
        </div>
    </div>
</body>
</html>