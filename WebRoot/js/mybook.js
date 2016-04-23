//加载预定信息
$(function() {
	loadBookInfo();
});

//退订
$(function() {
	$("#book_body").on("click", "button", function() {
		$("#deleteConform").modal();
		var id = $(this).parent().parent().find("td").eq(0).html();
		$("#rb_id").val(id);
	});
	$("#deleteSure_sub").click(function() {
		var btn = $(this).button("loading");
		$.post("delete_book.do", {
			rb_id: $("#rb_id").val()
		}, function(data) {
			btn.button("reset");
			$("#deleteConform").modal("hide");
			if (data.success == true) {
				setLog($(".alert_log"), "alert-success", "退订成功");
				loadBookInfo();
			} else {
				setLog($(".alert_log"), "alert-danger", "退订失败");
			}
		}, "json");
	});
});

//加载预定信息
function loadBookInfo() {
	$.get("load_book_info.do", {
		u_username: $.cookie("u_username")
	}, function(data) {
		$("#book_body").html("");
		for (var i in data) {
			var tr = $("<tr></tr>");
			var td1 = $("<td>" + data[i].rb_id + "</td>");
			var td2 = $("<td>" + data[i].rt_name + "</td>");
			var td3 = $("<td>" + data[i].r_num + "</td>");
			var td4 = $("<td>" + data[i].r_size + "</td>");
			var td5 = $("<td>" + (data[i].r_isbath == 1 ? "有" : "没有") + "</td>");
			var td6 = $("<td>" + data[i].r_money + "</td>");
			var td7 = $("<td>" + data[i].rb_bookdate + "</td>");
			var td8 = $('<td><button class="btn btn-danger btn-sm">退订</button></td>');
			tr.append(td1, td2, td3, td4, td5, td6, td7, td8);
			$("#book_body").append(tr);
		}
	}, "json");
}