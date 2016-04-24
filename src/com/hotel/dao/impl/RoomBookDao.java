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
			list = session.selectList(RoomBook.class.getName()+".loadSelectRoom",rbc);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}

	@Override
	public boolean addBook(RoomBookCustom rbc) {
		SqlSession session = null;
		boolean isSuccess = false;
		//获取多个房间号
		String[] num = rbc.getNum().split(",");
		try {
			session = MyBatisUtil.createSession();
			for(int i=0;i<num.length;i++){
				rbc.setNum(num[i]);
				session.insert(RoomBook.class.getName()+".addBook",rbc);
			}
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
	public List<RoomBook> getAllBook() {
		SqlSession session = null;
		List<RoomBook> list = new ArrayList<RoomBook>();
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(RoomBook.class.getName()+".getAllBook");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}

	@Override
	public List<RoomBook> getUserBook(String u_username) {
		SqlSession session = null;
		List<RoomBook> list = new ArrayList<RoomBook>();
		try {
			session = MyBatisUtil.createSession();
			list = session.selectList(RoomBook.class.getName()+".getUserBook",u_username);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			MyBatisUtil.closeSession(session);
		}
		return list;
	}

	@Override
	public boolean deleteBook(int rb_id) {
		SqlSession session = null;
		boolean isSuccess = false;
		try {
			session = MyBatisUtil.createSession();
			session.insert(RoomBook.class.getName()+".deleteBook",rb_id);
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
	public boolean addInroom(RoomBookCustom rbc) {
		SqlSession session = null;
		boolean isSuccess = false;
		//获取多个房间号
		try {
			session = MyBatisUtil.createSession();
			
			session.insert(RoomBook.class.getName()+".addInroom",rbc);
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
