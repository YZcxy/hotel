/**
 * Created by CHEN on 2016/4/19.
 */

//firefox bug
$(function () {
    $("button").each(function () {
        this.disabled = false;
    });
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
