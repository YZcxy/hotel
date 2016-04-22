/**
 * Created by CHEN on 2016/4/19.
 */

//加载客房
$(function () {
    loadRoom();
});

//添加客房
$(function () {
    var f = $("#addRoom_form")[0];
    $("#add_btn").click(function () {
        $("#addRoom").modal();
        //加载客房类型
        $.get("load_room_type.do", {}, function (data) {
            $(f).find("select[name='r_typeid']").html("");
            for (var i in data) {
                var op = $("<option value='" + data[i].rt_id + "'>" + data[i].rt_name + "</option>")
                $(f).find("select[name='r_typeid']").append(op);
            }
        });
    });

    $("#add_sub").click(function () {
        if (f.r_num.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间号码不能为空');
        } else if (f.r_size.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间大小不能为空');
        } else if (isNaN(f.r_size.value)) {
            setLog(f, 'alert-danger', '房间大小不是一个数字');
        } else if (f.r_money.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间价格不能为空');
        } else if (isNaN(f.r_money.value)) {
            setLog(f, 'alert-danger', '房间价格不是一个数字');
        } else {
            var btn = $(this).button("loading");
            setLog(f);
            var d = $(f).serialize();
            $.post("add_room.do", d, function (data) {
                if (data.success == true) {
                    setLog(f, 'alert-success', '添加成功');
                    f.reset();
                    loadRoom();
                } else {
                    setLog(f, 'alert-danger', '添加失败：' + data.reason);
                }
                btn.button("reset");
            }, "json");
        }
    });

});

//修改客房
$(function () {
    var f = $("#updateRoom_form")[0];
    $("#room_body").on("click", "button", function () {
        $("#updateRoom").modal();
        var _this = $(this);
        //加载客房类型
        $.get("load_room_type.do", {}, function (data) {
            $(f).find("select[name='r_typeid']").html("");
            for (var i in data) {
                var op = $("<option value='" + data[i].rt_id + "'>" + data[i].rt_name + "</option>")
                $(f).find("select[name='r_typeid']").append(op);
            }
            f.r_typeid.value = _this.parent().parent().find("td").eq(1).attr("r_typeid");
        });
        f.r_num.value = _this.parent().parent().find("td").eq(2).html();
        f.r_size.value = _this.parent().parent().find("td").eq(3).html();
        f.r_isbath.value = _this.parent().parent().find("td").eq(4).attr("r_isbath");
        f.r_money.value = _this.parent().parent().find("td").eq(5).html();
        f.r_id.value = _this.parent().parent().find("td").eq(0).html();
    });

    //删除
    $("#deleteRoom_sub").click(function () {
        $("#deleteConform").modal();
    });
    $("#deleteSure_sub").click(function () {
        var _this = $("#deleteRoom_sub");
        var id = f.r_id.value;
        $("#deleteConform").modal("hide");
        var btn = _this.button("loading");
        $("#updateRoom_sub")[0].disabled = true;
        $.post("delete_room.do", {
            r_id: id
        }, function (data) {
            $("#updateRoom_sub")[0].disabled = false;
            if (data.success == true) {
                $("#updateRoom").modal("hide");
                loadRoom();
            } else {
                setLog(f, 'alert-danger', '删除失败');
            }
            btn.button("reset");
        }, "json");
    });

    //修改
    $("#updateRoom_sub").click(function () {
        if (f.r_num.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间号码不能为空');
        } else if (f.r_size.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间大小不能为空');
        } else if (isNaN(f.r_size.value)) {
            setLog(f, 'alert-danger', '房间大小不是一个数字');
        } else if (f.r_money.value.trim().length == 0) {
            setLog(f, 'alert-danger', '房间价格不能为空');
        } else if (isNaN(f.r_money.value)) {
            setLog(f, 'alert-danger', '房间价格不是一个数字');
        } else {
            var btn = $(this).button("loading");
            $("#deleteRoom_sub")[0].disabled = true;
            setLog(f);
            var d = $(f).serialize();
            $.post("update_room.do", d, function (data) {
                $("#deleteRoom_sub")[0].disabled = false;
                if (data.success == true) {
                    setLog(f, 'alert-success', '修改成功');
                    loadRoom();
                } else {
                    setLog(f, 'alert-danger', '添加失败：' + data.reason);
                }
                btn.button("reset");
            }, "json");
        }
    });

});

//加载房间
function loadRoom() {
    $.get("load_room.do", {}, function (data) {
        $("#room_body").html("");
        for (var i in data) {
            var tr = $("<tr></tr>");
            var td1 = $("<td>" + data[i].r_id + "</td>");
            var td2 = $("<td r_typeid='" + data[i].r_typeid + "'>" + data[i].rt_name + "</td>");
            var td3 = $("<td>" + data[i].r_num + "</td>");
            var td4 = $("<td>" + data[i].r_size + "</td>");
            var td5 = $("<td r_isbath='" + data[i].r_isbath + "'>" + (data[i].r_isbath == 1 ? "是" : "否") + "</td>");
            var td6 = $("<td>" + data[i].r_money + "</td>");
            var td7 = $('<td><button class="btn btn-warning btn-sm">修改</button></td>');
            tr.append(td1, td2, td3, td4, td5, td6, td7);
            $("#room_body").append(tr);
        }
    });
}