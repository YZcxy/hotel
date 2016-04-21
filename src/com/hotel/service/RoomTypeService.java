package com.hotel.service;

import com.hotel.dao.IRoomTypeDao;
import com.hotel.factory.DAOFactory;

//RoomType相关服务，服务于RoomTypeColler
public class RoomTypeService {
	//得到RoomTypeDao对象
	private static IRoomTypeDao rt = DAOFactory.getRoomType();
	
	//添加房间类型
	public static boolean addRoomType(String rt_name){
		boolean flag = false;		
		return rt.addRoomType(rt_name);
	}
}
