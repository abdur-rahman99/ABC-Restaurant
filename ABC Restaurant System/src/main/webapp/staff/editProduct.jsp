<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="staffHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp">Back</a></h2>

<%
String id=request.getParameter("id");
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select *from product where id='"+id+"'");
	while (rs.next())
	{
		
	

%>
<form action="editProductAction.jsp" method="post">
<input type="hidden" name ="id" value="<%out.println(id); %>">

<div class="left-div">
 <h3>Add Name</h3>
 <input class="input-style" type="text" name="name" value="<%=rs.getString(2) %>" required>
 

<hr>
</div>

<div class="right-div">
<h3>Add Category</h3>
  <input class="input-style" type="text" name="category" value="<%=rs.getString(3) %>" required>
<hr>
</div>

<div class="left-div">
<h3>Add Price</h3>
  <input class="input-style" type="number" name="price" value="<%=rs.getString(4) %>" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>



</select>
 <hr>
</div>
<button class="button">Save</button>

 </form>
<%

}
}
catch(Exception e)
{
	System.out.println(e);

}
%>

</body>
<br><br><br>
</body>
</html>