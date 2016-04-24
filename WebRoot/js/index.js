$(function() {
	//加载类型
	$.get("load_room_type.do", {}, function(data) {
		for (var i in data) {
			var op = $("<option>" + data[i].rt_name + "</option>")
			$("#book_type").append(op);
		}
	});
	//去预定
	$("#go_book_page").click(function() {
		location.href = "book.jsp?type=" + $("#book_type").val() + "&date=" + $("#book_date").val();
	});
});

//预订房间
$(function() {
	//时间选择
	$("#book_date").datetimepicker({
		format: 'yyyy-mm-dd',
		autoclose: true,
		pickerPosition: 'bottom-left',
		startDate: getToday(),
		endDate: getNextYear(),
		minView: 2,
		language: 'zh-CN'
	});

	//赋值
	$("#book_date").val(getToday());

	//今天
	function getToday() {
		var date = new Date();
		var y = date.getFullYear();
		var m = date.getMonth() + 1;
		var d = date.getDate();
		if (m.toString().length == 1) {
			m = "0" + m;
		}
		if (d.toString().length == 1) {
			d = "0" + d;
		}
		return y + "-" + m + "-" + d;
	}

	//明年的今天
	function getNextYear() {
		var date = new Date();
		var y = date.getFullYear() + 1;
		var m = date.getMonth() + 1;
		var d = date.getDate();
		if (m.toString().length == 1) {
			m = "0" + m;
		}
		if (d.toString().length == 1) {
			d = "0" + d;
		}
		return y + "-" + m + "-" + d;
	}
});
