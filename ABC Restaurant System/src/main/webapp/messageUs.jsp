<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<title>Message Us</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Submit Query </div>
<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
	
%>
<h3 style="text-align:center; color:yellow;">Query successfully sent. Our team will respond to you via email!</h3>
<%} %>

<%
if("invalid".equals(msg))
{
	
%>
<h3 style="text-align:center; color:yellow; ">Some thing Went Wrong! Try Again!</h3>
<%} %>

<form action="messageUsAction.jsp" method= "post" >
<input class="input-style" name="subject" type="text" placeholder="Subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter Your Query Here" required></textarea>
<hr>
<button class="button" type="submit">Submit</button>
</form>

<br><br><br>
</body>
</html>