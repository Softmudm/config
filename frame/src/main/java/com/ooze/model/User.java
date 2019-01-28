package com.ooze.model;

public class User {
	private Integer userId;
	private String userName;
	private String password;
	private String account;
 
	public Integer getUserId() {
		return userId;
	}
 
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
 
	public String getUserName() {
		return userName;
	}
 
	public void setUserName(String userName) {
		this.userName = userName;
	}
 
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", password=" + password + ", account=" + account + "]";
	}
	
}