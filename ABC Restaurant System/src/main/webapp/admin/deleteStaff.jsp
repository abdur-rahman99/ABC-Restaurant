<%@ page import="java.sql.*" %>
<%
    String staffId = request.getParameter("id");

    if (staffId != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "6848");

            
            String sql = "DELETE FROM staff WHERE staff_id = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(staffId));
            ps.executeUpdate();

            response.sendRedirect("manageStaff.jsp");
        } catch (SQLException e) {
            out.println("<h3>Error deleting staff: " + e.getMessage() + "</h3>");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>
