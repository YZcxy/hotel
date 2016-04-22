//加载类型
$(function () {
    loadType();
});

//添加类型
$(function () {
    $("#addType_btn").click(function () {
        $("#addRoomType").modal();
    });
    $("#addType_sub").click(function () {
        var input = $("#room_type_input");
        if (input.val().trim().length == 0) {
            setLog(input.parent(), 'alert-danger', '客房类型不能为空');
        } else if (input.val().length > 10) {
            setLog(input.parent(), 'alert-danger', '客房类型长度少于10');
        } else {
            var btn = $(this).button("loading");
            setLog(input.parent());
            $.post("add_room_type.do", {
                rt_name: input.val()
            }, function (data) {
                if (data.success == true) {
                    setLog(input.parent(), 'alert-success', '添加成功');
                    input.val("");
                    loadType();
                } else {
                    setLog(input.parent(), 'alert-danger', '添加失败：' + data.reason);
                }
                btn.button("reset");
            }, "json");
        }
    });
});

//修改类型
$(function () {
    $("#room_type_body").on("click", "button", function () {
        var val = $(this).parent().prev().html();
        $("#up_room_type_input").val(val);
        $("#updateRoomType").modal();
        $("#room_type_id").val($(this).parent().prev().prev().html());
    });

    //删除
    $("#deleteType_sub").click(function () {
        $("#deleteConform").modal();
    });
    $("#deleteSure_sub").click(function () {
        var input = $("#up_room_type_input");
        var _this = $("#deleteType_sub");
        var id = $("#room_type_id").val();
        $("#deleteConform").modal("hide");
        var btn = _this.button("loading");
        $("#updateType_sub")[0].disabled = true;
        $.post("delete_room_type.do", {
            rt_id: id
        }, function (data) {
            $("#updateType_sub")[0].disabled = false;
            if (data.success == true) {
                $("#updateRoomType").modal("hide");
                loadType();
            } else {
                setLog(input.parent(), 'alert-danger', '删除失败');
            }
            btn.button("reset");
        }, "json");
    });

    //修改
    $("#updateType_sub").click(function () {
        var id = $("#room_type_id").val();
        var input = $("#up_room_type_input");
        if (input.val().trim().length == 0) {
            setLog(input.parent(), 'alert-danger', '客房类型不能为空');
        } else if (input.val().length > 10) {
            setLog(input.parent(), 'alert-danger', '客房类型长度少于10');
        } else {
            var btn = $(this).button("loading");
            $("#deleteType_sub")[0].disabled = true;
            setLog(input.parent());
            $.post("update_room_type.do", {
                rt_id: id,
                rt_name: input.val()
            }, function (data) {
                $("#deleteType_sub")[0].disabled = false;
                if (data.success == true) {
                    setLog(input.parent(), 'alert-success', '修改成功');
                    loadType();
                } else {
                    setLog(input.parent(), 'alert-danger', '修改失败：' + data.reason);
                }
                btn.button("reset");
            }, "json");
        }
    });
});

//加载房间类型
function loadType() {
    $.get("load_room_type.do", {}, function (data) {
        $("#room_type_body").html("");
        for (var i in data) {
            var tr = $("<tr></tr>");
            var td1 = $("<td>" + data[i].rt_id + "</td>");
            var td2 = $("<td>" + data[i].rt_name + "</td>");
            var td3 = $('<td><button class="btn btn-warning btn-sm" rt_id="' + data[i].rt_id + '">修改</button></td>');
            tr.append(td1, td2, td3);
            $("#room_type_body").append(tr);
        }
    });
}