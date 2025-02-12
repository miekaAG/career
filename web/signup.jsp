<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #2c3e50, #2980b9);
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-container {
            background: linear-gradient(to bottom, #34495e, #2c3e50);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 400px;
        }

        .signup-container h2 {
            margin-bottom: 20px;
            color: #ecf0f1;
            font-size: 1.8em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #ecf0f1;
        }

        input, select {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #ecf0f1;
            color: #2c3e50;
            font-size: 1em;
            box-sizing: border-box;
            outline: none;
        }

        input:focus, select:focus {
            border: 2px solid #3498db;
        }

        button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            color: #ffffff;
            background: #27ae60;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        button:hover {
            background: #1e8449;
            transform: scale(1.05);
        }

        .back-button {
            background: #3498db;
            text-decoration: none;
            text-align: center;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            display: block;
            margin-top: 10px;
        }

        .back-button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        .error {
            color: #e74c3c;
            font-size: 0.9em;
            margin-top: 5px;
            display: none;
        }

    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form action="SignupServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required>
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter your password" required>
                <p class="error" id="passwordError">Passwords do not match.</p>
            </div>

            <button type="submit">Sign Up</button>
        </form>

        <a href="index.jsp" class="back-button">Back</a>
    </div>

    <script>
        function validateForm() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var errorText = document.getElementById("passwordError");

            if (password !== confirmPassword) {
                errorText.style.display = "block";
                return false;
            } else {
                errorText.style.display = "none";
                return true;
            }
        }
    </script>
</body>
</html>
