/**
 * Created by CHEN on 2016/4/19.
 */

//加载客房
$(function() {
	loadCustomer();
});

//添加客房
$(function() {
	var f = $("#addCustomer_form")[0];
	$("#add_btn").click(function() {
		$("#addCustomer").modal();
	});

	$("#add_sub").click(function() {
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
					setLog(f, 'alert-success', '添加成功');
					f.reset();
					loadCustomer();
				} else {
					setLog(f, 'alert-danger', '添加失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});

});

//修改客房
$(function() {
	var f = $("#updateCustomer_form")[0];
	$("#customer_body").on("click", "button.btn-warning", function() {
		$("#updateCustomer").modal();
		var _this = $(this);
		f.u_id.value = _this.parent().parent().find("td").eq(0).html();
		f.u_username.value = _this.parent().parent().find("td").eq(1).html();
		f.u_name.value = _this.parent().parent().find("td").eq(2).html();
		f.u_idcard.value = _this.parent().parent().find("td").eq(3).html();
		f.u_tel.value = _this.parent().parent().find("td").eq(4).html();
	});

	//删除
	$("#deleteCustomer_sub").click(function() {
		$("#deleteConform").modal();
	});
	$("#deleteSure_sub").click(function() {
		var _this = $("#deleteCustomer_sub");
		var id = f.u_id.value;
		$("#deleteConform").modal("hide");
		var btn = _this.button("loading");
		$("#updateCustomer_sub")[0].disabled = true;
		$.post("delete_user.do", {
			u_id: id
		}, function(data) {
			$("#updateCustomer_sub")[0].disabled = false;
			if (data.success == true) {
				$("#updateCustomer").modal("hide");
				loadCustomer();
			} else {
				setLog(f, 'alert-danger', '删除失败');
			}
			btn.button("reset");
		}, "json");
	});

	//修改
	$("#updateCustomer_sub").click(function() {
		if (!/^[\w_]{2,20}$/.test(f.u_username.value)) {
			setLog(f, 'alert-danger', '请输入2-20位的用户名,只能为英文、数组、下划线');
		} else if (!/^.{2,20}$/.test(f.u_name.value)) {
			setLog(f, 'alert-danger', '真实姓名不能少于2位');
		} else if (!/^(\d{17})([Xx\d])$/.test(f.u_idcard.value)) {
			setLog(f, 'alert-danger', '身份证格式错误');
		} else if (!/^1\d{10}$/.test(f.u_tel.value)) {
			setLog(f, 'alert-danger', '手机号码格式错误');
		} else {
			var btn = $(this).button("loading");
			$("#deleteCustomer_sub")[0].disabled = true;
			setLog(f);
			var d = $(f).serialize();
			$.post("update_user.do", d, function(data) {
				$("#deleteCustomer_sub")[0].disabled = false;
				if (data.success == true) {
					setLog(f, 'alert-success', '修改成功');
					f.reset();
					loadCustomer();
				} else {
					setLog(f, 'alert-danger', '修改失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});

});

//订房间
$(function() {
	$("#customer_body").on("click", "button.btn-info", function() {
		$("#bookRoom").modal();
		$("#book_username").val($(this).parent().parent().find("td").eq(1).html());
		//加载类型
		$.get("load_room_type.do", {}, function(data) {
			$("#book_type").html("");
			for (var i in data) {
				var op = $("<option>" + data[i].rt_name + "</option>");
				$("#book_type").append(op);
			}
			loadRoom();
		});
		$("#book_sub")[0].disabled = true;
		$("#inroom_sub")[0].disabled = true;
	});

	//时间选择
	$("#book_date").datetimepicker({
		format: 'yyyy-mm-dd',
		autoclose: false,
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

	//加载可选的房间号
	function loadRoom() {
		$.post("load_select_room.do", {
			type: $("#book_type").val(),
			date: $("#book_date").val()
		}, function(data) {
			var box = $("#choose_room");
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
						var pri = Number((span[i]).attr("money"));
						if (isNaN(pri)) {
							pri = 0;
						}
						price += pri;
					}
				}
				$("#book_price").html(price);
				if (tmp.length > 0) {
					$("#book_sub")[0].disabled = false;
					$("#inroom_sub")[0].disabled = false;
				} else {
					$("#book_sub")[0].disabled = true;
					$("#inroom_sub")[0].disabled = true;
				}
			});
		}, 'json');
	}

	//预定房间
	$("#book_sub").click(function() {
		var btn = $(this).button("loading");
		$("#inroom_sub")[0].disabled = true;
		var tmp = [];
		var _room = $("#choose_room span");
		for(var i in _room){
			if(_room[i].className == "active"){
				tmp.push(_room[i].innerHTML);
			}
		}
		var book_num = tmp.toString();
		$.post("add_book.do", {
			username: $("#book_username").val(),
			type: $("#book_type").val(),
			date: $("#book_date").val(),
			num: book_num
		}, function(data) {
			btn.button("reset");
			$("#inroom_sub")[0].disabled = false;
			if (data.success == true) {
				setLog($("#bookRoom_form"), "alert-success", "预定成功");
			} else {
				setLog($("#bookRoom_form"), "alert-danger", "预定失败");
			}
		}, 'json');
	});
	//入住房间
	$("#inroom_sub").click(function() {
		var btn = $(this).button("loading");
		$("#book_sub")[0].disabled = true;
		var tmp = [];
		var _room = $("#choose_room span");
		for(var i in _room){
			if(_room[i].className == "active"){
				tmp.push(_room[i].innerHTML);
			}
		}
		var book_num = tmp.toString();
		$.post("add_inroom.do", {
			username: $("#book_username").val(),
			type: $("#book_type").val(),
			date: $("#book_date").val(),
			num: book_num
		}, function(data) {
			btn.button("reset");
			$("#book_sub")[0].disabled = false;
			if (data.success == true) {
				setLog($("#bookRoom_form"), "alert-success", "操作成功");
			} else {
				setLog($("#bookRoom_form"), "alert-danger", "操作失败");
			}
		}, 'json');
	});
});

//加载客户
function loadCustomer() {
	$.get("load_user.do", {}, function(data) {
		$("#customer_body").html("");
		for (var i in data) {
			var tr = $("<tr></tr>");
			var td1 = $("<td>" + data[i].u_id + "</td>");
			var td2 = $("<td>" + data[i].u_username + "</td>");
			var td3 = $("<td>" + data[i].u_name + "</td>");
			var td4 = $("<td>" + data[i].u_idcard + "</td>");
			var td5 = $("<td>" + data[i].u_tel + "</td>");
			var td6 = $("<td>" + data[i].u_date + "</td>");
			var td7 = $('<td><button class="btn btn-warning btn-sm">修改</button></td>');
			tr.append(td1, td2, td3, td4, td5, td6, td7);
			$("#customer_body").append(tr);
		}
	});
}