package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.service.RoomTypeService;

@Controller
public class RoomTypeController {
	@RequestMapping("add_room_type")
	@ResponseBody
	public Model addRoomType(String rt_name){
		
		RoomTypeService.addRoomType(rt_name);
		
		return null;
	}
	
}
