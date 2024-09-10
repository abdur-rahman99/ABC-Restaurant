<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  
    <form action="signupAction.jsp" method="post">
    <input type="text" name="name" placeholder="Name" required >
    <input type="email" name="email" placeholder="Email" required >
    <input type="number" name="mobile" placeholder="Mobile Number" required >
    <input type="password" name="password" placeholder="Password" required >
    <input type="submit" value="signup" >
    
    
    </form>
    
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  
  <%
  String msg=request.getParameter("msg");
  
  if("valid".equals(msg))
  {
	  %>
	  
	  <h1>Successfully Registered !!</h1>
   <% }%>


  <%
 
  if("invalid".equals(msg))
  {
	  %>
	  
	<h1>OOPS!</h1> 
<h1>Some thing Went Wrong! Try Again !</h1>
   <% }%>




    <h1 style="color: black">ABC Restaurant</h1> 
    <h3 style="color: black ">Foodie, Welcome </h3>
   
  </div>
</div>

</body>
</html>