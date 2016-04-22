package com.hotel.po;

import java.sql.Date;

public class RoomBook {
	private int rb_id;
	private int rb_uid;
	private int rb_rid;
	private Date rb_bookdate;
	private Date rb_indate;
	private int rb_status;
	public int getRb_id() {
		return rb_id;
	}
	public void setRb_id(int rb_id) {
		this.rb_id = rb_id;
	}
	public int getRb_uid() {
		return rb_uid;
	}
	public void setRb_uid(int rb_uid) {
		this.rb_uid = rb_uid;
	}
	public int getRb_rid() {
		return rb_rid;
	}
	public void setRb_rid(int rb_rid) {
		this.rb_rid = rb_rid;
	}
	public Date getRb_bookdate() {
		return rb_bookdate;
	}
	public void setRb_bookdate(Date rb_bookdate) {
		this.rb_bookdate = rb_bookdate;
	}
	public Date getRb_indate() {
		return rb_indate;
	}
	public void setRb_indate(Date rb_indate) {
		this.rb_indate = rb_indate;
	}
	public int getRb_status() {
		return rb_status;
	}
	public void setRb_status(int rb_status) {
		this.rb_status = rb_status;
	}
}
