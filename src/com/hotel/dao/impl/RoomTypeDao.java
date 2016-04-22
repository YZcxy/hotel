package com.hotel.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.hotel.dao.IRoomTypeDao;
import com.hotel.po.RoomType;
import com.hotel.util.MyBatisUtil;

//房间类型处理实现类
public class RoomTypeDao implements IRoomTypeDao {

	//添加房间类型
	@Override
	public boolean addRoomType(String rt_name) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.insert(RoomType.class.getName()+".addRoomType", rt_name);
			session.commit();
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return isSuccess;
	}
	@Override
	public RoomType queryRoomType(String rt_name) {
		SqlSession session = null;
		RoomType roomType = null;
		try {
			session = MyBatisUtil.createSession();
			roomType = (RoomType)session.selectOne(RoomType.class.getName()+".queryRoomType", rt_name);
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}		
		return roomType;
	}
	@Override
	public List<RoomType> getAllRoomType() {
		SqlSession session = null;
		List<RoomType> list = new ArrayList<RoomType>();
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(RoomType.class.getName()+".getAllRoomType");
			session.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}
	@Override
	public boolean deleteRoomType(int rt_id) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.delete(RoomType.class.getName()+".deleteRoomType", rt_id);
			session.commit();
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return isSuccess;
	}
	
	@Override
	public boolean updateRoomType(RoomType rt) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.update(RoomType.class.getName()+".updateRoomType", rt);
			session.commit();
			isSuccess = true;
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return isSuccess;
	}
	
}
