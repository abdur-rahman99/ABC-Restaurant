<%@page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    <%String email=session.getAttribute("email").toString(); %>
            <center><h2>ABC RESTAURANT</h2></center>
            <h2><a href=""> Hello <%out.println(email); %></a></h2>
             <h4><a href="home.jsp">Home</a></h4>
             <h4><a href="myCart.jsp">My Cart</a></h4>
            
            <h4> <a href="messageUs.jsp">Submit Query </a></h4>
             <h4><a href="customerReservation.jsp">Make Reservation </a></h4>
               <h4><a href="yourreservation.jsp"> My Reservations </a></h4>
                <h4><a href="gallery.jsp">Gallery </a></h4>
                  <h4><a href="about.jsp">About Us </a></h4>
            <h4> <a href="logout.jsp">Logout </a></h4>
            <div class="search-container">
            <form action="searchHome.jsp" method="post">
            <input type="text" placeholder="Search Here" name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
            
            
            
            </form>
            </div>
            
          </div>
           <br>
           <!--table-->
