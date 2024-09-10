<%@ page import="java.sql.*" %>
<%
    // Retrieve the reservation ID and action from the request parameters
    String id = request.getParameter("id");
    String action = request.getParameter("action");

    // Debugging: Print the values to check if they are passed correctly
    out.println("ID: " + id + "<br>");
    out.println("Action: " + action + "<br>");

    String status = "";

    // Validate 'id' and 'action' parameters
    if (id == null || action == null || (!action.equals("approve") && !action.equals("reject"))) {
        out.println("<h3>Error: Invalid request parameters.</h3>");
    } else {
        try {
            // Parse the reservation ID to ensure it's a valid integer
            int reservationId = Integer.parseInt(id);

            // Set the status based on the action
            if ("approve".equals(action)) {
                status = "Approved";
            } else if ("reject".equals(action)) {
                status = "Rejected";
            }

            // Database connection parameters
            String url = "jdbc:mysql://localhost:3306/rest";
            String user = "root";
            String password = "6848";

            // Use try-with-resources to auto-close the database resources
            try (Connection conn = DriverManager.getConnection(url, user, password);
                 PreparedStatement ps = conn.prepareStatement("UPDATE reservations SET status = ? WHERE reservation_id = ?")) {

                // Set the SQL parameters
                ps.setString(1, status);
                ps.setInt(2, reservationId);

                // Execute the update query
                int result = ps.executeUpdate();

                // Check if the update was successful
                if (result > 0) {
                    // Redirect back to manageReservations.jsp with a success message
                    response.sendRedirect("manageReservations.jsp?success=true&action=" + action);
                } else {
                    out.println("<h3>Failed to update reservation status.</h3>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h3>Error while updating the reservation: " + e.getMessage() + "</h3>");
            }

        } catch (NumberFormatException e) {
            out.println("<h3>Error: Invalid reservation ID format.</h3>");
        }
    }
%>
<a href="manageReservations.jsp">Back to Admin Panel</a>
