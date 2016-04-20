package com.hotel.factory;

import com.hotel.dao.IUserDao;
import com.hotel.dao.impl.UserDao;

public class DAOFactory {
	public static IUserDao getUserDao(){
		return new UserDao();
	}
}
