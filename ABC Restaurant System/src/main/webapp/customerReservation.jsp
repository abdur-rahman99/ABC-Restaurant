<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation - ABC Restaurant</title>
    <link rel="stylesheet" type="text/css" href="css/reservation.css">
    <style >
    /* Navbar styles */
.navbar {
    background-color: #0080FF; /* Theme color */
    padding: 10px;
    color: white;
    font-size: 20px;
    text-align: center;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar .back-button {
    margin-left: 20px;
}

.navbar h1 {
    flex: 1;
    margin: 0;
    text-align: center;
    color: #f5f808; /* Primary color for heading */
}

.navbar a {
    text-decoration: none;
    color: white;
    font-size: 16px;
    margin-right: 20px;
}

/* Reservation Form Container */
.container {
    max-width: 100%;
    padding: 50px;
    background-color: #f5f808; /* Yellow background for the form */
    margin: 15px auto;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.container h1 {
    text-align: center;
    color: #0080FF; /* Blue text for the heading */
}

/* Form styling */
.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-size: 18px;
    color: #0080FF; /* Blue labels */
}

.input-style {
    width: 100%; /* Full width input fields */
    padding: 10px;
    border: 2px solid #0080FF; /* Blue border */
    border-radius: 4px;
    font-size: 16px;
}

/* Button styling */
.button {
    width: 100%; /* Full-width button */
    padding: 10px;
    background-color: #0080FF; /* Blue background */
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 18px;
    cursor: pointer;
}

.button:hover {
    background-color: #005bb5; /* Darker blue on hover */
}
 .back-button {
            padding: 5px 10px;
            background-color:   #f5f808;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    
    
    </style>
    
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <a href="home.jsp" class="back-button">Back</a>
        <h1>ABC Restaurant</h1>
        <span></span> <!-- Empty span to balance the flex -->
    </div>

    <div class="container">
        <h1>Make a Reservation</h1>

        <!-- Update form action to point to submitReservation.jsp -->
        <form action="submitReservation.jsp" method="POST">
            <div class="form-group">
                <label for="name">Customer Name:</label>
                <input type="text" id="name" name="name" class="input-style" required>
            </div>

            <div class="form-group">
                <label for="gmail">Email:</label>
                <input type="email" id="gmail" name="gmail" class="input-style" required>
            </div>

            <div class="form-group">
                <label for="members">Number of Members:</label>
                <input type="number" id="members" name="members" class="input-style" required>
            </div>

            <div class="form-group">
                <label for="datetime">Date & Time:</label>
                <input type="datetime-local" id="datetime" name="datetime" class="input-style" required>
            </div>

            <button type="submit" class="button">Submit Reservation</button>
        </form>
    </div>
</body>
</html>
