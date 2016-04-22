package com.hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Room;
import com.hotel.service.RoomService;
import com.hotel.service.RoomTypeService;

@Controller
public class RoomController {
	@RequestMapping("load_room")
	@ResponseBody
	public List<Room> loadRoom(){
		
		return RoomService.loadRoom();
	}
	@RequestMapping("add_room")
	@ResponseBody
	public Map addRoom(Room room){
		Map map = new HashMap();
		if(RoomService.addRoom(room)){
			map.put("success", true);
		}else{
			map.put("success", false);
			map.put("reason", "房间号已存在");
		}
		
		return map;
	}
	
	@RequestMapping("update_room")
	@ResponseBody
	public Map updateRoom(Room room){
		Map map = new HashMap();		
		if(RoomService.updateRoom(room)){
			map.put("success", true);
		}else{
			map.put("success", false);
			map.put("reason", "失败");
		}
		return map;
	}

	@RequestMapping("delete_room")
	@ResponseBody
	public Map updateRoom(int r_id){
		Map map = new HashMap();
		map.put("success", RoomService.deleteRoom(r_id));
		return map;
	}
}
