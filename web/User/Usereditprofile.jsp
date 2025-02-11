<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/Transport2" user="app" password="app"/>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Pathway Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
        /* Reset and base styling */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, #6ab1d7, #33d9b2);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            animation: fadeIn 0.5s ease;
        }

        .container h2 {
            font-size: 28px;
            font-weight: bold;
            color: #2d3436;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #34495e;
            display: block;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 15px;
            font-size: 16px;
            border: 1px solid #dcdde1;
            border-radius: 8px;
            background-color: #f5f6fa;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 8px rgba(26, 188, 156, 0.2);
            outline: none;
        }

        .form-group button {
            background-color: #1abc9c;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            border: none;
            border-radius: 8px;
            padding: 12px 20px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            width: 100%;
        }

        .form-group button:hover {
            background-color: #16a085;
            transform: translateY(-2px);
        }

        .form-group button:active {
            background-color: #149174;
            transform: translateY(0);
        }

        .back-link {
            display: inline-block;
            margin-top: 20px;
            font-size: 14px;
            color: #0984e3;
            text-decoration: none;
        }

        .back-link:hover {
            text-decoration: underline;
        }
        .error-message {
            color: #e74c3c; /* Red */
            font-size: 0.9em;
            margin-bottom: 15px;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
   <% 
        // Retrieve the username parameter from the request
        int UI = 0;
        String UN=null;
        String Username = request.getParameter("Username");
        String UserIdString = request.getParameter("Userid");
            if(Username==null&&UserIdString==null){
                UN=(String) request.getAttribute("Username");
                UI = (Integer) request.getAttribute("Userid");
            }
        else{
            try {
                UI = Integer.parseInt(UserIdString);
            }catch (NumberFormatException e) {
                out.println("<h2>Error: Invalid Driver ID provided.</h2>");
            return;
            }

            if (Username == null || Username.isEmpty()) {
                out.println("<h2>Error: Drivername is missing.</h2>");
                return;
            }
            UN=Username;
        }

        
    %>
    <div class="container">
        
        
        <sql:query var="result" dataSource="${myDatasource}">
                    SELECT * FROM APP.customer WHERE UserID = <%= UI %>
        </sql:query>
                    
                    
        <h2>Edit User Profile</h2>
        <% if(request.getAttribute("errMessage") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("errMessage") %>
            </div>
        <% } %>
        <form action="EditProfileServlet" method="POST">
            <c:forEach var="row" items="${result.rows}">
            <input type="hidden" name="type" value="user">
            <input type="hidden" name="Userid" value="${row.UserID}">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="Username" value="${row.Username}" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="Email" value="${row.Email}" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" value="${row.password}" required>
            </div>
            <div class="form-group">
                <label for="password">Confirm Password</label>
                <input type="password" id="password" name="CP" value="${row.password}" required>
            </div>
            <div class="form-group">
                <button type="submit">Update Profile</button>
            </div>
        </form>
            </c:forEach>
        <a href="Userprofile.jsp" class="back-link">Back to Profile</a>
    </div>
</body>
</html>