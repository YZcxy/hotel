package com.hotel.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter{
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		response.setContentType("text/html;charset=utf-8");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		
		HttpSession session = req.getSession();
		// 从session中取出用户身份信息
		String username = (String) session.getAttribute("username");
		Object pow = session.getAttribute("pow");
		String path = req.getContextPath();
		String basePath = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+path;  
		String url = req.getRequestURI();
		
		if(url.indexOf("index") >= 0){
			chain.doFilter(request, response);
		}else if (username == null) {
			// 身份不存在，转发
			resp.sendRedirect(basePath +"/index.jsp");
		}else if(pow.equals(0)){
			if (url.indexOf("admin") >= 0){
				//如果权限为0，则为用户，禁止进入后台管理页面
				resp.sendRedirect(basePath + "/index.jsp");
			}
		}else if(pow.equals(3)){
			//如果权限为3，则为普通员工，禁止访问以下页面
			if(url.indexOf("admin-room") >= 0){
				resp.sendRedirect(basePath + "/admin-customer.jsp?pow=false");
			}
			if(url.indexOf("admin-user") >= 0){
				resp.sendRedirect(basePath + "/admin-customer.jsp?pow=false");
			}
		}else if(pow.equals(2)){
			//如果权限为2，则为管理员，禁止访问以下页面
			if(url.indexOf("admin-user") >= 0){
				resp.sendRedirect(basePath + "/admin-customer.jsp?pow=false");
			}
		}
		
	}
	
	
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}



}
