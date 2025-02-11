<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
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
            height: 10S0vh;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }
        .container h1 {
            color: #000000;
            font-size: 36px;
            font-family: 'Garamond', cursive; 
            margin-bottom: 20px;
        }
        .container h2 {
            margin-bottom: 20px;
            font-size: 20px;
            color: #666;
        }
        .container form {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }
        .container form label {
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }
        .container form input[type="text"],
        .container form input[type="password"] {
            margin-bottom: 15px;
            padding: 10px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .container form input[type="submit"] {
            padding: 10px;
            background-color: #4d88ff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        .container form input[type="submit"]:hover {
            background-color: #002b80;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>CAREER PATHWAY</h1>
        <h2>Staff Login</h2>
        <form action="LoginServlet" method="post">
            <label for="username">Staff ID:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <input type="submit" value="Login">
        </form>
    </div>
</body>
</html>