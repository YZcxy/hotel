package com.hotel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.RoomType;
import com.hotel.service.RoomTypeService;

@Controller
public class RoomTypeController {
	@RequestMapping("add_room_type")
	@ResponseBody
	public Map addRoomType(String rt_name){
		Map map = new HashMap();		
		if(RoomTypeService.addRoomType(rt_name)){
			map.put("success", true);
		}else{
			map.put("success", false);
			map.put("reason", "已存在此类型");
		}	
		return map;
	}
	@RequestMapping("load_room_type")
	@ResponseBody
	public List<RoomType> loadRoomType(){
		return RoomTypeService.loadRoomType();
	}
	@RequestMapping("update_room_type")
	@ResponseBody
	public Map updateRoomType(RoomType rt){
		Map map = new HashMap();		
		if(RoomTypeService.updateRoomType(rt)){
			map.put("success", true);
		}else{
			map.put("success", false);
			map.put("reason", "失败");
		}	
		return map;
	}
	@RequestMapping("delete_room_type")
	@ResponseBody
	public boolean deleteRoomType(RoomType roomType){
		System.out.println(roomType.getRt_id()+"  "+roomType.getRt_name());
		return RoomTypeService.deleteRoomType(roomType.getRt_id());
	}
}
