<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>员工管理 - 后台管理</title>
		<meta charset="utf-8">
	</head>

	<body>
		<!--引用header.jsp-->
		<%@include file="admin-header.jsp"%>
			
		<!--内容区-->
		<link rel="stylesheet" href="css/admin-user.css" />
		<div id="contentBox">
			<div class="room">
				<h4>员工管理
            <button class="btn btn-info btn-sm" id="add_btn">添加员工</button>
        </h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>手机号码</th>
								<th>员工身份</th>
								<th>日期</th>
								<th>修改</th>
							</tr>
						</thead>
						<tbody id="admin_body"></tbody>
					</table>
				</div>

				<!--添加客户窗口-->
				<div class="modal fade" id="addAdmin">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>添加员工</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="addAdmin_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">用户名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_username" placeholder="请输入用户名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">密码</label>

										<div class="col-xs-9">
											<input type="password" class="form-control" name="ad_password" placeholder="请输入密码" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">真实姓名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_name" placeholder="请输入真实姓名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">手机号码</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_tel" placeholder="请输入手机号码" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">员工身份</label>

										<div class="col-xs-9">
											<select class="form-control" name="ad_pow">
												<option value="2">管理员</option>
												<option value="3">普通员工</option>
											</select>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" id="add_sub" data-loading-text="正在添加...">
                            添加员工
                        </button>
							</div>
						</div>
					</div>
				</div>

				<!--修改员工窗口-->
				<div class="modal fade" id="updateAdmin">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>修改客房信息</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="updateAdmin_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">用户名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_username" placeholder="请输入用户名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">真实姓名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_name" placeholder="请输入真实姓名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">手机号码</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_tel" placeholder="请输入手机号码" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">员工身份</label>

										<div class="col-xs-9">
											<select class="form-control" name="ad_pow">
												<option value="2">管理员</option>
												<option value="3">普通员工</option>
											</select>
										</div>
									</div>
									<input type="hidden" name="ad_id" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" id="deleteAdmin_sub" data-loading-text="正在删除...">删除</button>
								<button type="button" class="btn btn-primary" id="updateAdmin_sub" data-loading-text="正在修改...">修改员工信息</button>
							</div>
						</div>
					</div>
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
								删除客房信息后将不能恢复，你确定要删除？
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-danger" id="deleteSure_sub" data-loading-text="正在删除...">
                            删除
                        </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="js/admin-user.js"></script>
	</body>
</html>