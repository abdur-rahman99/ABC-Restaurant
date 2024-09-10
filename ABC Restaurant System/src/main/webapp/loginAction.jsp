<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");

// Check for admin login
if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
    session.invalidate(); // Invalidate the current session
    session = request.getSession(true); // Create a new session
    session.setAttribute("email", email);
    response.sendRedirect("admin/adminHome.jsp");

// Check for staff login
} else if ("staff@gmail.com".equals(email) && "staff".equals(password)) {
    session.invalidate(); // Invalidate the current session
    session = request.getSession(true); // Create a new session
    session.setAttribute("email", email);
    response.sendRedirect("staff/staffHome.jsp");

} else {
    int z = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
        ps.setString(1, email);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            z = 1;
            session.invalidate(); // Invalidate the current session
            session = request.getSession(true); // Create a new session
            session.setAttribute("email", email);
            response.sendRedirect("home.jsp");
        }

        if (z == 0) {
            response.sendRedirect("login.jsp?msg=notexist");
        }
    } catch (Exception e) {
        System.err.println("Login error: " + e.getMessage());
        response.sendRedirect("login.jsp?msg=invalid");
    }
}
%>