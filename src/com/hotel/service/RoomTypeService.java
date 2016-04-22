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
		//判断是否存在
		if(rt.queryRoomType(rt_name)==null){
			return rt.addRoomType(rt_name);
		}else{
			return false;
		}
		
	}
	public static List<RoomType> loadRoomType(){
		return rt.getAllRoomType();
	}
	public static boolean updateRoomType(RoomType roomType){
		return rt.updateRoomType(roomType);
	}
	public static boolean deleteRoomType(int rt_id){
		return rt.deleteRoomType(rt_id);
	}
}
