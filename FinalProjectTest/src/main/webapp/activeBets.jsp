<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      	
        <title>active bets</title>
         <link rel="stylesheet" href="trojanBetsStyleSheet.css">
        <link href=”bootstrap/css/bootstrap.min.css” rel=”stylesheet” type=”text/css” />
		<script type=”text/javascript” src=”bootstrap/js/bootstrap.min.js”></script>
        
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		
		<link href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body>

 <!-- Header Buttons -->
		<div class="container-fluid px-0">
    	<header>
         <!-- Navbar -->
        <img src="TommyTrojanHead.png" alt="Tommy Trojan Head" class="trojanBetsLogo">
        <nav class="navbar fixed-top navbar-expand-lg navbar-transparent"> <a class="trojanBetsButton" href="homePage.jsp">Trojan Bets</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                
                    <li class="nav-item"> <a class="nav-link" href="homePage.jsp">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="chat.jsp">Chat</a> </li>
                    <li class="nav-item active"> <a class="nav-link" href="Profile.jsp"> Profile</a> </li>
                    <li class="nav-item" style="float: right"> <a class="nav-link" href="loginPage.jsp">Login/Register</a> </li>
                 </ul>
                   
            </div>
        </nav> 
        <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
    <hr>
	</div>

<a href = "Profile.jsp"> Go back to profile</a>
<p> Display a users active bets which depends on users login key </p>

</body>
</html>