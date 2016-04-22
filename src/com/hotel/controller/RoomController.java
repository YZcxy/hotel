package com.hotel.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Room;

@Controller
public class RoomController {
	@RequestMapping("load_room")
	@ResponseBody
	public List<Room> loadRoom(){
		
		return null;
	}
}
