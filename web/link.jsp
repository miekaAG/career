<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Portfolio</title>
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
            text-align: center;
        }
        .profile-card h1 {
            font-size: 28px;
            color: #007bff;
            margin-bottom: 15px;
        }
        .profile-card p {
            font-size: 16px;
            color: #666;
        }

        /* Profile Photo */
        .profile-photo {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #007bff;
            display: block;
            margin: 20px auto;
        }

        /* File Upload */
        .upload-btn {
            margin-top: 10px;
            font-size: 14px;
            background-color: #007bff;
            color: white;
            border: none;
            padding: 8px 12px;
            border-radius: 5px;
            cursor: pointer;
            display: block;
            margin: 0 auto;
        }
        .upload-btn:hover {
            background-color: #0056b3;
        }

        /* Editable Fields */
        .field-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 15px;
        }
        .label {
            font-weight: 600;
            display: block;
        }
        .input-field {
            width: 80%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 5px;
            text-align: center;
        }
        .edit-btn, .save-btn {
            font-size: 14px;
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-btn:hover, .save-btn:hover {
            background-color: #218838;
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
</head>
<body>
    <div class="header">
        CAREER PATHWAY
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
                <h1>Welcome to My Portfolio</h1>
                <p>Upload your profile picture and update your contact details.</p>

                <!-- Profile Photo -->
                <img src="https://via.placeholder.com/120" id="profile-pic" class="profile-photo" alt="Profile Photo">
                <input type="file" id="upload-photo" accept="image/*" hidden>
                <button class="upload-btn" onclick="document.getElementById('upload-photo').click();">Upload Photo</button>

                <!-- Editable Email -->
                <label class="label" for="email">Email:</label>
                <% String userEmail = (String) session.getAttribute("userEmail");
                   if (userEmail == null) { userEmail = ""; } %>
                <div class="field-container">
                    <input type="email" id="email" class="input-field" value="<%= userEmail %>" disabled>
                    <button class="edit-btn" onclick="editField('email')">Edit</button>
                    <button class="save-btn" onclick="saveField('email')" style="display: none;">Save</button>
                </div>

                <!-- Editable Phone Number -->
                <label class="label" for="phone">Phone:</label>
                <% String userPhone = (String) session.getAttribute("userPhone");
                   if (userPhone == null) { userPhone = ""; } %>
                <div class="field-container">
                    <input type="tel" id="phone" class="input-field" value="<%= userPhone %>" disabled>
                    <button class="edit-btn" onclick="editField('phone')">Edit</button>
                    <button class="save-btn" onclick="saveField('phone')" style="display: none;">Save</button>
                </div>

            </div>
        </div>
    </div>

    <script>
        function editField(id) {
            document.getElementById(id).removeAttribute('disabled');
            document.querySelector(`[onclick="editField('${id}')"]`).style.display = 'none';
            document.querySelector(`[onclick="saveField('${id}')"]`).style.display = 'inline-block';
        }

        function saveField(id) {
            document.getElementById(id).setAttribute('disabled', 'true');
            document.querySelector(`[onclick="editField('${id}')"]`).style.display = 'inline-block';
            document.querySelector(`[onclick="saveField('${id}')"]`).style.display = 'none';
        }

        document.getElementById('upload-photo').addEventListener('change', function(event) {
            if (confirm("Are you sure you want to upload this photo?")) {
                const reader = new FileReader();
                reader.onload = e => document.getElementById('profile-pic').src = e.target.result;
                reader.readAsDataURL(event.target.files[0]);
            } else {
                event.target.value = "";
            }
        });
    </script>
</body>
</html>
