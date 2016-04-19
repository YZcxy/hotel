/**
 * Created by CHEN on 2016/4/18.
 */

//预订房间
$(function () {
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
})