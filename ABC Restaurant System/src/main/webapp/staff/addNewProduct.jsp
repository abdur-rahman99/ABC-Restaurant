<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="staffHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Meal</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>

<h3 class="alert">New Meal Added Successfully!</h3>
<%} %>

<%

if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%
int id=1;
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select max(id) from product");
	while(rs.next())
	{
		id=rs.getInt(1);
		id=id+1;
	}
	
}
catch(Exception e)
{}

%>

<form action="addNewProductAction.jsp" method="post">
<h3 style="color: yellow;">Meal ID: <%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">


<div class="left-div">
 <h3>Meal Name</h3>
 <input class="input-style" type="text" name="name" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Meal Category</h3>
  <input class="input-style" type="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
  <input class="input-style" type="number" name="price" placeholder="Enter Price" required>
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
</body>
<br><br><br>
</body>
</html>