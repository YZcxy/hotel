package com.hotel.factory;

import com.hotel.dao.IRoomBookDao;
import com.hotel.dao.IRoomDao;
import com.hotel.dao.IRoomTypeDao;
import com.hotel.dao.IUserDao;
import com.hotel.dao.impl.RoomBookDao;
import com.hotel.dao.impl.RoomDao;
import com.hotel.dao.impl.RoomTypeDao;
import com.hotel.dao.impl.UserDao;

//DAO工厂生产DAO实例
public class DAOFactory {
	
	public static IUserDao getUserDao(){
		return new UserDao();
	}
	
	public static IRoomTypeDao getRoomType(){
		return new RoomTypeDao();
	}
	
	public static IRoomDao getRoomDao(){
		return new RoomDao();
	}
	public static IRoomBookDao getRoomBookDao(){
		return new RoomBookDao();
	}
}
