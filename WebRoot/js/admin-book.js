//加载所有预定
$(function() {
	loadBook();
});

//入住
$(function() {
	$("#room_body").on("click", "button.btn-info", function() {
		var id = $(this).parent().parent().find("td").eq(0).html();
		var _this = this;
		_this.disabled = true;
		$.post("change_book_inroom.do", {
			rb_id: id
		}, function(data) {
			_this.disabled = false;
			if (data.success == true) {
				loadBook();
			} else {
				setLog($("#contentBox"), "alert-danger", "操作失败");
			}
		}, "json");
	});
});

//删除
$(function() {
	$("#room_body").on("click", "button.btn-danger", function() {
		var id = $(this).parent().parent().find("td").eq(0).html();
		$("#deleteConform").modal();
		$("#deleteSure_sub").click(function() {
			var btn = $(this).button("loading");
			$.post("delete_book.do", {
				rb_id: id
			}, function(data) {
				btn.button("reset");
				if (data.success == true) {
					loadBook();
				} else {
					setLog($("#contentBox"), "alert-danger", "删除失败");
				}
			}, "json");
		});

	});
});

//加载所有预定
function loadBook() {
	$.get("load_all_book.do", {}, function(data) {
		$("#room_body").html("");
		for (var i in data) {
			var tr = $("<tr></tr>");
			var td1 = $("<td>" + data[i].rb_id + "</td>");
			var td2 = $("<td>" + data[i].u_username + "</td>");
			var td3 = $("<td>" + data[i].u_name + "</td>");
			var td4 = $("<td>" + data[i].r_num + "</td>");
			var td5 = $("<td>" + data[i].rb_bookdate + "</td>");
			var td6 = $('<td><button class="btn btn-info btn-sm">入住</button><button class="btn btn-danger btn-sm">删除</button></td>');
			tr.append(td1, td2, td3, td4, td5, td6);
			$("#room_body").append(tr);
		}
	});
}