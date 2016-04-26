<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/admin-header.css"/>

<!--顶部-->
<div class="header_navbar">
    <div class="left">
        <a href="admin-room-type.jsp">后台管理中心</a>
    </div>
    <div class="right">
    	欢迎您，<span id="login_admin"></span>
        <a class="btn btn-danger" id="exit_admin" href="javascript:;">退出</a>
    </div>
</div>

<!--左边-->
<div class="left_navbar">
    <ul class="list-unstyled">
	    <li><a href="admin-customer.jsp">客户信息</a></li>
        <li><a href="admin-book.jsp">客房预订</a></li>
        <li><a href="admin-inroom.jsp">客房入住</a></li>
        <li><a href="admin-room-type.jsp">客房类型管理</a></li>
        <li><a href="admin-room.jsp">客房管理</a></li>
        <li><a href="admin-user.jsp">员工管理</a></li>
    </ul>
</div>
<script src="bootstrap/js/jquery-2.1.4.min.js"></script>
<script src="bootstrap/js/jquery.cookie.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/admin-header.js"></script>