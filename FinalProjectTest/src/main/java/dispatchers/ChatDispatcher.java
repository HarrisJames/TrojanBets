package dispatchers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serial;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ChatDispatcher extends HttpServlet {
	
	String sqlInsert = "INSERT INTO Chat (username, Message, created_at) VALUES (?,?,?)";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
    	response.setContentType("text/html");
    	
    	String username = request.getParameter("username");
    	String msg = request.getParameter("msg");
    	SimpleDateFormat date = new SimpleDateFormat("dd-MMM-yyy");
    	Date d = new Date();
    	String created = date.format(d);
    	
		try (Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
				PreparedStatement ps = conn.prepareStatement(sqlInsert);) {
				ps.setString(1, username);
				ps.setString(2, msg);
				ps.setString(3, created);
				ps.execute();
				conn.close();
			} catch (SQLException sqle) {
				System.out.println ("SQLException: " + sqle.getMessage());
			}
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request,response);
	}
	
}