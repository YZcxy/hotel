package com.hotel.dao.impl;

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
		return false;
	}
	
}
