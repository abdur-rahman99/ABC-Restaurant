<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="project.ConnectionProvider" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Reservations</title>
    <link rel="stylesheet" type="text/css" href="css/adminReservation.css">

    <style>
       
        .navbar {
            background-color:#f5f808;
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
            color:  #0080FF;
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

        .status-approved {
            color: green;
            font-weight: bold;
        }

        .status-pending {
            color: orange;
            font-weight: bold;
        }

        .status-rejected {
            color: red;
            font-weight: bold;
        }
        
        
          .back-button {
            padding: 5px 10px;
            background-color:  #0080FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #005bb5;
        }
    </style>
</head>
<body>
  
    <div class="navbar">
        <a href="home.jsp" class="back-button">Back</a>
        <h1>ABC Restaurant</h1>
        <span></span> 
    </div>

    <h1>Your Reservations</h1>

    <%
        
        String customerEmail = (String) session.getAttribute("email");

        if (customerEmail == null) {
            out.println("<p>Error: No email found. Please log in to view your reservations.</p>");
        } else {
            Connection conn = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
              
                conn = ConnectionProvider.getCon();

             
                String sql = "SELECT reservation_id, name, gmail, members, reservation_datetime, status FROM reservations WHERE gmail = ?";
                ps = conn.prepareStatement(sql);
                ps.setString(1, customerEmail);

            
                rs = ps.executeQuery();

                if (!rs.isBeforeFirst()) {
                
                    out.println("<p>No reservations found for your account.</p>");
                } else {
    %>
                
                    <table>
                        <tr>
                            <th>Reservation ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Members</th>
                            <th>Date & Time</th>
                            <th>Status</th>
                        </tr>

                        <%
                            while (rs.next()) {
                                int reservationId = rs.getInt("reservation_id");
                                String name = rs.getString("name");
                                String gmail = rs.getString("gmail");
                                int members = rs.getInt("members");
                                String datetime = rs.getString("reservation_datetime");
                                String status = rs.getString("status");

                           
                                String statusClass = "";
                                if ("Approved".equalsIgnoreCase(status)) {
                                    statusClass = "status-approved";
                                } else if ("Pending".equalsIgnoreCase(status)) {
                                    statusClass = "status-pending";
                                } else if ("Rejected".equalsIgnoreCase(status)) {
                                    statusClass = "status-rejected";
                                }
                        %>
                            <tr>
                                <td><%= reservationId %></td>
                                <td><%= name %></td>
                                <td><%= gmail %></td>
                                <td><%= members %></td>
                                <td><%= datetime %></td>
                                <td class="<%= statusClass %>"><%= status %></td>
                            </tr>
                        <%
                            }
                        %>
                    </table>
    <%
                }
            } catch (SQLException e) {
                out.println("<p>Error fetching reservations: " + e.getMessage() + "</p>");
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            }
        }
    %>
</body>
</html>
