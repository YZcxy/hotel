package com.hotel.service;

import java.util.List;

import com.hotel.dao.IRoomDao;
import com.hotel.factory.DAOFactory;
import com.hotel.po.Room;
//Room相关服务，服务于RoomColler
public class RoomService {
	//得到RoomDao对象
	private static IRoomDao r = DAOFactory.getRoomDao();
	//加载所有房间
	public static List<Room> loadRoom(){
		return r.getAllRoom();
	}
	public static boolean addRoom(Room room){
		
		return r.addRoom(room);
	}
}
