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
                        <select class="form-control" id="book_type"></select>
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
                        <button class="btn btn-primary" id="go_book_page" type="button">预订房间</button>
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
        <!--酒店简介-->
        <div id="book_info">
            <h3>酒店简介</h3>
			<P>希尔顿国际酒店集团(HI)，为总部设于英国的希尔顿集团公司旗下分支，拥有除美国外全球范围内“希尔顿”商标的使用权。希尔顿国际酒店集团经营管理着403间酒店，包括261间希尔顿酒店，142间面向中端市场的“斯堪的克”酒店，以及与总部设在北美的希尔顿酒店管理公司合资经营的、分布在12个国家中的18间“康拉德”（亦称“港丽”）酒店。它与希尔顿酒店管理公司组合的全球营销联盟，令世界范围内双方旗下酒店总数超过了2700间，其中500多间酒店共同使用希尔顿的品牌。希尔顿国际酒店集团在全球80个国家内有着逾71000名雇员。</P>
        </div>
    </div>
</div>

<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="js/index.js"></script>
</body>
</head>
</html>