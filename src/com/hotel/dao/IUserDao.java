package com.hotel.dao;

import com.hotel.po.User;

//user相关的接口
public interface IUserDao {
	
	public boolean addUser(User user);
	public User qByUsername(String u_username);
	
}
