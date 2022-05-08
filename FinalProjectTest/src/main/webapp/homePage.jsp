<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.net.URLDecoder" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %> 
<%@ page import="dispatchers.Bet"%> 
<%@ page import="dispatchers.Constant"%> 




 
  


    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Home</title>
       
      
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
    <body>
       
		
		 <!-- Header Buttons -->
		<div class="container-fluid px-0">
    	<header>
         <!-- Navbar -->
        <img src="TommyTrojanHead.png" alt="Tommy Trojan Head" class="trojanBetsLogo">
        <nav class="navbar fixed-top navbar-expand-lg navbar-transparent"> <a class="trojanBetsButton" href="homePage.jsp">Trojan Bets</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                
                    <li class="nav-item active"> <a class="nav-link" href="homePage.jsp">Home <span class="sr-only">(current)</span></a> </li>
                    <%if(loggedIn){%>
                    <li class="nav-item"> <a class="nav-link" href="chat.jsp"><%out.print("Chat"); %></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="Profile.jsp"><%out.print("Profile"); %></a> </li>
                    <li class="nav-item" style="float: right"> <a class="nav-link" href="LogoutDispatcher"><%out.print("Logout"); %></a> </li>
                    <% } %>
                    <%if(!loggedIn){%>
                    <li class="nav-item" style="float: right"> <a class="nav-link" href="loginPage.jsp"><%out.print("Login/Register"); %></a> </li>
                    <% } %>
                 </ul>
                   
            </div>
        </nav> 
        <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
    <hr>
	</div>
		
		
	
	 <!--  <a href="postbet.jsp" class="btn btn-primary btn-lg btn-block" role="button" aria-pressed="true" data-toggle="modal" data-target="#exampleModalCenter">POST BET</a> -->
	<!-- Button trigger modal -->

	<%if(loggedIn){ %>
	<button name = "postButton" type="button" class="btn btn-primary btn-lg btn-block" data-toggle="modal" data-target="#exampleModalCenter">
	  		POST BET
	</button>
	<%} %>


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <form name ="PostBetForm" action="postBetDispatcher" method="POST">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">New Bet</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="col-md-12">
         <div class="form-group"> <label for="form_message">Bet Description</label> <input type = "text" id = "betDetails" name="betDetails" rows = "3" class="form-control" placeholder="Write the details of your bet here" rows="4" required="required" data-error="Please, leave us a message."> </div> 
       </div>
       <label for="wageramount">Wager Amount:</label><br>
       <input type="number" id="wager" name="wager" min="1" max="100"><br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Close</button>
        <input type="submit" class="btn btn-outline-primary" value = "Post Bet">
      </div>
      </form> <!-- End of form -->
      
    </div>
  </div>
</div>
    <%
    	ArrayList<Bet> data = new ArrayList<Bet>();
    	String sqlQuery = "SELECT details, wager, Bets.user_id, Users.name FROM Bets INNER JOIN Users ON Bets.user_id = Users.user_id WHERE active = 1 ORDER BY bet_id DESC";
    	try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(sqlQuery);
			ResultSet res = ps.executeQuery();
			while(res.next()){
				String betUserName = res.getString("name");
				if(name == null || !name.equals(betUserName)){
					data.add(new Bet(res.getString("details"), res.getInt("wager"), res.getInt("user_id"), betUserName, true));
				}
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
						<p> Bettor_Username: <%out.print(bet.getUsername());%> </p>
						<p> Bet Description: <%out.print(bet.getDetails()); %> </p>
						<p> Bet Amount: <%out.print(bet.getWager()); %> </p>
						<%if(loggedIn){%>
						<button name = "AcceptBetButton" type="button" class="btn btn-success" data-toggle="modal" data-target="#AcceptBetModal">
	  					Accept BET
						</button>
						
						<% } %>
						</div>
					</div>
					</div>
				</div>
				
				<!-- Modal for Accepting Bet -->
<div class="modal fade" id="AcceptBetModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
    <form name ="PostBetForm" action="postBetDispatcher" method="POST">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Do you want to accept this bet?</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <button type="button" class="btn btn-outline-danger" data-dismiss="modal">Return to Home Page</button>
        <input type="submit" class="btn btn-outline-success" value = "Accept Bet">
      </div>
      </form> <!-- End of form -->
      
    </div>
  </div>
</div>
	<!--  -->
	  
    <% } %>
    </body>

    </html>