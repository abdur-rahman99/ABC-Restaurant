<%@page import="project.ConnectionProvider"%>
<%@page import= "java.sql.*" %>
<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	String q1="create table users(name varchar(50),email varchar(50)primary key,mobileNumber bigint,password varchar(100),address varchar(400) )";
	String q2="create table product(id int,name varchar(100),category varchar(100),price int,active varchar(10))";
	String q3="create table cart(email varchar(100),product_id int,quantity int,price int,total int,address varchar(400),mobileNumber bigint,paymentMethod varchar(100),transactionId varchar(100),status varchar(10))";
	String q4="create table query(id int AUTO_INCREMENT,email varchar(100), subject varchar(200), body varchar(500), PRIMARY KEY(id))";
	String q5="create table reservations(reservation_id int AUTO_INCREMENT primary key,name varchar(150) NOT NULL,gmail varchar(150) NOT NULL,members int NOT NULL,reservation_datetime datetime NOT NULL,status varchar(20) DEFAULT 'Pending' )";
	String q6="create table staff (staff_id INT PRIMARY KEY AUTO_INCREMENT,name VARCHAR(100),email VARCHAR(100) UNIQUE, password VARCHAR(100) DEFAULT 'staff')";
	
	
	System.out.println(q1);
	System.out.println(q2);
	System.out.println(q3);
	System.out.println(q4);
	System.out.println(q5);
	System.out.println(q6);
	//System.out.println(q6);
	//st.execute(q1);
	//st.execute(q2);
	//st.execute(q3);
      //st.execute(q4);
     // st.execute(q5);
      st.execute(q6);
   ;
	
	System.out.println("Table Created");
	con.close(); 
}
catch (Exception e)
{
	
	System.out.print(e);
}

%>



