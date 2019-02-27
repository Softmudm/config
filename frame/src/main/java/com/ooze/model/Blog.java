package com.ooze.model;

public class Blog {
	private Integer blogId;
	private String title;
	private Integer kindsId;
	private String content;
	private Integer userId;
	private String userName;
	
	public Integer getBlogId() {
		return blogId;
	}
	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getKindsId() {
		return kindsId;
	}
	public void setKindsId(Integer kindsId) {
		this.kindsId = kindsId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
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
}