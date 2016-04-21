package com.hotel.dao;

import com.hotel.po.Admin;
import com.hotel.po.User;

//user相关的接口
public interface IUserDao {
	
	public boolean addUser(User user);
	
	public User qByUsername(String u_username);
	
	public Admin qAdByUsername(String ad_username);
}
