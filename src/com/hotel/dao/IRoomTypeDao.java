package com.hotel.dao;

import java.util.List;

import com.hotel.po.RoomType;

//房间类型处理接口
public interface IRoomTypeDao {
	public boolean addRoomType(String rt_name);
	public List<RoomType> getAllRoomType();
	public RoomType queryRoomType(String rt_name);
}
