<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@include file="staffHeader.jsp" %>
<html>
<head>
    <title>Admin Panel - Manage Reservations</title>
    <link rel="stylesheet" type="text/css" href="../css/adminReservation.css">
</head>
<body>
    <h1>Manage Customer Reservations</h1>
    <table border="1">
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
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/rest";
            String user = "root";
            String password = "6848";
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                // Load the MySQL driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "6848");

           ;

                // Retrieve all pending reservations
                String sql = "SELECT * FROM reservations WHERE status = 'Pending'";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);

                // Display each reservation as a row
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
                        <td><%= status %></td>
                        <td>
                            <a href="updateReservation.jsp?id=<%= id %>&action=approve">Approve</a> |
                            <a href="updateReservation.jsp?id=<%= id %>&action=reject">Reject</a>
                        </td>
                    </tr>
                    <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }
        %>
    </table>
</body>
</html>
