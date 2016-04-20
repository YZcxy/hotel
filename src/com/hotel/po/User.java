package com.hotel.po;

import java.util.Date;

public class User {
	private int u_id;
	private String u_username;
	private String u_password;
	private String u_name;
	private String u_idcard;
	private String u_tel;
	private Date u_date;
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	public String getU_idcard() {
		return u_idcard;
	}
	public void setU_idcard(String u_idcard) {
		this.u_idcard = u_idcard;
	}
	public String getU_tel() {
		return u_tel;
	}
	public void setU_tel(String u_tel) {
		this.u_tel = u_tel;
	}
	public Date getU_date() {
		return u_date;
	}
	public void setU_date(Date u_date) {
		this.u_date = u_date;
	}
	@Override
	public String toString() {
		return "User [u_id=" + u_id + ", u_username=" + u_username
				+ ", u_password=" + u_password + ", u_name=" + u_name
				+ ", u_idcard=" + u_idcard + ", u_tel=" + u_tel + ", u_date="
				+ u_date + "]";
	}
	
	
}
