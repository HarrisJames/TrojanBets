package dispatchers;

public class Bet {
	String betDetails;
	int wager;
	int user_id;
	String username;
	int counterUser_id;
	Boolean active;
	Boolean completed;
	String won_id;
	
	public Bet(String betDetails, int wager, int user_id, String username, Boolean active){
		this.betDetails = betDetails;
		this.wager = wager;
		this.user_id = user_id;
		this.username = username;
		this.counterUser_id = 0;
		this.active = active;
		this.completed = false;
		this.won_id = null;
	}
	
	public String getDetails() {
		return betDetails;
	}
	
	public int getWager() {
		return wager;
	}
	
	public int getUserID() {
		return user_id;
	}
	
	public String getUsername() {
		return username;
	}
	
	public int getCounterUser() {
		return counterUser_id;
	}
	
	public Boolean getActive() {
		return active;
	}
	
	public Boolean getCompleted() {
		return completed;
	}
	
	public String getWonID() {
		return won_id;
	}
}
