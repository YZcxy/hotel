var bookData = {
	type: '',
	date: '',
	num: '',
	username: ''
}

//选择房间类型
$(function() {
	var ul = $("#book_room .choose_type");
	//加载类型
	$.get("load_room_type.do", {}, function(data) {
		ul.html("");
		for (var i in data) {
			if (i == 0) {
				var li = $('<li class="active"><a href="javascript:;">' + data[i].rt_name + '</a></li>');
				$(".choose_room .book_type span").html(data[i].rt_name);
				bookData.type = data[i].rt_name;
			} else {
				var li = $('<li><a href="javascript:;">' + data[i].rt_name + '</a></li>');
			}
			ul.append(li);
		}
	});
	//点击事件
	ul.on("click", "li", function() {
		ul.find("li").removeClass("active");
		$(this).addClass("active");
		$(".choose_room .book_type span").html($(this).find("a").html());
		bookData.type = $(this).find("a").html();
		queryRoom();
	});
});

//从主页过来
$(function() {
	var sear = location.search;
	var type = sear.substring(6, sear.indexOf("&"));
	var date = sear.substring(sear.indexOf("&date=") + 6);

});

//选择月份
$(function() {
	var nav = $("#book_room .choose_date>nav");
	//写入年月
	var year = new Date().getFullYear();
	var month = new Date().getMonth() + 1;
	var m = [];
	for (var i = 0; i < 4; i++) {
		var tmp = year + "年" + month + "月";
		m.push(tmp);
		month++;
		if (month > 12) {
			year++;
			month = 1;
		}
	}
	for (var i in m) {
		if (i == 0) {
			var a = $('<a class="active" href="javascript:;">' + m[i] + '</a>');
		} else {
			var a = $('<a href="javascript:;">' + m[i] + '</a>');
		}
		nav.append(a);
	}
	//点击事件
	nav.on("click", "a", function() {
		nav.find("a").removeClass("active");
		$(this).addClass("active");
		writeDate();
	});
});

//选择日期
$(function() {
	//写入日历
	writeDate();

});

//写入日历
function writeDate() {
	var ym = $("#book_room .choose_date>nav a.active").html();
	ym = ym.replace(/[年月]/g, "#").split("#");
	var year = ym[0];
	var month = ym[1];
	var _date = new Date();
	_date.setFullYear(year);
	_date.setMonth(month - 1);
	_date.setDate(1);
	var dayStart = _date.getDay();
	//判断当前月有多少天
	var monthNum = 30;
	if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
		monthNum = 31;
	}
	if (month == 2) {
		if (year % 4 == 0 && year % 100 != 0) {
			monthNum = 29;
		} else if (year % 400 == 0) {
			monthNum = 29;
		} else {
			monthNum = 28;
		}
	}
	//写入
	var td = $("#book_room .choose_date td");
	td.html("");
	td.removeClass("enabled");
	td.removeClass("active");
	$("#book_sub")[0].disabled = true;
	for (var i = 1; i <= monthNum; i++) {
		var _n = i + dayStart - 1;
		if (month - 1 != new Date().getMonth() || i >= new Date().getDate()) {
			td.eq(_n).addClass("enabled");
		}
		td.eq(_n).html(i);
	}
	//绑定事件
	$("#book_room .choose_date").off("click");
	$("#book_room .choose_date").on("click", "td.enabled", function() {
		td.removeClass("active");
		$(this).addClass("active");
		var d = $(this).html();
		var m = month.length == 1 ? "0" + month : month;
		d = d.length == 1 ? "0" + d : d;
		var _date = year + "." + m + "." + d;
		$(".choose_room .book_date span").html(_date);
		_date = _date.replace(/\./g, "-");
		bookData.date = _date;
		//查询可选的房间号
		queryRoom();
	});
}

//确定预定
$(function() {
	$("#book_sub").click(function() {
		if (!$.cookie("u_username")) {
			$("#loginBox").modal();
			return;
		} else {
			bookData.username = $.cookie("u_username");
		}
		var btn = $(this).button("loading");
		$.post("add_book.do", bookData, function(data) {
			btn.button("reset");
			if (data.success == true) {
				queryRoom();
				setLog($("#book_log"), "alert-success", "预定成功");
			} else {
				setLog($("#book_log"), "alert-danger", "预定失败");
			}
		}, 'json');
	});
});

//查询可以选择的房间号
function queryRoom() {
	$.post("load_select_room.do", bookData, function(data) {
		var box = $("#book_room .choose_room .room_num");
		box.html("");
		for (var i in data) {
			var span = $("<span money='" + data[i].r_money + "'>" + data[i].r_num + "</span>");
			box.append(span);
		}
		box.off("click");
		box.on("click", "span", function() {
			$(this).toggleClass("active");
			var span = box.find("span");
			var tmp = [];
			var price = 0;
			for (var i in span) {
				if (span[i].className == "active") {
					tmp.push(span[i].innerHTML);
					var pri = Number($(span[i]).attr("money"));
					if (isNaN(pri)) {
						pri = 0;
					}
					price += pri;
				}
			}
			bookData.num = tmp.toString();
			$(".choose_room .price span").html(price);
			if (tmp.length > 0) {
				$("#book_sub")[0].disabled = false;
			} else {
				$("#book_sub")[0].disabled = true;
			}
		});
	}, 'json');
}