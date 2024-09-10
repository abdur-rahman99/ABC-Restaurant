<%@ page import="java.sql.*" %>
<%@ page import="project.ConnectionProvider"%>
<%
    // Get the form parameters
    String name = request.getParameter("name");
    String email = request.getParameter("gmail");
    String members = request.getParameter("members");
    String datetime = request.getParameter("datetime");

    // Validate form parameters
    if (name == null || email == null || members == null || datetime == null) {
        out.println("<h3>Error: All fields are required!</h3>");
    } else {
        try {
            // Convert 'members' to an integer
            int memberCount = Integer.parseInt(members);

            // Insert the reservation into the database
            String url = "jdbc:mysql://localhost:3306/rest";
            String user = "root";
            String password = "6848"; // Update with your MySQL password

            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO reservations (name, gmail, members, reservation_datetime, status) VALUES (?, ?, ?, ?, 'Pending')")) {

                ps.setString(1, name);
                ps.setString(2, email);
                ps.setInt(3, memberCount);
                ps.setString(4, datetime); // Ensure datetime format is compatible with your DB

                int result = ps.executeUpdate();

                if (result > 0) {
%>
                    <!-- JavaScript for popup and redirect -->
                    <script>
                        alert('Reservation added successfully!');
                        window.location.href = 'home.jsp';
                    </script>
<%
                } else {
                    out.println("<h3>Error: Failed to submit the reservation.</h3>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error while saving the reservation: " + e.getMessage() + "</h3>");
            }

        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid number of members.</h3>");
        }
    }
%>
