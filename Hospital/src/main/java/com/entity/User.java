package com.entity;

public class User {
	private int id;
	private String fullName;
	private String email;
	private String passward;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String fullName, String email, String passward) {
		super();
		this.fullName = fullName;
		this.email = email;
		this.passward = passward;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
//	public String getFullName() {
	//	return fullName;
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	//public String getEmail() {
	//	return email;
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassward() {
		return passward;
	}
	public void setPassward(String passward) {
		this.passward = passward;
	}
	public String getFullName() {
		// TODO Auto-generated method stub
		return fullName;
	}
	public String getEmail() {
		// TODO Auto-generated method stub
		return email;  
	}

}
