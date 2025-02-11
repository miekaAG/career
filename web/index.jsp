<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">
    <title>Welcome Page</title>  
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to bottom, #2c3e50, #2980b9); /* Urban Blue Gradient */
            color: #ffffff; /* White Font */
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100vh;
            text-align: center;
        }

        .container {
            background: linear-gradient(to bottom, #34495e, #2c3e50); /* Dark Urban Gradient */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.5);
            text-align: center;
            width: 400px;
        }

        h1 {
            margin-bottom: 20px;
            color: #ecf0f1; /* Light Gray */
            font-size: 2em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
        }

        h2 {
            margin-bottom: 20px;
            color: #ecf0f1; /* Light Gray */
            font-size: 1.5em;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.8);
        }

        a.button {
            display: block;
            margin: 10px 0;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            color: #ffffff; /* White text */
            background: #27ae60; /* Green Button */
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a.button:hover {
            background: #1e8449; /* Darker Green */
            transform: scale(1.05);
        }

        .time {
            margin-top: 20px;
            font-size: 1em;
            color: #ecf0f1; /* Light Gray */
        }
    </style>
    <script>
        window.onload = function() {
            var urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('logout') === 'true') {
                alert('Successfully logged out');
            }
        }
    </script>
</head>  

<body>  
    <div class="container">
        <h1>CAREER PATHWAY</h1>
        <h2>Hello and Welcome!</h2>
        <a href="signup.jsp" class="button">Sign Up</a>
        <a href="login.jsp" class="button">Login</a>  
    </div>
    <div class="time">Current Time: <%= java.util.Calendar.getInstance().getTime() %></div>
</body>  
</html>