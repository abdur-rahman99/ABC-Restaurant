<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Staff</title>
    <link rel="stylesheet" type="text/css" href="../css/adminStaff.css">

    <style>
       
        .navbar {
            background-color: #0080FF; 
            padding: 10px;
            color: white;
            font-size: 20px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar .back-button {
            margin-left: 20px;
        }

        .navbar h1 {
            flex: 1;
            margin: 0;
            text-align: center;
            color: #f5f808; /
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            margin-right: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #0080FF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #d1e7dd;
        }

        .btn {
            padding: 5px 10px;
            background-color: #0080FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #005bb5;
        }

        .form-container {
            margin-top: 20px;
            padding: 20px;
            background-color: #f5f808;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .form-container input {
            padding: 10px;
            width: 100%;
            margin-bottom: 10px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        .form-container button {
            background-color: #0080FF;
            color: white;
            padding: 10px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #005bb5;
        }
        
         .back-button {
            padding: 5px 10px;
            background-color:   #f5f808;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
        body{
       background-color:   #ccc;
        }
    
    </style>
</head>
<body>
  
    <div class="navbar">
        <a href="adminHome.jsp" class="back-button">Back</a>
        <h1>ABC Restaurant</h1>
        <span></span> 
    </div>

   
    <center> <h1>Manage Staff</h1> </center>

   
    <div class="form-container">
        <h3>Add New Staff</h3>
        <form action="addStaff.jsp" method="post">
            <input type="text" name="name" placeholder="Enter Staff Name" required>
            <input type="email" name="email" placeholder="Enter Staff Email" required>
            <button type="submit">Add Staff</button>
        </form>
    </div>

   
    <table>
        <tr>
            <th>Staff ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
        <%
            
            String url = "jdbc:mysql://localhost:3306/rest";
            String dbUser = "root";
            String dbPassword = "6848";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
              
                Class.forName("com.mysql.cj.jdbc.Driver");

          
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "6848");

               
                String sql = "SELECT * FROM staff";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                
                while (rs.next()) {
                    int staffId = rs.getInt("staff_id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
        %>
                    <tr>
                        <td><%= staffId %></td>
                        <td><%= name %></td>
                        <td><%= email %></td>
                        <td>
                            
                            <a href="deleteStaff.jsp?id=<%= staffId %>" class="btn">Delete</a>
                        </td>
                    </tr>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error retrieving staff data: " + e.getMessage() + "</h3>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
