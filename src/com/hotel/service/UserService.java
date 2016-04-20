package com.hotel.service;

import java.sql.Date;

import com.hotel.dao.IUserDao;
import com.hotel.factory.DAOFactory;
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
		if(password.equals(mes.getU_password())){
			return true;
		}
		return false;
	}

}
