<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.ServletException"%>
<%
		// getting the user id using cookies and also the name 
    	String username = null;
		Cookie cookie = null;
        Cookie[] cookies = null;

         // Get an array of Cookies associated with the this domain
        cookies = request.getCookies();
        if( cookies != null ) {
           for (int i = 0; i < cookies.length; i++) {
              cookie = cookies[i];
              username = URLDecoder.decode(cookie.getValue(), "UTF-8");
              if(cookie.getName().equals("name")){
            	  break;
              }
           }
        }
        boolean loggedIn = false;
		if(username != null){
			if(cookie.getName().equals("name")){
	              loggedIn = true;
   			}
		}
%>
<head>
<script type="text/javascript" src="Chat.js"></script>
<script>setInterval(reloadChat,3000)</script>
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
                    <li class="nav-item"> <a class="nav-link" href="LogoutDispatcher">Logout</a> </li>
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
        <input style="display:none" type="text" id="user" value="<%=username%>">
        <!--=========================================================-->
        <!-- selected chat -->
    	<div class="col-md-12 bg-white ">
            <div class="chat-message">
            <div class="ps-container ps-theme-default ps-active-y" id="chat-content" style="overflow-y: scroll !important; height:500px !important;">
                <ul id = 'chatroom' class="chat">
			       <%
			           Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/CSCI_Project","root", "root");
			           Statement statement = connection.createStatement();
			           ResultSet rs = statement.executeQuery("SELECT * from Chat") ;
			           
						while(rs.next()) {
							String usern = rs.getString(1);
							String msg = rs.getString(2);
							String date = rs.getString(3);
							out.print("<p>"+usern+"-<g>"+msg+"</g><br><small>"+date+"</small></p>");
						}
			       %>
			    </ul>
            </div>
            </div>
            <div class="chat-box bg-white">
            	<div id = 'i' class="input-group">
            	<form role="form" method="POST" action="ChatDispatcher">
            		<input type="text" name="msg" id = "msg" class="form-control border no-shadow no-rounded" placeholder="Type your message here">
            		<input style="display:none" type="text" id="user" value="<%=username%>">
            		<span class="input-group-btn">
            		<input type="submit" class="btn btn-lg btn-primary" value="Send" onclick="addText()">
            		</span>
            	</form>
            	</div><!-- /input-group -->	
            </div>            
		</div>
		<div class="col"></div>        
	</div>
</div>

</body>
</html>
