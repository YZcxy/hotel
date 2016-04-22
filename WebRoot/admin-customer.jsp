<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>客户管理 - 后台管理</title>
		<meta charset="utf-8">
	</head>

	<body>
		
		<!--引用header.jsp-->
		<%@include file="admin-header.jsp"%>

		<!--内容区-->
		<link rel="stylesheet" href="css/admin-customer.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css" />
		<div id="contentBox">
			<div class="room">
				<h4>客户信息管理
            <button class="btn btn-info btn-sm" id="add_btn">添加客户信息</button>
        </h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>用户名</th>
								<th>真实姓名</th>
								<th>身份证号码</th>
								<th>手机号码</th>
								<th>日期</th>
								<th>修改</th>
							</tr>
						</thead>
						<tbody id="customer_body">
							<tr>
								<td>1</td>
								<td>chen</td>
								<td>王二</td>
								<td>50123456431452341564101</td>
								<td>12348645345</td>
								<td>2013-12-12 18:11:12</td>
								<td>
									<button class="btn btn-info btn-sm">订房间</button>
									<button class="btn btn-warning btn-sm">修改</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<!--添加客户窗口-->
				<div class="modal fade" id="addCustomer">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>添加客房信息</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="addCustomer_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">用户名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_username" placeholder="请输入用户名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">密码</label>

										<div class="col-xs-9">
											<input type="password" class="form-control" name="u_password" placeholder="请输入密码" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">真实姓名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_name" placeholder="请输入真实姓名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">身份证号码</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_idcard" placeholder="请输入身份证号码" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">真实姓名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_tel" placeholder="请输入手机号码" autocomplete="off" />
										</div>
									</div>

								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
								<button type="button" class="btn btn-primary" id="add_sub" data-loading-text="正在添加...">
                            添加客户信息
                        </button>
							</div>
						</div>
					</div>
				</div>

				<!--修改客房窗口-->
				<div class="modal fade" id="updateCustomer">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>修改客房信息</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="updateCustomer_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">用户名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_username" placeholder="请输入用户名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">真实姓名</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_name" placeholder="请输入真实姓名" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">身份证号码</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_idcard" placeholder="请输入身份证号码" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">手机号码</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_tel" placeholder="请输入手机号码" autocomplete="off" />
										</div>
									</div>
									<input type="hidden" name="u_id" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" id="deleteCustomer_sub" data-loading-text="正在删除...">
                            删除
                        </button>
								<button type="button" class="btn btn-primary" id="updateCustomer_sub" data-loading-text="正在修改...">
                            修改客户信息
                        </button>
							</div>
						</div>
					</div>
				</div>
				<!--订房间-->
				<div class="modal fade" id="bookRoom">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>订房间</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bookRoom_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">房间类型</label>

										<div class="col-xs-9">
											<select class="form-control" id="book_type">
                                    	<!--<option value="">商务酒店</option>
                                    	<option value="">商务酒店22</option>-->
                                    </select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">选择日期</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" id="book_date" autocomplete="off" readonly/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">选择房间号</label>
										<div class="col-xs-9">
											<div class="form-control" id="choose_room">
												<!--<span>123</span>
												<span class="active">456</span><span>123</span>-->
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">总金额</label>
										<div class="col-xs-9">
											<div class="form-control" id="book_price">0</div>
										</div>
									</div>
									<input type="hidden" id="book_username" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" id="book_sub" data-loading-text="正在预定...">
                            预定房间
                        </button>
								<button type="button" class="btn btn-primary" id="inroom_sub" data-loading-text="正在提交...">
                            直接入住
                        </button>
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

		<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
		<script src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="js/admin-customer.js"></script>

	</body>

</html>