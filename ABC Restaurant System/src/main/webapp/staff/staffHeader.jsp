<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    
   
    <%String email=session.getAttribute("email").toString(); %>
   
            <center><h2>ABC RESTAURANT</h2></center>
             <center><h4>Staff Panel</h4></center>
             
             
           <h4> <a href="addNewProduct.jsp">Add New Meal</a></h4>
            <h4><a href="allProductEditProduct.jsp">All Meals & Edit Meals </a></h4>
            <h4><a href="messagesReceived.jsp">Customer Query </a></h4>
            <h4><a href="manageReservations.jsp">Customer Reservations </a></h4>
         
            <h4><a href="../logout.jsp">Logout </a></h4>
          </div>
           <br>
           <!--table-->
