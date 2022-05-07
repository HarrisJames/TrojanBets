package dispatchers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import Util.Constant;
//import Util.UserHelper;

import java.io.IOException;
import java.io.Serial;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class LoginDispatcher
 */

@WebServlet("/Login")
public class LoginDispatcher extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    
    public LoginDispatcher() {}
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	response.setContentType("text/html");
        String error = "";
        
        //get info from request
        String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		//validate info
		if (username.contentEquals(""))
			error += "<p>Email Field Empty</p>";
		else if (password.contentEquals(""))
			error += "<p>Password Field Empty</p>";
		else if (!userHelper.checkExisting(username)) {
			error += "<p>No Account Exists, Please Register</p>";
		}
		
		else if (!userHelper.checkPassword(username, password)) {
			error += "<p>Invalid Password</p>";
		}
		
	
		if (error.equals("")) {
			//set cookie
			Cookie name = new Cookie("name", URLEncoder.encode(username, "UTF-8"));
			name.setMaxAge(60*60);
			response.addCookie(name);
			response.sendRedirect("homePage.jsp");
		}
		else
		{
			request.setAttribute("error", error);
			request.getRequestDispatcher("loginPage.jsp").include(request, response);
		}

    	
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
