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
				<li><a href="">å®¢æ·ä¿¡æ¯ç®¡ç</a></li>
				<li class="active"><a href="">å®¢æ¿é¢è®¢ç®¡ç</a></li>
				<li><a href="">å®¢æ¿å¥ä½ç®¡ç</a></li>
				<li><a href="">åå·¥ç®¡ç</a></li>
			</ul>
		</div>

		<!--åå®¹åº-->
		<link rel="stylesheet" href="css/admin-inroom.css" />
		<div id="contentBox">
			<div class="room">
				<h4>å®¢æ¿é¢å®ç®¡ç</h4>
				<div>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>ID</th>
								<th>ç¨æ·å</th>
								<th>çå®å§å</th>
								<th>æ¿é´å·</th>
								<th>å¥ä½æ¶é´</th>
								<th>æä½</th>
							</tr>
						</thead>
						<tbody id="room_body">
							<tr>
								<td>1</td>
								<td>chen</td>
								<td>éæ°</td>
								<td>320</td>
								<td>2016-12-02</td>
								<td>
									<button class="btn btn-danger btn-sm">å é¤</button>
								</td>
							</tr>

						</tbody>
					</table>
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
								å é¤å¥ä½ä¿¡æ¯åå°ä¸è½æ¢å¤ï¼ä½ ç¡®å®è¦å é¤ï¼
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
		<script src="js/admin-inroom.js"></script>

		<script src="bootstrap/js/bootstrap.min.js"></script>
		<script src="js/admin.js"></script>
	</body>

</html>