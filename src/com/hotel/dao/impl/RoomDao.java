package com.hotel.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hotel.dao.IRoomDao;
import com.hotel.po.Room;
import com.hotel.po.RoomType;
import com.hotel.util.MyBatisUtil;

public class RoomDao implements IRoomDao{

	@Override
	public List<Room> getAllRoom() {
		SqlSession session = null;
		List<Room> list = new ArrayList<Room>();
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(Room.class.getName()+".getAllRoom");
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}

	@Override
	public boolean addRoom(Room room) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.insert(Room.class.getName()+".addRoom",room);
			session.commit();
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}	
		return isSuccess;
	}

	@Override
	public boolean updateRoom(Room room) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.update(Room.class.getName()+".updateRoom",room);
			session.commit();
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}	
		return isSuccess;
	}
	@Override
	public boolean deleteRoom(int r_id) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.delete(Room.class.getName()+".deleteRoom",r_id);
			session.commit();
			isSuccess=true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}	
		return isSuccess;
	}

	@Override
	public Room queryRoomByNum(String r_num) {
		SqlSession session = null;
		Room room = null;
		try {
			session = MyBatisUtil.createSession();
			room = session.selectOne(Room.class.getName()+".queryRoomByNum",r_num);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return room;
	}
	
}
