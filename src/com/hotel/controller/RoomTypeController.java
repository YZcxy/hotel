package com.hotel.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
			map.put("reason", "注册失败");
		}	
		return map;
	}
	
}
