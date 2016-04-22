//firefox bug
$(function() {
	$("button").each(function() {
		this.disabled = false;
	});
});

$(function() {
	//显示登录
	$("#login_admin").html($.cookie("ad_username"));
	//退出
	$("#exit_admin").click(function() {
		$.post("eixt_user.do", function() {
			$.removeCookie("u_username");
			$.removeCookie("ad_username");
			location.href = "index.jsp#login=true";
		});
	});

	//左侧导航激活样式
	var url = location.href;
	var start = url.indexOf("admin-");
	var end = url.indexOf(".jsp");
	url = url.substring(start, end + 4);
	var navbar = $(".left_navbar li");
	navbar.removeClass("active");
	$(".left_navbar a[href^='" + url + "']").parent().addClass("active");
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