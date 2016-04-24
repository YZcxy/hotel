<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>客房入住管理 - 后台管理</title>
		<meta charset="utf-8">
	</head>

	<body>

		<!--引用header.jsp-->
		<%@include file="admin-header.jsp"%>

		<!--内容区-->
		<link rel="stylesheet" href="css/admin-inroom.css" />
		<div id="contentBox">
			<div class="room">
				<h4>客房预定管理</h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>房间号</th>
								<th>入住时间</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="room_body"></tbody>
					</table>
				</div>

				<!-- 删除确认弹窗-->
				<div class="modal fade" id="deleteConform">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>确定删除吗？</h4>
							</div>
							<div class="modal-body">
								删除入住信息后将不能恢复，你确定要删除？
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-danger" id="deleteSure_sub" data-loading-text="正在删除...">删除</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/admin-inroom.js"></script>

	</body>
</html>