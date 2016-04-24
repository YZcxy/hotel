$(function() {
	//判断是否登录
	if ($.cookie("u_username")) {
		$("#_login_info").html('<li>欢迎您，' + $.cookie("u_username") + '</li><li><a href="mybook.jsp" class="btn btn-info">我的预定</a><a href="javascript:;" id="_exit" class="btn btn-danger">退出</a></li>');
		$.removeCookie("u_username");
		$.removeCookie("ad_username");
		$("#_exit").click(function() {
			$.post("exit_user.do", function() {		
				location.reload();
			});
		});
	} else if ($.cookie("ad_username")) {
		$("#_login_info").html('<li>欢迎您，'+$.cookie("ad_username")+'</li><li><a href="admin-room-type.jsp" class="btn btn-info">后台管理</a><a href="javascript:;" id="_exit" class="btn btn-danger">退出</a></li>');
		$.removeCookie("u_username");
		$.removeCookie("ad_username");
		$("#_exit").click(function() {
			$.post("exit_user.do", function() {
				location.reload();
			});
		});
	}
	//导航栏激活样式
	var url = location.href;
	if(url.indexOf("book.jsp")>0){
		var _tmp = $("a[href^='book.jsp']").parent();
		_tmp.prev().removeClass("active");
		_tmp.addClass("active");
	}
});

//打开登录 注册窗口
$(function() {
	//firefox bug
	$("button").each(function() {
		this.disabled = false;
	});
	$("#openLoginBox").click(function() {
		$("#loginBox").modal();
	});
});

//用户登录
$(function() {
	var f = $("#userLogin_form")[0];
	$(f).find(".submit").click(function() {
		if (f.u_username.value.trim().length == 0) {
			setLog(f, 'alert-danger', '用户名不能为空');
		} else if (f.u_password.value.length == 0) {
			setLog(f, 'alert-danger', '密码不能为空');
		} else {
			var btn = $(this).button("loading");
			setLog(f);
			var d = $(f).serialize();
			$.post("user_login.do", d, function(data) {
				if (data.success == true) {
					$.cookie("u_username", f.u_username.value);
					location.reload();
				} else {
					setLog(f, 'alert-danger', '登录失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});
});

//用户注册
$(function() {
	var f = $("#regist_form")[0];

	//提示消息
	$("#regist_form input[name='u_username']").tooltip({
		html: true,
		trigger: 'focus',
		placement: 'right',
		title: '<div style="padding: 5px 10px">请输入2-20位的用户名,只能为英文、数组、下划线</div>'
	});
	$("#regist_form input[name='u_password']").tooltip({
		html: true,
		trigger: 'focus',
		placement: 'right',
		title: '<div style="padding: 5px 10px">请输入不少于6位的密码</div>'
	});
	$("#regist_form input[name='u_name']").tooltip({
		html: true,
		trigger: 'focus',
		placement: 'right',
		title: '<div style="padding: 5px 10px">请输入真实姓名</div>'
	});
	$("#regist_form input[name='u_idcard']").tooltip({
		html: true,
		trigger: 'focus',
		placement: 'right',
		title: '<div style="padding: 5px 10px">请输入身份证号码</div>'
	});
	$("#regist_form input[name='u_tel']").tooltip({
		html: true,
		trigger: 'focus',
		placement: 'right',
		title: '<div style="padding: 5px 10px">请输入手机号码</div>'
	});

	$(f).find(".submit").click(function() {
		if (!/^[\w_]{2,20}$/.test(f.u_username.value)) {
			setLog(f, 'alert-danger', '请输入2-20位的用户名,只能为英文、数组、下划线');
		} else if (f.u_password.value.length < 6) {
			setLog(f, 'alert-danger', '密码长度不少于6位');
		} else if (!/^.{2,20}$/.test(f.u_name.value)) {
			setLog(f, 'alert-danger', '真实姓名不能少于2位');
		} else if (!/^(\d{17})([Xx\d])$/.test(f.u_idcard.value)) {
			setLog(f, 'alert-danger', '身份证格式错误');
		} else if (!/^1\d{10}$/.test(f.u_tel.value)) {
			setLog(f, 'alert-danger', '手机号码格式错误');
		} else {
			var btn = $(this).button("loading");
			setLog(f);
			var d = $(f).serialize();
			$.post("user_regist.do", d, function(data) {
				if (data.success == true) {
					setLog(f, 'alert-success', '注册成功，请转到登录页面登录！');
					f.reset();
				} else {
					setLog(f, 'alert-danger', '注册失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});
});

//员工登录
$(function() {
	var f = $("#adminLogin_form")[0];
	$(f).find(".submit").click(function() {
		if (f.ad_username.value.trim().length == 0) {
			setLog(f, 'alert-danger', '用户名不能为空');
		} else if (f.ad_password.value.length == 0) {
			setLog(f, 'alert-danger', '密码不能为空');
		} else {
			var btn = $(this).button("loading");
			setLog(f);
			var d = $(f).serialize();
			$.post("admin_login.do", d, function(data) {
				if (data.success == true) {
					$.cookie("ad_username", f.ad_username.value);
					location.reload();
				} else {
					setLog(f, 'alert-danger', '登录失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});
});

//判断是否打开登录窗口
$(function() {
	var url = location.href;
	if (url.indexOf("#login=true") > 0) {
		$("#loginBox").modal();
		history.pushState({}, document.title, "./");
	}
});

//提示消息
function setLog(obj, type, text) {
	if (!(obj instanceof jQuery)) {
		obj = $(obj);
	}
	if (!type) {
		obj.parent().find(".alert").remove();
		return;
	}
	obj.parent().find(".alert").remove();
	var div = $('<div class="alert ' + type + '" style="margin:20px;margin-bottom:0;"></div>');
	var a = $('<a href="#" class="close" data-dismiss="alert">&times;</a>');
	var p = $('<p>' + text + '</p>');
	div.append(a, p);

	obj.before(div);
}

//格式化日期
function formatDate(t) {
	var _date = new Date(t);
	var y = _date.getFullYear();
	var m = Number(_date.getMonth()) + 1;
	var d = _date.getDate();
	var h = _date.getHours();
	var _m = _date.getMinutes();
	y = getFormat(y);
	m = getFormat(m);
	d = getFormat(d);
	h = getFormat(h);
	_m = getFormat(-m);
	return y + "-" + m + "-" + d;
	function getFormat(str) {
		str = str.toString();
		if (str.length == 1) {
			str = "0" + str;
		}
		return str;
	}
}