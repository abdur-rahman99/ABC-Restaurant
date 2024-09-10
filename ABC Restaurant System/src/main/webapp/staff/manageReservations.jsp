<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Manage Reservations</title>
    <link rel="stylesheet" type="text/css" href="../css/adminReservation.css">

    <style>
      
        .navbar {
            background-color: #f5f808 ; 
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
            color: #0080FF; 
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
        <a href="allProductEditProduct.jsp" class="back-button">Back</a>
        <h1>ABC Restaurant</h1>
        <span></span>
    </div>

    <h1>Manage Customer Reservations</h1>

  
    <table>
        <tr>
            <th>Reservation ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Members</th>
            <th>Date & Time</th>
            <th>Status</th>
            <th>Action</th>
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

               
                String action = request.getParameter("action");
                String reservationId = request.getParameter("id");

                if (action != null && reservationId != null) {
                   
                    String updateSql = "UPDATE reservations SET status = ? WHERE reservation_id = ?";
                    PreparedStatement ps = conn.prepareStatement(updateSql);
                    if ("approve".equals(action)) {
                        ps.setString(1, "Approved");
                    } else if ("reject".equals(action)) {
                        ps.setString(1, "Rejected");
                    }
                    ps.setInt(2, Integer.parseInt(reservationId));
                    ps.executeUpdate();
                }

              
                String sql = "SELECT * FROM reservations";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

               
                while (rs.next()) {
                    int id = rs.getInt("reservation_id");
                    String name = rs.getString("name");
                    String gmail = rs.getString("gmail");
                    int members = rs.getInt("members");
                    String datetime = rs.getString("reservation_datetime");
                    String status = rs.getString("status");

                    %>
                    <tr>
                        <td><%= id %></td>
                        <td><%= name %></td>
                        <td><%= gmail %></td>
                        <td><%= members %></td>
                        <td><%= datetime %></td>
                        <td class="<%= status.equalsIgnoreCase("Approved") ? "status-approved" : "status-pending" %>">
                            <%= status %>
                        </td>
                        <td>
                            <%
                               
                                if ("Pending".equalsIgnoreCase(status)) {
                            %>
                                <a href="manageReservations.jsp?id=<%= id %>&action=approve" class="btn">Approve</a>
                                <a href="manageReservations.jsp?id=<%= id %>&action=reject" class="btn">Reject</a>
                            <%
                                } else {
                                    out.println("No actions available");
                                }
                            %>
                        </td>
                    </tr>
                    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<h3>Error retrieving data: " + e.getMessage() + "</h3>");
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
