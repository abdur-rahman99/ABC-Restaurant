

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery - ABC Restaurant</title>
    <link rel="stylesheet" type="text/css" href="css/gallery.css">
    
    <style>
    .navbar {
            background-color: #f5f808 ; 
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
            color: #0080FF; 
        }

        .navbar a {
            text-decoration: none;
            color: white;
            font-size: 16px;
            margin-right: 20px;
            
        }
        
         .back-button {
            padding: 5px 10px;
            background-color:  #0080FF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #005bb5;
        }
    
    
    </style>
</head>
<body>
   
       <div class="navbar">
        <a href="home.jsp" class="back-button">Back</a>
        <h1>ABC Restaurant</h1>
        <span></span>
    </div>

    <!-- Gallery Content -->
    <div class="gallery-container">
        <h1>Our Delicious Meals</h1>
        <div class="gallery-grid">
            <div class="gallery-item">
                <img src="image/meal1.png" alt="Meal 1">
            </div>
            <div class="gallery-item">
                <img src="image/meal2.png" alt="Meal 2">
            </div>
            <div class="gallery-item">
                <img src="image/meal3.png" alt="Meal 3">
            </div>
            <div class="gallery-item">
                <img src="image/meal4.png" alt="Meal 4">
            </div>
            <div class="gallery-item">
                <img src="image/meal5.png" alt="Meal 5">
            </div>
            <div class="gallery-item">
                <img src="image/meal6.png" alt="Meal 6">
            </div>
            <div class="gallery-item">
                <img src="image/meal7.png" alt="Meal 7">
            </div>
            <div class="gallery-item">
                <img src="image/meal8.png" alt="Meal 8">
            </div>
            
        </div>
    </div>
</body>
</html>
