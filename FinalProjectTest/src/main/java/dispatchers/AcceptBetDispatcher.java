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
 * Servlet implementation class AcceptBetDispatcher
 */
@WebServlet("/AcceptBetDispatcher")
public class AcceptBetDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// i dont know if the sqlSetCounterID statement is correct... or if im setting the string right later
	String sqlSetCounterID = "UPDATE Bets SET counterUser_id = ? WHERE bet_id = ?";
    static final String sqlGetUserID = "SELECT user_id  as 'result' FROM Users WHERE name = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AcceptBetDispatcher() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		//get the userID of the user that is logged in, this will be the user ID that is set to counterUserID
		//cause they are the one accepting the bet
		
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
            	  System.out.println("Cookie:" + name);
            	  break;
              }
           }
        }
		
    	int userID = 0;
    	try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(sqlGetUserID);) {
			ps.setString(1, name);
			ResultSet res = ps.executeQuery();
			res.next();
			userID = res.getInt("result");
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		//Get information about which bet "accept bet is being clicked on" aka find betID
		int betID = 0;
		//write code to figure out what the betID is
		//NEEDS TO BE DONE
		
		
		//code to set the update statement and execute the sql update statement
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(Exception e) {
			System.out.println(e);
		}
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			PreparedStatement ps = conn.prepareStatement(sqlSetCounterID);) {
			ps.setInt(1, userID);
			ps.setInt(2, betID);
			ps.execute();
		} catch (SQLException sqle) {
			System.out.println ("SQLException: " + sqle.getMessage());
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
