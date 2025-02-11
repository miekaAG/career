<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calendar of Appointments</title>
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
            font-size: 20px;
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
            max-width: 700px;
            background-color: #fff;
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .profile-card h1 {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 15px;
            text-align: center;
        }

        /* Updated Form Styles */
        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
            align-items: flex-start;
        }

        form label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        form input[type="text"],
        form input[type="date"] {
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            width: 100%;
            text-align: left;
        }

        form input[type="submit"] {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 40%;
            margin-top: 10px;
            align-self: flex-start;
        }
        form input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* Responsive Design */
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
    <script>
        window.onload = function() {
            const urlParams = new URLSearchParams(window.location.search);
            const status = urlParams.get('status');
            if (status === 'success') {
                alert('Appointment scheduled successfully!');
            } else if (status === 'error') {
                alert('Failed to schedule the appointment. Please try again.');
            }
        }
    </script>
</head>
<body>
    <div class="header">
        Calendar of Appointments
    </div>

    <div style="display: flex; flex:  1;">
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
                <h1>Schedule an Appointment</h1>
                <form action="AppointmentServlet" method="post">
                    <label for="candidate_id">Candidate ID:</label>
                    <input type="text" id="candidate_id" name="candidate_id" required>
                    <label for="candidate_name">Candidate Name:</label>
                    <input type="text" id="candidate_name" name="candidate_name" required>
                    <label for="appointment_date">Date:</label>
                    <input type="date" id="appointment_date" name="appointment_date" required>
                    <input type="submit" value="Schedule Appointment">
                </form>
            </div>
        </div>
    </div>
</body>
</html>
