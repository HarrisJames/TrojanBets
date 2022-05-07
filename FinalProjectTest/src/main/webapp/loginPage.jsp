<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>

    <!DOCTYPE html>
    <html>

    <head>
      	<meta charset="utf-8">
      	
        <title>Login_Register</title>
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
   
    
    <!-- OLD NAV BAR DON"T DELETE YET -->
    <!--  
    <div class = "NavBar">
			<a class = "loginbutton" href="loginPage.jsp" >Login/Register</a>
			<a class = "homebutton" href="homePage.jsp" >Home</a>
			<img src="TommyTrojanHead.png" alt="Tommy Trojan Head" class="trojanBetsLogo">
			<a class = "trojanBetsButton" href="homePage.jsp" >TrojanBets</a>
	</div>
	
    
    <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
	<hr>
		-->
		
		<div class="container-fluid px-0">
    <header>
         <!-- Navbar -->
        <img src="TommyTrojanHead.png" alt="Tommy Trojan Head" class="trojanBetsLogo">
        <nav class="navbar fixed-top navbar-expand-lg navbar-transparent"> <a class="trojanBetsButton" href="homePage.jsp">Trojan Bets</a> <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                
                    <li class="nav-item"> <a class="nav-link" href="homePage.jsp">Home <span class="sr-only">(current)</span></a> </li>
                    <li class="nav-item"> <a class="nav-link" href="chat.jsp">Chat</a> </li>
                    <li class="nav-item"> <a class="nav-link" href="Profile.jsp"> Profile</a> </li>
                    <li class="nav-item active"> <a class="nav-link" href="loginPage.jsp">Login/Register</a> </li>
                 </ul>
            </div>
        </nav> <!-- ./ end of navbar -->
        <img src="TrojanBetsBanner.JPG" alt="Classic Greek Pattern" class="banner">
    </header>
    <hr>
	</div>
		
    <!-- LOGIN AND REGISTER FORMS -->
       	<div class="container-fluid">
		<div class="container">
	
			<div class="row">
				
				<div class="col-md-1">
					<!-------null------>
				</div>
				
				<div class="col-md-5">
 				 		<form role="form" method="GET" action="Login">
						<fieldset>							
							<p class="text-uppercase"> LOG IN: </p>	
 								
							<div class="form-group">
								<input type="text" name="username" id="username" class="form-control input-lg" placeholder="Username">
							</div>
							<div class="form-group">
								<input type="password" name="password" id="password" class="form-control input-lg" placeholder="Password">
							</div>
							<div>
								<input type="submit" class="btn btn-md" value="Sign In">
							</div>
								 
 						</fieldset>
				</form>	
				</div>
				<div class="col-md-5">
 					<form role="form" method="POST" action="RegisterDispatcher">
						<fieldset>							
							<p class="text-uppercase pull-center"> SIGN UP:</p>	
 							<div class="form-group">
								<input type="text" name="regName" id="regName" class="form-control input-lg" placeholder="Username">
							</div>
 
							<div class="form-group">
								<input type="email" name="regEmail" id="regEmail" class="form-control input-lg" placeholder="Email Address">
							</div>
							<div class="form-group">
								<input type="password" name="regPassword" id="regPassword" class="form-control input-lg" placeholder="Password">
							</div>
								<div class="form-group">
								<input type="password" name="confirmPass" id="confirmPass" class="form-control input-lg" placeholder="Confirm Password">
							</div>
							<div class="form-check">
								<label class="form-check-label">
								  <input type="checkbox" class="form-check-input">
								  <p></p><br>
								  Read our <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> before registering
								</label>
							  </div>
 							<div>
 								<input type="submit" class="btn btn-lg btn-primary   value="Register">
 							</div>
						</fieldset>
					</form>
				</div>
				
			</div>
		</div>
		
	</div>
	
	<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms and Conditions</h4>
			</div>
			<div class="modal-body">
				<p>By registering for Trojan Bets, you agree to respect other's privacy and not share bet details outside of this site. Do not share personal information of others. </p>
				<p>No real money is exchanged on this site, and all bets placed are final! </p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
 
    </body>

    </html>