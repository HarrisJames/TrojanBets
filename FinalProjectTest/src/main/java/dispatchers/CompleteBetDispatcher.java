package dispatchers;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CompleteBetDispatcher
 */
@WebServlet("/CompleteBetDispatcher")
public class CompleteBetDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String sqlSetBalanceWinner = "UPDATE Users SET balance = balance + ? WHERE user_id = ?";
	String sqlSetBalanceLoser = "UPDATE Users SET balance = balance - ? WHERE user_id = ?";
	String sqlGetWager = "SELECT wager as 'result1' FROM Bets WHERE bet_id = ?";
	String sqlGetCUID = "SELECT counterUser_ID as 'result2' FROM Bets WHERE bet_id = ?";
	String getName = "SELECT name from Users WHERE user_id = ?";
	String sqlUpdateWonID = "UPDATE Bets SET won_id = ?, active = 0 WHERE bet_id = ?";
    static final String sqlGetUserID = "SELECT user_ID as 'result' FROM Bets WHERE bet_id = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompleteBetDispatcher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		//get winning user id aka the cookie cause the person who pushed it is the person who won
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
		Integer betID = Integer.parseInt(request.getParameter("BetID"));
    	int userID = 0;
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(sqlGetUserID);) {
			ps.setInt(1, betID);
			ResultSet res = ps.executeQuery();
			res.next();
			userID = res.getInt("result");
			System.out.println("User: "+ userID);
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		// need to get the wager of the bet that it was just clicked on 
		//first get bet id, then get wager and counter user id cause thats what we need for the sql statements
		
		//connect to sql and examine the wager and counter user id where betID == betId
		
		int wager = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps2 = conn.prepareStatement(sqlGetWager);) {
			ps2.setInt(1, betID);
			ps2.execute();
			ResultSet res1 = ps2.executeQuery();
			res1.next();
			wager = res1.getInt("result1");
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		int counterUserID = 0;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps3 = conn.prepareStatement(sqlGetCUID);) {
			ps3.setInt(1, betID);
			ps3.execute();
			ResultSet res2 = ps3.executeQuery();
			res2.next();
			counterUserID = res2.getInt("result2");
			System.out.println("counter: " + counterUserID);
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		String username = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(getName);) {
			ps.setInt(1, userID);
			ResultSet res = ps.executeQuery();
			res.next();
			username = res.getString("name");
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		boolean userWon = name.equals(username);
		
		//code to set the update statement and execute the sql update statement
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps4 = conn.prepareStatement(sqlSetBalanceWinner);) {
			ps4.setInt(1, wager);
			if(userWon) {
				ps4.setInt(2, userID);
			}
			else {
				ps4.setInt(2, counterUserID);
			}
			ps4.execute();
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps5 = conn.prepareStatement(sqlSetBalanceLoser);) {
			ps5.setInt(1, wager);
			if(userWon) {
				ps5.setInt(2, counterUserID);
			}
			else {
				ps5.setInt(2, userID);
			}
			ps5.execute();
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		// Update won_id in Bets
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps6 = conn.prepareStatement(sqlUpdateWonID);) {
			if(userWon) {
				ps6.setInt(1, userID);
			}
			else {
				ps6.setInt(1, counterUserID);
			}
			ps6.setInt(2, betID);
			ps6.execute();
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		response.sendRedirect("Profile.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}


