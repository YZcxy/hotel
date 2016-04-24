<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>客房类型管理 - 后台管理</title>
    <meta charset="utf-8">
</head>
<body>

<!--引用header.jsp-->
<%@include file="admin-header.jsp"%>

<!--内容区-->
<link rel="stylesheet" href="css/admin-room-type.css"/>
<div id="contentBox">
    <div class="room_type">
        <h4>客房类型管理
            <button class="btn btn-info btn-sm" id="addType_btn">添加类型</button>
        </h4>
        <div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>类型名称</th>
                    <th>修改</th>
                </tr>
                </thead>
                <tbody id="room_type_body"></tbody>
            </table>
        </div>
        <!--添加类型窗口-->
        <div class="modal fade" id="addRoomType">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>添加客房类型</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="room_type_input" placeholder="请输入客房类型"
                                   autocomplete="off"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" id="addType_sub" data-loading-text="正在添加...">
                            添加类型
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--修改类型窗口-->
        <div class="modal fade" id="updateRoomType">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>修改客房类型</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="up_room_type_input" autocomplete="off"/>
                        </div>
                        <input type="hidden" id="room_type_id" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="deleteType_sub" data-loading-text="正在删除...">
                            删除
                        </button>
                        <button type="button" class="btn btn-primary" id="updateType_sub" data-loading-text="正在修改...">
                            修改类型
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
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>确定删除吗？</h4>
                    </div>
                    <div class="modal-body">
                        删除后将删除所有关联该类型的客房，你确定要删除？
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

<script src="js/admin-room-type.js"></script>

</body>
</html>