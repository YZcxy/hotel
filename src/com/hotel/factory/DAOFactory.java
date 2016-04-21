package com.hotel.factory;

import com.hotel.dao.IRoomTypeDao;
import com.hotel.dao.IUserDao;
import com.hotel.dao.impl.RoomTypeDao;
import com.hotel.dao.impl.UserDao;

public class DAOFactory {
	public static IUserDao getUserDao(){
		return new UserDao();
	}
	public static IRoomTypeDao getRoomType(){
		return new RoomTypeDao();
	}
}
