package com.hotel.dao;

import java.util.List;

import com.hotel.po.Room;

public interface IRoomDao {
	public List<Room> getAllRoom();
	public boolean addRoom(Room room);
	public boolean updateRoom(Room room);
	public boolean deleteRoom(int r_id);
	public Room queryRoomByNum(String r_num);
}
