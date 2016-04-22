<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/header.css"/>

<!--顶部logo-->
<div class="container" id="logo">
	<h1>酒店预定系统</h1>
</div>

<!--导航栏-->
<nav class="container header_navbar">
	<ul class="pull-right list-inline" id="_login_info">
		<li><a href="javascript:;" id="openLoginBox">登录 / 注册</a></li>
	</ul>
	<ul class="list-inline">
		<li class="active"><a href="./">首页</a></li>
		<li><a href="book.jsp">预定房间</a></li>
	</ul>
</nav>

<!--登录 注册框-->
<div class="modal fade" id="loginBox" aria-labelledby="modal_title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button class="close" type="button" data-dismiss="modal">&times;</button>
				<h4 class="modal-title" id="modal_title">登录 / 注册</h4>
			</div>
			<div class="modal-body">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#userLogin" data-toggle="tab">登录</a></li>
					<li><a href="#regist" data-toggle="tab">注册</a></li>
					<li><a href="#adminLogin" data-toggle="tab">员工登录</a></li>
				</ul>
				<div class="tab-content">
					<!-- 用户登录-->
					<div class="tab-pane active" id="userLogin">
						<form id="userLogin_form">
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="u_username" placeholder="用户名" autocomplete="off">
							</div>
							<div class="form-group form-group-lg">
								<input type="password" class="form-control" name="u_password" placeholder="密码">
							</div>
							<button class="btn btn-primary btn-block btn-lg submit" type="button" data-loading-text="登录中...">登录
                    </button>
						</form>
					</div>
					<!-- 用户注册-->
					<div class="tab-pane" id="regist">
						<form id="regist_form">
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="u_username" placeholder="用户名" autocomplete="off">
							</div>
							<div class="form-group form-group-lg">
								<input type="password" class="form-control" name="u_password" placeholder="密码">
							</div>
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="u_name" placeholder="真实姓名" autocomplete="off">
							</div>
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="u_idcard" placeholder="身份证号码" autocomplete="off">
							</div>
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="u_tel" placeholder="手机号码" autocomplete="off">
							</div>
							<button class="btn btn-primary btn-block btn-lg submit" type="button" data-loading-text="注册中...">注册</button>
						</form>
					</div>
					<!-- 员工登录-->
					<div class="tab-pane" id="adminLogin">
						<form id="adminLogin_form">
							<div class="form-group form-group-lg">
								<input type="text" class="form-control" name="ad_username" placeholder="员工账号" autocomplete="off">
							</div>
							<div class="form-group form-group-lg">
								<input type="password" class="form-control" name="ad_password" placeholder="密码">
							</div>
							<button class="btn btn-primary btn-block btn-lg submit" type="button" data-loading-text="正在登录...">员工登录</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="bootstrap/js/jquery.cookie.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/header.js"></script>