package model;

public class User_login {

	private String username;
	private String password;
	
	
	public User_login() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User_login(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
}
