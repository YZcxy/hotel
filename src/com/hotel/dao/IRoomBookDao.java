package com.hotel.dao;

import java.util.List;

import com.hotel.po.Room;
import com.hotel.po.RoomBookCustom;


//房间预定处理接口
public interface IRoomBookDao {
	List<Room> loadSelectRoom(RoomBookCustom rbc);
}
