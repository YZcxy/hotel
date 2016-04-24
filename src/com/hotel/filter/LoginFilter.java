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
		
		String url = req.getRequestURI();
		if (url.indexOf("admin") >= 0) {
			// 如果进行登陆提交，放行
			if(pow.equals(0)){
				request.getRequestDispatcher("index.jsp").forward(request,
						response);
			}
		}
		
		if (username == null) {
			// 身份不存在，转发
			request.getRequestDispatcher("index.jsp").forward(request,
					response);
			//resp.sendRedirect("index.jsp#login=true");
		}
		chain.doFilter(request, response);
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
