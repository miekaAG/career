<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>  
<html>  
<head>  
    <meta charset="UTF-8">
    <title>Welcome Page</title>  
    <style>
        body {
            background-image: url('bgc1.jpg');
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 2000px;
            padding: 50px;
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8); 
            border-radius: 15px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.3); 
            position: relative;
        }
        h1 {
            color: #000000;
            font-size: 36px;
            font-family: 'Garamond', cursive; 
            margin-bottom: 20px;
        }
        h2 {
            color: #000000;
            font-family: 'Garamond', cursive; 
            margin-bottom: 20px;
        }
        .button {
            background-color: #4d88ff ; 
            color: white;
            padding: 12px 24px;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 18px;
            border: none;
            cursor: pointer;
            display: inline-block;
            margin-top: 20px;
        }
        .button:hover {
            background-color: #002b80; 
        }
        .time {
            position: absolute;
            top: 8px;
            right: 16px;
            font-size: 18px;
            color: #333;
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
