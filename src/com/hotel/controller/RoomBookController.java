package com.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Room;
import com.hotel.po.RoomBook;
import com.hotel.po.RoomBookCustom;
import com.hotel.po.User;
import com.hotel.service.RoomBookService;
import com.hotel.service.RoomService;

@Controller
public class RoomBookController {
	@RequestMapping("load_select_room")
	@ResponseBody
	public List<Room> loadSelectRoom(RoomBookCustom rbc){
		List<Room> list = RoomBookService.loadSelectRoom(rbc);
		return list;
	}
	//预定房间
	@RequestMapping("add_book")
	@ResponseBody
	public Map addBook(RoomBookCustom rbc){
		Map map = new HashMap();
		if(RoomBookService.addBook(rbc)){
			map.put("success", true);
		}else{
			map.put("success", false);
		}
		return map;
	}
	@RequestMapping("load_all_book")
	@ResponseBody
	public List<RoomBook> loadAllBook(){
		return RoomBookService.loadAllBook();
	}
	@RequestMapping("load_all_inroom")
	@ResponseBody
	public List<RoomBook> loadAllInroom(){
		return RoomBookService.loadAllInroom();
	}
	@RequestMapping("load_book_info")
	@ResponseBody
	public List<RoomBook> loadBookInfo(String u_username){
		return RoomBookService.loadBookInfo(u_username);
	}
	@RequestMapping("delete_book")
	@ResponseBody
	public Map deleteBook(int rb_id){
		Map map = new HashMap();
		if(RoomBookService.deleteBook(rb_id)){
			map.put("success", true);
		}else{
			map.put("success", false);
		}
		return map;
	}
	//入住房间
	@RequestMapping("add_inroom")
	@ResponseBody
	public Map addInroom(RoomBookCustom rbc){
		Map map = new HashMap();
		if(RoomBookService.addInroom(rbc)){
			map.put("success", true);
		}else{
			map.put("success", false);
		}
		return map;
	}
	
	@RequestMapping("change_book_inroom")
	@ResponseBody
	public Map changeBookInroom(int rb_id){
		Map map = new HashMap();
		if(RoomBookService.changeBookInroom(rb_id)){
			map.put("success", true);
		}else{
			map.put("success", false);
		}
		return map;
	}
}
