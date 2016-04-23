package com.hotel.dao;

import java.util.List;

import com.hotel.po.Admin;
import com.hotel.po.User;

//user相关的接口
public interface IUserDao {
	
	public boolean addUser(User user);
	
	public User qByUsername(String u_username);
	
	public Admin qAdByUsername(String ad_username);
	
	public List<User> qAllUser();
	
	public boolean updateUser(User user);
	
	public boolean deleteUser(int u_id);
	
	public List<Admin> qAllAdmin();
	
	public boolean addAdmin(Admin admin);
	
	public boolean deleteAdmin(int ad_id);
	
	public boolean updateAdmin(Admin admin);
	
}
