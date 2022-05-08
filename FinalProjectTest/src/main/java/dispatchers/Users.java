package dispatchers;
import java.sql.*;

public class Users {
	String username;
	String email;
	int balance;
	
	public Users(String username, String email, int balance){
		this.username = username;
		this.email = email;
		this.balance = balance;
	}
	
	public String getusername() {
		return username;
	}
	
	public String getemail() {
		return email;
	}
	
	public int getBalance() {
		return balance;
	}
	
	public int calcTotalBets() {
		int result = 0;
		try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(Constant.url,Constant.DBUserName, Constant.DBPassword);
			//get user_id from database
            PreparedStatement ps = conn.prepareStatement("SELECT user_id FROM users WHERE name = ?");
            ps.setString(1, username);
			ResultSet res = ps.executeQuery();
			res.next();
			int user_id = res.getInt("user_id");
			
			//count bets
			PreparedStatement s2 = conn.prepareStatement("SELECT COUNT(*) AS 'result' FROM Bets WHERE won_id = ?");
			s2.setInt(1, user_id);
			res = s2.executeQuery();
			res.next();
			result = res.getInt("result");
			
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        catch(SQLException e) {
        	e.printStackTrace();
        }
		
		return result;
	}
		
}
