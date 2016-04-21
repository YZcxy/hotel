package com.hotel.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.po.Admin;
import com.hotel.po.User;
import com.hotel.service.UserService;


@Controller
public class UserController {
	
	//拦截注册请求
	@RequestMapping("user_regist.do")
	@ResponseBody
	public Map user_regist(User user){	
		Map map = new HashMap();
		map.put("success", false);
		//
		if(UserService.registerCheck(user)){
			if(UserService.register(user)){
				//成功注册
				map.put("success", true);
			}else{
				//服务器的原因导致无法注册
				map.put("reason", "服务器需要休息会~");
				map.put("success", false);
			}
		}else{
			
			map.put("reason","用户已经被注册");
			map.put("success", false);
		}	
		return map;
	}
	
	//拦截用户登录请求
	@RequestMapping("user_login.do")
	@ResponseBody
	public Map user_login(User user,HttpSession session){	
		Map map = new HashMap();
		map.put("success", false);
		if(UserService.loginCheck(user)){
			//保存session，保存姓名和权限
			session.setAttribute("username", user.getU_username());
			session.setAttribute("pow", null);
			map.put("success",true);
		}else{
			map.put("reason","用户名或密码错误");
			map.put("success", false);
		}	
		return map;
	}
	
	//拦截注销请求
	@RequestMapping("user_logout.do")
	@ResponseBody
	public User user_logout(HttpSession session,HttpServletRequest req,HttpServletResponse res){	
		session.invalidate();
		try {
			req.getRequestDispatcher("index.html?login=true").forward(req,
					res);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//拦截管理登录请求
	@RequestMapping("admin_login.do")
	@ResponseBody
	public Map admin_login(Admin admin,HttpSession session){	
		Map map = new HashMap();
		map.put("success", false);
		Admin mes = UserService.adLoginCheck(admin);
		if(mes != null){
			session.setAttribute("username", mes.getAd_username());
			session.setAttribute("pow", mes.getAd_pow());
			map.put("success",true);
		}else{
			map.put("reason","用户名或密码错误");
			map.put("success", false);
		}	
		return map;
	}
}
