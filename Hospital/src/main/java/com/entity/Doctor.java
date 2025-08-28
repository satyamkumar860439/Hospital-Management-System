package com.entity;

public class Doctor {
 private int id;
 private String FullName;
 private String dob;
 private String qualification;
 private String Specialist;
 private String email;
 private String MobNo;
 private String passward;
 
public Doctor() {
	super();
	// TODO Auto-generated constructor stub
}

public Doctor(String fullName, String dob, String qualification, String specialist, String email, String mobNo,String passward) {
	super();
	FullName = fullName;
	this.dob = dob;
	this.qualification = qualification;
	Specialist = specialist;
	this.email = email;
	MobNo = mobNo;
	this.passward=passward;
}

public Doctor(int id, String fullName, String dob, String qualification, String specialist, String email, String mobNo,
		String passward) {
	super();
	this.id = id;
	FullName = fullName;
	this.dob = dob;
	this.qualification = qualification;
	Specialist = specialist;
	this.email = email;
	MobNo = mobNo;
	this.passward = passward;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getFullName() {
	return FullName;
}
public void setFullName(String fullName) {
	FullName = fullName;
}
public String getDob() {
	return dob;
}
public void setDob(String dob) {
	this.dob = dob;
}
public String getQualification() {
	return qualification;
}
public void setQualification(String qualification) {
	this.qualification = qualification;
}
public String getSpecialist() {
	return Specialist;
}
public void setSpecialist(String specialist) {
	Specialist = specialist;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getMobNo() {
	return MobNo;
}
public void setMobNo(String mobNo) {
	MobNo = mobNo;
}
public String getPassward() {
	return passward;
}
public void setPassward(String passward) {
	this.passward = passward;
}

}
