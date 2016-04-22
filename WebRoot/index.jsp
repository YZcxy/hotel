<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>主页 - 酒店预定系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="css/index.css"/>
<body>

<!--引用header.jsp-->
<%@include file="header.jsp"%>

<!--内容区-->
<div class="container">
    <div class="col-xs-8">
        <!--预订房间-->
        <div id="book_room">
            <h3>预订房间<span class="glyphicon glyphicon-circle-arrow-right"></span></h3>

            <form class="form-horizontal" id="book_form">
                <div class="form-group">
                    <label class="control-label col-xs-2">房间类型</label>

                    <div class="col-xs-7">
                        <select class="form-control">
                            <option>商务型</option>
                            <option>商务型</option>
                            <option>商务型</option>
                            <option>商务型</option>
                            <option>商务型</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-xs-2">预订日期</label>

                    <div class="col-xs-7">
                        <input class="form-control" name="" type="text" id="book_date" autocomplete="off" readonly>
                        <label for="book_date">
                            <span class="glyphicon glyphicon-calendar choose_date_icon"></span>
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-xs-offset-2 col-xs-10">
                        <button class="btn btn-primary" type="button">预订房间</button>
                    </div>
                </div>

            </form>
        </div>

        <!--酒店实拍图-->
        <div id="hotel_pictures">
            <h3>酒店房间实拍图<span class="glyphicon glyphicon-picture"></span></h3>

            <div class="box">
                <ul class="list-inline" id="hotel_pictures_list">
                    <li><img class="img-thumbnail" src="img/source/aa1.jpg"></li>
                    <li><img class="img-thumbnail" src="img/source/aa2.jpg"></li>
                    <li><img class="img-thumbnail" src="img/source/aa3.jpg"></li>
                    <li><img class="img-thumbnail" src="img/source/aa1.jpg"></li>
                    <li><img class="img-thumbnail" src="img/source/aa1.jpg"></li>
                    <li><img class="img-thumbnail" src="img/source/aa1.jpg"></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="col-xs-4">
        <!--房间预订信息-->
        <div id="book_info">
            <h3>房间预订信息<span class="glyphicon glyphicon-info-sign"></span></h3>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>成**</i>预订了商务间 2016-05-21 21:30预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>

            <p><i>王**</i>预订了商务间 2016-05-21 21:30 </p>
        </div>
    </div>
</div>

<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/index.js"></script>
</body>
</head>
</html>