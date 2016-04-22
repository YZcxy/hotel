package com.hotel.service;

import java.util.List;

import com.hotel.dao.IRoomTypeDao;
import com.hotel.factory.DAOFactory;
import com.hotel.po.RoomType;

//RoomType相关服务，服务于RoomTypeColler
public class RoomTypeService {
	//得到RoomTypeDao对象
	private static IRoomTypeDao rt = DAOFactory.getRoomType();
	
	//添加房间类型
	public static boolean addRoomType(String rt_name){	
		return rt.addRoomType(rt_name);
	}
	public static List<RoomType> loadRoomType(){
		return rt.getAllRoomType();
	}
}
