//加载员工
$(function() {
	loadAdmin();
});

//添加员工
$(function() {
	var f = $("#addAdmin_form")[0];
	$("#add_btn").click(function() {
		$("#addAdmin").modal();
	});
	$("#add_sub").click(function() {
		if (!/^[\w_]{2,20}$/.test(f.ad_username.value)) {
			setLog(f, 'alert-danger', '请输入2-20位的用户名,只能为英文、数组、下划线');
		} else if (f.ad_password.value.length < 6) {
			setLog(f, 'alert-danger', '密码长度不少于6位');
		} else if (!/^.{2,20}$/.test(f.ad_name.value)) {
			setLog(f, 'alert-danger', '真实姓名不能少于2位');
		} else if (!/^1\d{10}$/.test(f.ad_tel.value)) {
			setLog(f, 'alert-danger', '手机号码格式错误');
		} else {
			var btn = $(this).button("loading");
			setLog(f);
			var d = $(f).serialize();
			$.post("add_admin.do", d, function(data) {
				btn.button("reset");
				if (data.success == true) {
					setLog(f, 'alert-success', '添加成功');
					f.reset();
					loadCustomer();
				} else {
					setLog(f, 'alert-danger', '添加失败：' + data.reason);
				}
			}, "json");
		}
	});

});

//修改员工信息
$(function() {
	var f = $("#updateAdmin_form")[0];
	$("#admin_body").on("click", "button", function() {
		$("#updateAdmin").modal();
		var _this = $(this);
		f.ad_id.value = _this.parent().parent().find("td").eq(0).html();
		f.ad_username.value = _this.parent().parent().find("td").eq(1).html();
		f.ad_name.value = _this.parent().parent().find("td").eq(2).html();
		f.ad_tel.value = _this.parent().parent().find("td").eq(3).html();
		f.ad_pow.value = _this.parent().parent().find("td").eq(4).attr("ad_pow");
	});
	//删除
	$("#deleteAdmin_sub").click(function() {
		$("#deleteConform").modal();
	});
	$("#deleteSure_sub").click(function() {
		var _this = $("#deleteAdmin_sub");
		var id = f.ad_id.value;
		$("#deleteConform").modal("hide");
		var btn = _this.button("loading");
		$("#updateAdmin_sub")[0].disabled = true;
		$.post("delete_admin.do", {
			ad_id: id
		}, function(data) {
			$("#updateAdmin_sub")[0].disabled = false;
			if (data.success == true) {
				$("#updateAdmin").modal("hide");
				loadAdmin();
			} else {
				setLog(f, 'alert-danger', '删除失败');
			}
			btn.button("reset");
		}, "json");
	});

	//修改
	$("#updateAdmin_sub").click(function() {
		if (!/^[\w_]{2,20}$/.test(f.ad_username.value)) {
			setLog(f, 'alert-danger', '请输入2-20位的用户名,只能为英文、数组、下划线');
		} else if (!/^.{2,20}$/.test(f.ad_name.value)) {
			setLog(f, 'alert-danger', '真实姓名不能少于2位');
		} else if (!/^1\d{10}$/.test(f.ad_tel.value)) {
			setLog(f, 'alert-danger', '手机号码格式错误');
		} else {
			var btn = $(this).button("loading");
			$("#deleteAdmin_sub")[0].disabled = true;
			setLog(f);
			var d = $(f).serialize();
			$.post("update_admin.do", d, function(data) {
				$("#deleteAdmin_sub")[0].disabled = false;
				if (data.success == true) {
					setLog(f, 'alert-success', '修改成功');
					f.reset();
					loadAdmin();
				} else {
					setLog(f, 'alert-danger', '修改失败：' + data.reason);
				}
				btn.button("reset");
			}, "json");
		}
	});

});

//加载员工
function loadAdmin() {
	$.get("load_all_admin.do", function(data) {
		$("#admin_body").html("");
		for (var i in data) {
			var pow = data[i].ad_pow;
			var dis = "";
			if (pow == 1) {
				dis = "disabled";
			}
			var tr = $("<tr></tr>");
			var td1 = $("<td>" + data[i].ad_id + "</td>");
			var td2 = $("<td>" + data[i].ad_username + "</td>");
			var td3 = $("<td>" + data[i].ad_name + "</td>");
			var td4 = $("<td>" + data[i].ad_tel + "</td>");
			var td5 = $("<td ad_pow=" + pow + ">" + (pow == 1 ? "超级管理员" : pow == 2 ? "管理员" : "普通员工") + "</td>");
			var td6 = $("<td>" + formatDate(data[i].ad_date) + "</td>");
			var td7 = $('<td><button class="btn btn-warning btn-sm" ' + dis + '>修改</button></td>');
			tr.append(td1, td2, td3, td4, td5, td6, td7);
			$("#admin_body").append(tr);
		}
	});
}