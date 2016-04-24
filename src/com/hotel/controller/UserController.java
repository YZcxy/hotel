package com.hotel.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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

	// 拦截注册请求
	@RequestMapping("user_regist")
	@ResponseBody
	public Map user_regist(User user) {
		Map map = new HashMap();
		map.put("success", false);
		//
		if (UserService.registerCheck(user)) {
			if (UserService.register(user)) {
				// 成功注册
				map.put("success", true);
			} else {
				// 服务器的原因导致无法注册
				map.put("reason", "请不要为难服务器！！");
				map.put("success", false);
			}
		} else {

			map.put("reason", "用户已经被注册");
			map.put("success", false);
		}
		return map;
	}

	// 拦截用户登录请求
	@RequestMapping("user_login")
	@ResponseBody
	public Map user_login(User user, HttpSession session) {
		Map map = new HashMap();
		map.put("success", false);
		if (UserService.loginCheck(user)) {
			// 保存session，保存姓名和权限
			session.setAttribute("username", user.getU_username());
			int pow = 0;
			session.setAttribute("pow", pow);
			map.put("success", true);
		} else {
			map.put("reason", "用户名或密码错误");
			map.put("success", false);
		}
		return map;
	}

	// 拦截注销请求
	@RequestMapping("exit_user")
	@ResponseBody
	public void exit_user(HttpSession session, HttpServletRequest req,HttpServletResponse res) {
		session.invalidate();
	}

	// 拦截管理员登录请求
	@RequestMapping("admin_login")
	@ResponseBody
	public Map admin_login(Admin admin, HttpSession session) {
		Map map = new HashMap();
		map.put("success", false);
		Admin mes = UserService.adLoginCheck(admin);
		if (mes != null) {
			session.setAttribute("username", mes.getAd_username());
			session.setAttribute("pow", mes.getAd_pow());
			map.put("success", true);
		} else {
			map.put("reason", "用户名或密码错误");
			map.put("success", false);
		}
		return map;
	}

	// 拦截加载所有用户请求
	@RequestMapping("load_user")
	@ResponseBody
	public List<User> load_user() {
		List<User> list = UserService.loadAllUser();

		return list;
	}

	// 拦截根据id修改用户信息请求
	@RequestMapping("update_user")
	@ResponseBody
	public Map update_user(User user) {
		Map map = new HashMap();
		map.put("success", false);
		if (UserService.updateUser(user)) {
			// 成功修改
			map.put("success", true);
		} else {
			// 服务器的原因导致无法注册
			map.put("reason", "请不要为难服务器！！");
			map.put("success", false);
		}

		return map;
	}

	// 拦截根据Id删除用户信息请求
	@RequestMapping("delete_user")
	@ResponseBody
	public Map delete_user(User user) {
		Map map = new HashMap();
		map.put("success", false);
		if (UserService.deleteUser(user)) {
			// 成功删除
			map.put("success", true);
		} else {
			// 服务器的原因导致无法注册
			map.put("reason", "请不要为难服务器！！");
			map.put("success", false);
		}

		return map;
	}

	// 拦截加载所有管理员请求
	@RequestMapping("load_all_admin")
	@ResponseBody
	public List<Admin> load_all_admin() {
		List<Admin> list = UserService.loadAllAdmin();

		return list;
	}

	// 拦截管理员注册请求
	@RequestMapping("add_admin")
	@ResponseBody
	public Map add_admin(Admin admin) {
		Map map = new HashMap();
		map.put("success", false);
		//
		if (UserService.adRegisterCheck(admin)) {
			if (UserService.adRegister(admin)) {
				// 成功注册
				map.put("success", true);
			} else {
				// 服务器的原因导致无法注册
				map.put("reason", "请不要为难服务器！！");
				map.put("success", false);
			}
		} else {

			map.put("reason", "该管理员已经被注册");
			map.put("success", false);
		}
		return map;
	}

	// 拦截根据Id删除管理员信息请求
	@RequestMapping("delete_admin")
	@ResponseBody
	public Map delete_admin(Admin admin) {
		Map map = new HashMap();
		map.put("success", false);
		if (UserService.deleteAdmin(admin)) {
			// 成功删除
			map.put("success", true);
		} else {
			// 服务器的原因导致无法注册
			map.put("reason", "请不要为难服务器！！");
			map.put("success", false);
		}

		return map;
	}

	// 拦截根据id修改管理员信息请求
	@RequestMapping("update_admin")
	@ResponseBody
	public Map update_admin(Admin admin) {
		Map map = new HashMap();
		map.put("success", false);
		if (UserService.updateAdmin(admin)) {
			// 成功修改
			map.put("success", true);
		} else {
			// 服务器的原因导致无法注册
			map.put("reason", "请不要为难服务器！！");
			map.put("success", false);
		}

		return map;
	}
}
