package com.hotel.dao;

import java.util.List;

import com.hotel.po.Room;
import com.hotel.po.RoomBook;
import com.hotel.po.RoomBookCustom;


//房间预定处理接口
public interface IRoomBookDao {
	List<Room> loadSelectRoom(RoomBookCustom rbc);
	boolean addBook(RoomBookCustom rbc);
	List<RoomBook> getAllBook();
	List<RoomBook> getUserBook(String u_username);
	boolean deleteBook(int rb_id);
	boolean addInroom(RoomBookCustom rbc);
	boolean changeBookInroom(int rb_id);
	List<RoomBook> loadAllInroom();
}
