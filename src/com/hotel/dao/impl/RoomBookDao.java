package com.hotel.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hotel.dao.IRoomBookDao;
import com.hotel.po.Room;
import com.hotel.po.RoomBook;
import com.hotel.po.RoomBookCustom;
import com.hotel.util.MyBatisUtil;

public class RoomBookDao implements IRoomBookDao {

	@Override
	public List<Room> loadSelectRoom(RoomBookCustom rbc) {
		SqlSession session = null;
		List<Room> list = new ArrayList<Room>();
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(RoomBook.class.getName()+".loadSelectRoom");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}
	
}
