package com.hotel.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor {

	// 用于身份认证、身份授权
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		// 获取请求的url
		String url = request.getRequestURI();
		if (url.indexOf("login.do") >= 0) {
			// 如果进行登陆提交，放行
			return true;
		}
		
		if (url.indexOf("logout.do") >= 0) {
			// 如果进行注销提交，放行
			return true;
		}
		
		if (url.indexOf("regist.do") >= 0) {
			// 如果进行注册提交，放行
			return true;
		}


		HttpSession session = request.getSession();
		// 从session中取出用户身份信息
		String username = (String) session.getAttribute("username");
		if (username != null) {
			// 身份存在，放行
			return true;
		}

		// 执行这里表示用户身份需要认证，跳转登陆页面
		request.getRequestDispatcher("index.html?login=true").forward(request,
				response);

		return false;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

}
