<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="footer.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/addressPaymentForOrder-style.css">

<title>Home</title>

<script>
if (window.history.forwart(1) !=null)
	window.history.forword(1);</script>

</head>
<body>
<br>
<table>
<thead>
<%
String email=session.getAttribute("email").toString();
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
          <th scope="col"><a href="myCart.jsp"> Back</a></th>
            <th scope="col" style="background-color: yellow;">Total: <%out.println(total); %>/- </th>
          </tr>
        </thead>
        <thead>
          <tr>
          <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">Category</th>
            <th scope="col"> price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Sub Total</th>
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
            <td>Rs.<%=rs.getString(4)%>/-</td>
            <td><%=rs.getString(8) %> </td>
            <td> Rs.<%= rs.getString(10)%>/-</td>
            </tr>
            <%
            }
          
      ResultSet rs2=st.executeQuery("select *from users where email='"+email+"'   ");
      while(rs2.next())
      {
      %>
         
        </tbody>
      </table>
      
<hr style="width: 100%">

<%
      }         
}
catch(Exception e)
{
	System.out.println(e);
}
%>
      <br>
      <br>
      <br>

</body>
</html>