/**
 * Created by CHEN on 2016/4/19.
 */

//选择房间类型
$(function () {
    var ul = $("#book_room .choose_type");

    //点击事件
    ul.on("click", "li", function () {
        ul.find("li").removeClass("active");
        $(this).addClass("active");
    });
});

//选择月份
$(function () {
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
    nav.on("click", "a", function () {
        nav.find("a").removeClass("active");
        $(this).addClass("active");
    });
});

//选择日期
$(function () {

        //写入日历
        var year = new Date().getFullYear();
        var month = new Date().getMonth() + 1;

        var monthStart = year + "-" + month + "-1";
        var dayStart = new Date(monthStart).getDay();
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
        var td = $("#book_room .choose_date td");
        //写入
        for (var i = 1; i <= monthNum; i++) {
            td.eq(i+dayStart-1).html(i);
        }
    }
)
;