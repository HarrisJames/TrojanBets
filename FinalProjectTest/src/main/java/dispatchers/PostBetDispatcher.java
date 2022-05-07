package dispatchers;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
 * Servlet implementation class PostBetDispatcher
 */
@WebServlet("/postBetDispatcher")
public class PostBetDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;
    String sqlInsertBet = "INSERT INTO Bets(details, wager, user_id, counterUser_id, active, completed, won_id) VALUES (?,?,?,?,?,?,?)";
    static final String sqlGetUserID = "SELECT user_id  as 'result' FROM Users WHERE name = ?";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostBetDispatcher() {
        //super();
    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html");
		
		// getting the user id using cookies and also the name 
    	
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
	
    	
        String error = "";
        
        //get info from request
        String betDetails = request.getParameter("betDetails");
		String wager = request.getParameter("wager");
		int counterUser_id = 0;
		Boolean active = true;
		Boolean completed = false;
		String won_id = null;
		
		//get info on user_id
		
		
		//validate info
		if (betDetails.contentEquals(""))
			error += "<p>Enter a bet description.</p>";
		else if (wager.contentEquals(""))
			error += "<p>Enter a wager or bet amount.</p>";
		
		if (error.equals("")) {
			//send info to SQL using JDBC
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			}catch(Exception e) {
				System.out.println(e);
			}
			try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
				PreparedStatement ps = conn.prepareStatement(sqlInsertBet);) {
				ps.setString(1, betDetails);
				ps.setString(2, wager);
				ps.setInt(3, userID);
				ps.setInt(4, counterUser_id);
				ps.setBoolean(5, active);
				ps.setBoolean(6, completed);
				ps.setString(7, won_id);
				
				ps.execute();
			} catch (SQLException sqle) {
				System.out.println ("SQLException: " + sqle.getMessage());
			}
			Cookie Username = new Cookie("name", URLEncoder.encode(name, "UTF-8"));
			Username.setMaxAge(60*60);
			response.addCookie(Username);
			
			response.sendRedirect("homePage.jsp");
		}
		else
		{
			request.setAttribute("error", error);
			request.getRequestDispatcher("loginPage.jsp").include(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
