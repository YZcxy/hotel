<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>我的预定 - 酒店预定系统</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="css/mybook.css"/>
<body>

<!--引用header.jsp-->
<%@include file="header.jsp"%>

<!--内容区-->
<div class="container">
    <div class="col-xs-11">
        <!--预订信息-->
        <div id="book_room">
            <h3>我的预定信息<span class="glyphicon glyphicon-info-sign"></span></h3>
            <div class="alert_log"></div>
            <div class="tb">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>ID</th>
							<th>房间类型</th>
							<th>房间号</th>
							<th>房间大小</th>
							<th>是否有独卫</th>
							<th>价格(元)</th>
							<th>预定日期</th>
							<th>退订</th>
						</tr>
					</thead>
					<tbody id="book_body"></tbody>
				</table>
			</div>
        </div>
	</div>   
</div>
<!-- 退订确认弹窗-->
<div class="modal fade" id="deleteConform">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close"
                        data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4>确定退订吗？</h4>
            </div>
            <div class="modal-body">
                退订后将无法恢复，你确定要退订？
                <input type="hidden" id="rb_id" />
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-danger" id="deleteSure_sub" data-loading-text="正在处理...">
                    确定退订
                </button>
            </div>
        </div>
    </div>
</div>

<script src="js/mybook.js"></script>
</body>
</head>
</html>