<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<sql:setDataSource var="myDatasource"
driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/Transport2" user="app" password="app"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Career Pathway Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <style>
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
        .header .user-info {
            display: flex;
            align-items: center;
        }
        .header .user-info img {
            border-radius: 50%;
            width: 40px;
            height: 40px;
            margin-left: 10px;
        }

        /* Layout */
        .layout {
            display: flex;
            flex: 1;
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
        .sidebar a i {
            margin-right: 10px;
        }
        .sidebar a:hover {
            background-color: #495057;
            transform: scale(1.05);
        }
        .sidebar a.active {
            background-color: #007bff;
        }
        .logout-btn {
            margin-top: auto;
            background-color: #dc3545;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .logout-btn:hover {
            background-color: #c82333;
        }

        /* Main Content */
        .main-content {
        flex: 1;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        padding: 20px;
        margin: auto;
        max-width: 90%;
        background: #ffffff;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        text-align: center;
    }

    table {
        width: 80%; /* Adjust the table width to fit the content */
        margin: 20px auto; /* Center the table horizontally */
        border-collapse: collapse;
        background-color: #f9f9f9; /* Light background for contrast */
        box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    table, th, td {
        border: 1px solid #007bff; /* Blue border */
        text-align: center; /* Center-align text */
    }

    th, td {
        padding: 15px; /* Add padding for better spacing */
        font-size: 16px; /* Slightly larger font for readability */
    }

    th {
        background-color: #007bff; /* Blue header background */
        color: white; /* White text on the blue header */
        font-weight: bold;
        text-transform: uppercase;
    }

    td {
        background-color: #e9f2ff; /* Light blue background for table data */
        color: #333; /* Darker text for readability */
    }

    td:hover {
        background-color: #d0e7ff; /* Slightly darker blue when hovering over data */
        cursor: pointer;
    }

    a {
        text-decoration: none;
        color: #007bff; /* Link color */
        font-weight: bold;
        transition: color 0.3s ease;
    }

    a:hover {
        color: #0056b3; /* Darker blue on hover */
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
            .main-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <% 
        int UI = 0;
        String UN = null;
        String Username = request.getParameter("Username");
        String UserIdString = request.getParameter("Userid");

        if (Username == null && UserIdString == null) {
            UN = (String) request.getAttribute("Username");
            UI = (Integer) request.getAttribute("Userid");
        } else {
            try {
                UI = Integer.parseInt(UserIdString);
            } catch (NumberFormatException e) {
                out.println("<h2>Error: Invalid User ID provided.</h2>");
                return;
            }

            if (Username == null || Username.isEmpty()) {
                out.println("<h2>Error: Username is missing.</h2>");
                return;
            }
            UN = Username;
        }
    %>

    <div class="header">
        <h1>Career Pathway</h1>
        <div class="user-info">
            <h1>Welcome, <%= UN %>, <%= UI %></h1>
        </div>
    </div>

    <div class="layout">
        <div class="sidebar">
            <h2>Menu</h2>
            <a href="UserProfile.jsp" class=""><i class="fas fa-user"></i> Profile</a>
            <a href="#" class=""><i class="fas fa-taxi"></i> Book Appointment</a>
            <a href="ApplicationProgress.jsp" class="active"><i class="fas fa-history"></i> Application Progress</a>
            <form action="LogoutServlet" method="post">
                <button type="submit" class="logout-btn">Log Out</button>
            </form>
        </div>

        <div class="main-content">
            <sql:query var="result" dataSource="${myDatasource}">
                SELECT * FROM APP.Booking WHERE UserID = ? AND PaymentStatus = 'Paid'
                <sql:param value="<%= UI %>" />
            </sql:query>

            <table>
                <tr>
                    <th>BookingID</th>
                    <th>Name</th>
                    <th>Qualification</th>
                    <th>Progress</th>
                    <th>Job Applied</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.BookingID}" /></td>
                        <td><c:out value="${row.Name}" /></td>
                        <td><c:out value="${row.Qualification}" /></td>
                        <td><c:out value="${row.Progress}" /></td>
                        <td><c:out value="${row.JobApplied}" /></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <script>
        // Fix active class switching
        const links = document.querySelectorAll('.sidebar a');
        links.forEach(link => {
            link.addEventListener('click', function () {
                links.forEach(l => l.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>