package com.hotel.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Room;
import com.hotel.po.RoomBookCustom;
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
}
