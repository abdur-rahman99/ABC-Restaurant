<%@ page import="java.sql.*" %>
<%
    String staffID = request.getParameter("staffID");
    String email = request.getParameter("email");

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/rest", "root", "6848");

        String sql = "INSERT INTO staff (staff_id, email) VALUES (?, ?)";
        ps = conn.prepareStatement(sql);
        ps.setString(1, staffID);
        ps.setString(2, email);

        int result = ps.executeUpdate();

        if (result > 0) {
            out.println("<h3>Staff added successfully!</h3>");
        } else {
            out.println("<h3>Failed to add staff.</h3>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h3>Error occurred: " + e.getMessage() + "</h3>");
    } finally {
        if (ps != null) ps.close();
        if (conn != null) conn.close();
    }
%>
<a href="manageStaff.jsp">Back to Manage Staff</a>
