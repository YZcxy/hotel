<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<title>预定 - 酒店预定系统</title>
		<meta charset="utf-8">
		<link rel="stylesheet" href="css/book.css" />
	</head>

	<body>
		
		<!--引用header.jsp-->
		<%@include file="header.jsp"%>
		
		<!--内容区-->
		<div class="container">
			<!--预订房间-->
			<div id="book_room">
				<!--选择房间类型-->
				<ul class="choose_type list-unstyled">
					<!--<li class="active"><a href="javascript:;">商务酒店</a></li>
					<li><a href="javascript:;">商务酒店</a></li>
					<li><a href="javascript:;">商务酒店</a></li>
					<li><a href="javascript:;">商务酒店商务酒店商务酒店</a></li>
					<li><a href="javascript:;">商务酒店</a></li>-->
				</ul>
				<!--选择预定时间-->
				<div class="choose_date">
					<nav></nav>
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>星期日</th>
								<th>星期一</th>
								<th>星期二</th>
								<th>星期三</th>
								<th>星期四</th>
								<th>星期五</th>
								<th>星期六</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>

						</tbody>
					</table>
				</div>
				<!--查看预定信息-->
				<div class="choose_room">
					<h3>预订信息</h3>

					<div>
						<h5>您已选择</h5>

						<p class="book_type">房间类型：<span></span></p>

						<p class="book_date">预订时间：<span></span>
						</p>
						<h5>选择房间号</h5>
						<p class="room_num">
							<span class="">123</span>
							<span class="active">123</span>
						</p>
						<p class="price">总价：<span>0</span></p>
						<button class="btn btn-primary" type="button" id="book_sub" data-loading-text="正在预订...">确定预订</button>
						<div id="book_log"></div>
					</div>
				</div>
			</div>

			<script src="js/book.js"></script>
		</div>
	</body>

</html>