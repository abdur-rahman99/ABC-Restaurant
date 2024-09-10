<%@ page import="java.sql.*" %>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");

    if (name != null && email != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
          
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "6848");

           
            String sql = "INSERT INTO staff (name, email) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.executeUpdate();

            response.sendRedirect("manageStaff.jsp");
        } catch (SQLException e) {
            out.println("<h3>Error adding staff: " + e.getMessage() + "</h3>");
        } finally {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        }
    }
%>
