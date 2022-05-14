package dispatchers;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serial;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;


@WebServlet("/reloadChat")

public class reloadChat extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
		try {
			response.setContentType("text/html");
			Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			String sqlScript = "SELECT * FROM Chat";
			PreparedStatement ps2 = conn.prepareStatement(sqlScript);
			ResultSet rs = ps2.executeQuery();
			
			while(rs.next()) {
				String username = rs.getString(1);
				String msg = rs.getString(2);
				String date = rs.getString(3);
				PrintWriter out = response.getWriter();
				out.print("<p>"+username+"-<g>"+msg+"</g><br><small>"+date+"</small></p>");
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		doGet(request,response);
	}
}
	