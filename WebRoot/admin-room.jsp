<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>客房管理 - 后台管理</title>
    <meta charset="utf-8">
</head>
<body>

<!--引用header.jsp-->
<%@include file="admin-header.jsp"%>

<!--内容区-->
<link rel="stylesheet" href="css/admin-room.css"/>
<div id="contentBox">
    <div class="room">
        <h4>客房管理
            <button class="btn btn-info btn-sm" id="add_btn">添加客房</button>
        </h4>
        <div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>房间类型</th>
                    <th>房间号</th>
                    <th>房间大小(m<sup>2</sup>)</th>
                    <th>是否独卫</th>
                    <th>价格(元)</th>
                    <th>修改</th>
                </tr>
                </thead>
                <tbody id="room_body">
                 <tr>
                     <td>1</td>
                     <td>商务型房间</td>
                     <td>0123</td>
                     <td>32</td>
                     <td>是</td>
                     <td>998</td>
                     <td>
                         <button class="btn btn-warning btn-sm">修改</button>
                     </td>
                 </tr>

                </tbody>
            </table>
        </div>

        <!--添加客房窗口-->
        <div class="modal fade" id="addRoom">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>添加客房信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="addRoom_form">
                            <div class="form-group">
                                <label class="col-xs-3 control-label">房间号码</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_num" placeholder="请输入房间号码"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">房间大小</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_size" placeholder="请输入房间大小，单位(平方米)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">客房类型</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_typeid">
                                        <option value="0">商务型客房</option>
                                        <option value="1">普通客房</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">是否有独卫</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_isbath">
                                        <option value="1">有</option>
                                        <option value="0">没有</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">客房价格</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_money" placeholder="请输入价格，单位(元)"
                                           autocomplete="off"/>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="button" class="btn btn-primary" id="add_sub" data-loading-text="正在添加...">
                            添加客房
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!--修改客房窗口-->
        <div class="modal fade" id="updateRoom">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>修改客房信息</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="updateRoom_form">
                            <div class="form-group">
                                <label class="col-xs-3 control-label">房间号码</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_num" placeholder="请输入房间号码"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">房间大小</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_size" placeholder="请输入房间大小，单位(平方米)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">客房类型</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_typeid">
                                        <option value="0">商务型客房</option>
                                        <option value="1">普通客房</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">是否有独卫</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_isbath">
                                        <option value="1">有</option>
                                        <option value="0">没有</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">客房价格</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_money" placeholder="请输入价格，单位(元)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <input type="hidden" name="r_id">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="deleteRoom_sub" data-loading-text="正在删除...">
                            删除
                        </button>
                        <button type="button" class="btn btn-primary" id="updateRoom_sub" data-loading-text="正在修改...">
                           修改房间
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

<script src="js/admin-room.js"></script>

</body>
</html>