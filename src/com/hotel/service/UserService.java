package com.hotel.service;

import java.sql.Date;
import java.util.List;

import com.hotel.dao.IUserDao;
import com.hotel.factory.DAOFactory;
import com.hotel.po.Admin;
import com.hotel.po.User;
import com.hotel.util.MD5Util;

public class UserService {
	
	private static IUserDao u = DAOFactory.getUserDao();
	private static String reason = null;

	
	//验证用户名是否已经被注册
	public static boolean registerCheck(User user) {
		User mes = u.qByUsername(user.getU_username());
		if(mes == null){
			return true;
		}else{
			return false;
		}
	}

	//进行注册
	public static boolean register(User user) {
		if(user.getU_password() == null){
			return false;
		}
		Date datatime = new Date(System.currentTimeMillis());
		user.setU_date(datatime);
		user.setU_password(MD5Util.MD5(user.getU_password()));
		boolean flag = u.addUser(user);
		return flag;
	}
	
	//验证用户名密码是否正确
	public static boolean loginCheck(User user){
		User mes = u.qByUsername(user.getU_username());
		String password = MD5Util.MD5(user.getU_password());
		if(mes != null){
			if(password.equals(mes.getU_password())){
				return true;
			}
		}
		return false;
	}
	
	//验证管理员的用户名和密码
	public static Admin adLoginCheck(Admin admin){
		Admin mes = u.qAdByUsername(admin.getAd_username());
		String password = MD5Util.MD5(admin.getAd_password());
		if(mes != null){
			if(password.equals(mes.getAd_password())){
				return mes;
			}
		}
		return null;
	}
	
	//返回查到的user数组
	public static List<User> loadAllUser(){
		List<User> list = u.qAllUser();
		return list;
	}
	
	//返回是否修改成功
	public static boolean updateUser(User user){
		if(user.getU_id() == 0){
			return false;
		}
		boolean flag = u.updateUser(user);
		
		return flag;
	}
	
	//返回是否成功删除
	public static boolean deleteUser(User user){
		if(user.getU_id() == 0){
			return false;
		}
		boolean flag = u.deleteUser(user.getU_id());
		
		return flag;
	}
}
