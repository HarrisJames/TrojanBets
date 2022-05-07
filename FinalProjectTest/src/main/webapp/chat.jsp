<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="Chat.js"></script>
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
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div class="container-fluid px-0">
    <header>
         <!-- Navbar -->
        <img src="TommyTrojanHead.png" alt="Tommy Trojan Head" class="trojanBetsLogo">
        <nav class="navbar fixed-top navbar-expand-lg navbar-transparent"> <a class="trojanBetsButton" href="homePage.jsp">Trojan Bets</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                
                    <li class="nav-item"> <a class="nav-link" href="homePage.jsp">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item active"> <a class="nav-link" href="chat.jsp">Chat</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="Profile.jsp"> Profile</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="loginPage.jsp">Login/Register</a> </li>
                 </ul> 
            </div>
        </nav> <!-- ./ end of navbar -->
        <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
    <hr>
	</div>
	
<div class="container bootstrap snippets bootdey">
    <div class="row">
        <div class="col"></div>
        <!--=========================================================-->
        <!-- selected chat -->
    	<div class="col-md-12 bg-white ">
            <div class="chat-message">
            <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:500px !important;">
                <ul id = 'chatroom' class="chat">
                </ul>
            </div>
            </div>
            <div class="chat-box bg-white">
            	<div id = 'i' class="input-group">
            		<input id = 'message' class="form-control border no-shadow no-rounded" placeholder="Type your message here">
            		<span class="input-group-btn">
            			<input type="button" class="btn btn-success no-rounded" value = "Send" onclick="addText()" />
            		</span>
            	</div><!-- /input-group -->	
            </div>            
		</div>
		<div class="col"></div>        
	</div>
</div>

</body>
</html>
