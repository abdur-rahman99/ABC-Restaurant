<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home </div>
<%
String msg=request.getParameter("msg");
if ("added".equals(msg))
{	
%>
<h3 class="alert">Meal successfully added to cart!</h3>
<%} %>

<%

if ("exist".equals(msg))
{	
%>

<h3 class="alert">This meal already exist in you cart! Quantity  increased!</h3>
<%} %>

<%

if ("invalid".equals(msg))
{	
%>
<h3 class="alert">Something went wrong! Try Again!</h3>
<%} %>
<table>
        <thead>
          <tr>
            <th scope="col">ID</th>
            <th scope="col">Name</th>
            <th scope="col">Category</th>
            <th scope="col">Price</th>
            <th scope="col">Add to cart </th>
          </tr>
        </thead>
        <tbody>
<%
try{
	
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where active='Yes'");
	while(rs.next())
	{

%>
          <tr>
            <td><%=rs.getString(1) %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td>Rs.<%=rs.getString(4) %>/-</td>
            <td><a href="addToCartAction.jsp?id=<%=rs.getString(1) %>">Add to cart </a></td>
          </tr>
 <%
}
}
catch(Exception e)
{
	System.out.println(e);
}
 %>         
         

        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>