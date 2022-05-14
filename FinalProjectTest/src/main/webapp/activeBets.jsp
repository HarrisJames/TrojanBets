<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %> 
<%@ page import="dispatchers.Bet"%> 
<%@ page import="dispatchers.Constant"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
      	
        <title>Active Bets</title>
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
			int userID = 0;	
			try {
				String getUserIDSQL = "SELECT user_id from Users WHERE name = ?";
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
				PreparedStatement ps = conn.prepareStatement(getUserIDSQL);
				ps.setString(1, name);
				ResultSet res = ps.executeQuery();
				res.next();
				userID = res.getInt("user_id");
				
				
	        } catch (ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        catch(SQLException e) {
	        	e.printStackTrace();
	        }		
     %>

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
                    <li class="nav-item" style="float: right"> <a class="nav-link" href="homePage.jsp">Logout</a> </li>
                 </ul>
                   
            </div>
        </nav> 
        <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
    <hr>
	</div>

 <%
    	ArrayList<Bet> data = new ArrayList<Bet>();
    	String sqlQuery = "SELECT details, wager, Bets.user_id, counterUser_id, Users.name, bet_id FROM Bets INNER JOIN Users ON Bets.user_id = Users.user_id WHERE active = 1 AND (counterUser_id = ? OR Bets.user_id = ?) AND counterUser_id != 0 ORDER BY bet_id DESC";
    	try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			ps.setInt(1, userID);
			ps.setInt(2, userID);
			ResultSet res = ps.executeQuery();
			while(res.next()){
				data.add(new Bet(res.getInt("bet_id"), res.getString("details"), res.getInt("wager"), res.getInt("user_id"), res.getString("name"), true));
			}
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(SQLException e) {
        	e.printStackTrace();
        }
    %>
    
    <!-- Change layout below -->
    <h1 style="border-bottom:1px solid silver">Active Bets</h1>
    <% if(data.isEmpty()){%>
    	<p> No Active Bets! Check back Later!</p>
    <% } %>
    <% for(Bet bet: data){ %>
	  	<div class="media" style = "border-bottom:1px solid silver">
					<div class="media-body" style="margin-top:10px">
					<div class="row">
					<div class ="col-md-1"><img src="BettingIcon.PNG" alt="Classic Greek Pattern" ></div>
					<div class ="col-md-8">
						<p style = "color: red; font-size: 30px"> Bet Information <p>
						<p> Posted By: <%out.print(bet.getUsername());%> </p>
						<p> Bet Description: <%out.print(bet.getDetails()); %> </p>
						<p> Bet Amount: <%out.print(bet.getWager()); %> </p>
						<%if(loggedIn){%>
						
						<form action = "CompleteBetDispatcher" method = "GET">
							<input type= "hidden" name = "BetID" value = "<%out.print(bet.getBetID());%>">
							<button type="submit" class="btn btn-success" data-toggle="modal" data-target="#AcceptBetModal">
		  						I won this bet!
							</button>
						</form>
						
						<% } %>
						</div>
					</div>
					</div>
				</div>
	<!--  -->
	  
    <% } %>

</body>
</html>