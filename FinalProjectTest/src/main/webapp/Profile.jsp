<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.URLDecoder" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      	
        <title>Chat</title>
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
<%	

	       			Cookie cookie = null;
			        Cookie[] cookies = null;
			
			         // Get an array of Cookies associated with the this domain
			        cookies = request.getCookies();
					String name = null;
			        if( cookies != null ) {
			           for (int i = 0; i < cookies.length; i++) {
			              cookie = cookies[i];
			              name = URLDecoder.decode(cookie.getValue(), "UTF-8");
			              if(cookie.getName().equals("name")){
			              break;
			              }
			           }
			        }
			        boolean loggedIn = false;
					if(name != null){
						if(cookie.getName().equals("name")){
				              loggedIn = true;
		       			}
					}
%>
<body style= "background-color: grey">

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
                  <li class="nav-item"> <a class="nav-link" href="LogoutDispatcher">Logout</a> </li>
                </ul>
            </div>
           
        </nav> 
         <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
	
	</div>

	
	
	<div class="container d-flex justify-content-center align-items-center">
    <div class="card">
        <div class="upper"> <img src="https://i.imgur.com/Qtrsrk5.jpg" class="img-fluid"> </div>
        <div class="user text-center">
            <div class="profile"> <img src="ProfilePic.PNG" class="rounded-circle" width="100"> </div>
        </div>
        <div class="mt-5 text-center">
            <h4 class="mb-0">USERNAME</h4> <span class="text-muted d-block mb-2">email address</span> <button class="btn btn-primary btn-sm follow">Logout button</button>
            <div class="d-flex justify-content-between align-items-center mt-4 px-4">
                <div class="stats">
                   <h6 class="mb-0">Active Bets</h6> <span> <a href = "activeBets.jsp"><button type="button" class="btn btn-info"> x# Active Bets</button> </a></span> 
                </div>
                <div class="stats">
                    <h6 class="mb-0">Bets Won</h6> <span>60</span>
                </div>
                <div class="stats">
                    <h6 class="mb-0">Current Balance</h6> <span>$35</span>
                </div>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>