<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart </div>
<%
String msg=request.getParameter("msg");
if("notPossible".equals(msg))
{
%>
<h3 class="alert">There is only one Quantity! So click on remove!</h3>
<%} %>

<%
if("inc".equals(msg))
{
%>
<h3 class="alert">Quantity  Increased Successfully!</h3>
<%} %>

<%
if("dec".equals(msg))
{
%>
<h3 class="alert">Quantity  Decreased Successfully!</h3>
<%} %>

<%
if("removed".equals(msg))
{
%>
<h3 class="alert">Meal Successfully Removed!</h3>
<%} %>
<table>
<thead>

<%
int total=0;
int sno=0;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs1=st.executeQuery("select sum(total) from cart where email='"+email+"'and address is NULL");
	while(rs1.next())
	{
		total=rs1.getInt(1);
	}

%>

          <tr>
            <th scope="col" style="background-color: yellow;">Total:<%out.println(total);%>/- </th>
           <% if (total>0) { %> <th scope="col"><a href="viewOrder.jsp">Order Details</a></th> <%} %>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Meal Name</th>
            <th scope="col">Category</th>
            <th scope="col"> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
            <th scope="col">Remove </th>
          </tr>
        </thead>
        <tbody>
      <%
      ResultSet rs=st.executeQuery("select *from product inner join cart on product.id=cart.product_id and cart.email='"+email+"'and cart.address is NULL  ");
      while (rs.next())
      {
      %>
          <tr>
          <%sno=sno+1; %>

           <td><%out.println(sno); %></td>
            <td><%=rs.getString(2) %></td>
            <td><%=rs.getString(3) %></td>
            <td>Rs. <%=rs.getString(4)%>/-</td>
            <td><a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=inc"> +  |</a>  <%=rs.getString(8) %>  <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec">|  -</a></td>
            <td>Rs.<%= rs.getString(10)%>/- </td>
            <td><a href="removeFromCart.jsp?id=<%=rs.getString(1)%>">Remove </a></td>
          </tr>
<%
      }

}catch(Exception e)
{}
%>
        </tbody>
      </table>
      <br>
      <br>
      <br>

</body>
</html>