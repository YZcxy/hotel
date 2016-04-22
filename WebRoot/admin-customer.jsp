<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>ADMIN - HOTEL</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/admin.css" />
	</head>

	<body>

		<!--é¡¶é¨-->
		<div class="header_navbar">
			<div class="left">
				<a href="admin.inc.jsp">åå°ç®¡çä¸­å¿</a>
				<a class="add_admin" href=""><span class="glyphicon glyphicon-plus"></span>æ·»å ç®¡çå</a>
			</div>
			<div class="right">
				æ¬¢è¿æ¨ï¼<span>CHENJEY</span>
				<a class="btn btn-danger" href="javascript:;">éåº</a>
			</div>
		</div>

		<!--å·¦è¾¹-->
		<div class="left_navbar">
			<ul class="list-unstyled">
				<li><a href="">å®¢æ¿ç±»åç®¡ç</a></li>
				<li><a href="">å®¢æ¿ç®¡ç</a></li>
				<li class="active"><a href="">å®¢æ·ä¿¡æ¯ç®¡ç</a></li>
				<li><a href="">å®¢æ¿é¢è®¢ç®¡ç</a></li>
				<li><a href="">å®¢æ¿å¥ä½ç®¡ç</a></li>
				<li><a href="">åå·¥ç®¡ç</a></li>
			</ul>
		</div>

		<!--åå®¹åº-->
		<link rel="stylesheet" href="css/admin-customer.css" />
		<link rel="stylesheet" href="bootstrap/css/bootstrap-datetimepicker.min.css" />
		<div id="contentBox">
			<div class="room">
				<h4>å®¢æ·ä¿¡æ¯ç®¡ç
            <button class="btn btn-info btn-sm" id="add_btn">æ·»å å®¢æ·ä¿¡æ¯</button>
        </h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>ç¨æ·å</th>
								<th>çå®å§å</th>
								<th>èº«ä»½è¯å·ç </th>
								<th>ææºå·ç </th>
								<th>æ¥æ</th>
								<th>ä¿®æ¹</th>
							</tr>
						</thead>
						<tbody id="customer_body">
							<tr>
								<td>1</td>
								<td>chen</td>
								<td>çäº</td>
								<td>50123456431452341564101</td>
								<td>12348645345</td>
								<td>2013-12-12 18:11:12</td>
								<td>
									<button class="btn btn-info btn-sm">è®¢æ¿é´</button>
									<button class="btn btn-warning btn-sm">ä¿®æ¹</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<!--æ·»å å®¢æ·çªå£-->
				<div class="modal fade" id="addCustomer">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>æ·»å å®¢æ¿ä¿¡æ¯</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="addCustomer_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">ç¨æ·å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_username" placeholder="è¯·è¾å¥ç¨æ·å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">å¯ç </label>

										<div class="col-xs-9">
											<input type="password" class="form-control" name="u_password" placeholder="è¯·è¾å¥å¯ç " />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">çå®å§å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_name" placeholder="è¯·è¾å¥çå®å§å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">èº«ä»½è¯å·ç </label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_idcard" placeholder="è¯·è¾å¥èº«ä»½è¯å·ç " autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">çå®å§å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_tel" placeholder="è¯·è¾å¥ææºå·ç " autocomplete="off" />
										</div>
									</div>

								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">åæ¶</button>
								<button type="button" class="btn btn-primary" id="add_sub" data-loading-text="æ­£å¨æ·»å ...">
                            æ·»å å®¢æ·ä¿¡æ¯
                        </button>
							</div>
						</div>
					</div>
				</div>

				<!--ä¿®æ¹å®¢æ¿çªå£-->
				<div class="modal fade" id="updateCustomer">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>ä¿®æ¹å®¢æ¿ä¿¡æ¯</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="updateCustomer_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">ç¨æ·å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_username" placeholder="è¯·è¾å¥ç¨æ·å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">çå®å§å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_name" placeholder="è¯·è¾å¥çå®å§å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">èº«ä»½è¯å·ç </label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_idcard" placeholder="è¯·è¾å¥èº«ä»½è¯å·ç " autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">ææºå·ç </label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="u_tel" placeholder="è¯·è¾å¥ææºå·ç " autocomplete="off" />
										</div>
									</div>
									<input type="hidden" name="u_id" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" id="deleteCustomer_sub" data-loading-text="æ­£å¨å é¤...">
                            å é¤
                        </button>
								<button type="button" class="btn btn-primary" id="updateCustomer_sub" data-loading-text="æ­£å¨ä¿®æ¹...">
                            ä¿®æ¹å®¢æ·ä¿¡æ¯
                        </button>
							</div>
						</div>
					</div>
				</div>
				<!--è®¢æ¿é´-->
				<div class="modal fade" id="bookRoom">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>è®¢æ¿é´</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="bookRoom_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">æ¿é´ç±»å</label>

										<div class="col-xs-9">
											<select class="form-control" id="book_type">
                                    	<!--<option value="">åå¡éåº</option>
                                    	<option value="">åå¡éåº22</option>-->
                                    </select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">éæ©æ¥æ</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" id="book_date" autocomplete="off" readonly/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">éæ©æ¿é´å·</label>
										<div class="col-xs-9">
											<div class="form-control" id="choose_room">
												<!--<span>123</span>
												<span class="active">456</span><span>123</span>-->
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">æ»éé¢</label>
										<div class="col-xs-9">
											<div class="form-control" id="book_price">0</div>
										</div>
									</div>
									<input type="hidden" id="book_username" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-info" id="book_sub" data-loading-text="æ­£å¨é¢å®...">
                            é¢å®æ¿é´
                        </button>
								<button type="button" class="btn btn-primary" id="inroom_sub" data-loading-text="æ­£å¨æäº¤...">
                            ç´æ¥å¥ä½
                        </button>
							</div>
						</div>
					</div>
				</div>
				<!-- å é¤ç¡®è®¤å¼¹çª-->
				<div class="modal fade" id="deleteConform">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>ç¡®å®å é¤åï¼</h4>
							</div>
							<div class="modal-body">
								å é¤å®¢æ¿ä¿¡æ¯åå°ä¸è½æ¢å¤ï¼ä½ ç¡®å®è¦å é¤ï¼
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">åæ¶</button>
								<button type="button" class="btn btn-danger" id="deleteSure_sub" data-loading-text="æ­£å¨å é¤...">
                            å é¤
                        </button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script src="bootstrap/js/jquery-2.1.4.min.js"></script>
		<script src="bootstrap/js/bootstrap-datetimepicker.min.js"></script>
		<script src="bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="js/admin-customer.js"></script>

		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="js/admin.js"></script>
	</body>

</html>