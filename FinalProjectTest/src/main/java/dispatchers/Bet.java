package dispatchers;

public class Bet {
	String betDetails;
	String wager;
	int counterUser_id;
	Boolean active;
	Boolean completed;
	String won_id;
	
	public Bet(String betDetails, String wager, int counterUser_id, Boolean active, Boolean completed){
		this.betDetails = betDetails;
		this.wager = wager;
		this.counterUser_id = counterUser_id;
		this.active = active;
		this.completed = completed;
		this.won_id = null;
	}
	
	String getBetDetails() {
		return betDetails;
	}
	
	String getWager() {
		return wager;
	}
	
	int getCounterUser() {
		return counterUser_id;
	}
	
	Boolean getActive() {
		return active;
	}
	
	Boolean getCompleted() {
		return completed;
	}
	
	String getWonID() {
		return won_id;
	}
}
