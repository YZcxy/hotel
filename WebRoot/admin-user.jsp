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
		<link rel="stylesheet" href="css/admin-user.css" />
		<div id="contentBox">
			<div class="room">
				<h4>åå·¥ç®¡ç
            <button class="btn btn-info btn-sm" id="add_btn">æ·»å åå·¥</button>
        </h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>ç¨æ·å</th>
								<th>çå®å§å</th>
								<th>ææºå·ç </th>
								<th>åå·¥èº«ä»½</th>
								<th>æ¥æ</th>
								<th>ä¿®æ¹</th>
							</tr>
						</thead>
						<tbody id="admin_body">
							<tr>
								<td>1</td>
								<td>chen</td>
								<td>çäº</td>
								<td>12348645345</td>
								<td>æ®éåå·¥</td>
								<td>2013-12-12 18:11:12</td>
								<td>
									<button class="btn btn-warning btn-sm">ä¿®æ¹</button>
								</td>
							</tr>

						</tbody>
					</table>
				</div>

				<!--æ·»å å®¢æ·çªå£-->
				<div class="modal fade" id="addAdmin">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>æ·»å åå·¥</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="addAdmin_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">ç¨æ·å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_username" placeholder="è¯·è¾å¥ç¨æ·å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">å¯ç </label>

										<div class="col-xs-9">
											<input type="password" class="form-control" name="ad_password" placeholder="è¯·è¾å¥å¯ç " />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">çå®å§å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_name" placeholder="è¯·è¾å¥çå®å§å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">ææºå·ç </label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_tel" placeholder="è¯·è¾å¥ææºå·ç " autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">åå·¥èº«ä»½</label>

										<div class="col-xs-9">
											<select class="form-control" name="ad_pow">
												<option value="1">ç®¡çå</option>
												<option value="2">æ®éåå·¥</option>
											</select>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">åæ¶</button>
								<button type="button" class="btn btn-primary" id="add_sub" data-loading-text="æ­£å¨æ·»å ...">
                            æ·»å åå·¥
                        </button>
							</div>
						</div>
					</div>
				</div>

				<!--ä¿®æ¹åå·¥çªå£-->
				<div class="modal fade" id="updateAdmin">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
								<h4>ä¿®æ¹å®¢æ¿ä¿¡æ¯</h4>
							</div>
							<div class="modal-body">
								<form class="form-horizontal" id="updateAdmin_form">
									<div class="form-group">
										<label class="col-xs-3 control-label">ç¨æ·å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_username" placeholder="è¯·è¾å¥ç¨æ·å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">çå®å§å</label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_name" placeholder="è¯·è¾å¥çå®å§å" autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">ææºå·ç </label>

										<div class="col-xs-9">
											<input type="text" class="form-control" name="ad_tel" placeholder="è¯·è¾å¥ææºå·ç " autocomplete="off" />
										</div>
									</div>
									<div class="form-group">
										<label class="col-xs-3 control-label">åå·¥èº«ä»½</label>

										<div class="col-xs-9">
											<select class="form-control" name="ad_pow">
												<option value="1">ç®¡çå</option>
												<option value="2">æ®éåå·¥</option>
											</select>
										</div>
									</div>
									<input type="hidden" name="ad_id" />
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-danger" id="deleteAdmin_sub" data-loading-text="æ­£å¨å é¤...">å é¤</button>
								<button type="button" class="btn btn-primary" id="updateAdmin_sub" data-loading-text="æ­£å¨ä¿®æ¹...">ä¿®æ¹åå·¥ä¿¡æ¯</button>
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
		<script src="js/admin-user.js"></script>

		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="js/admin.js"></script>
	</body>

</html>