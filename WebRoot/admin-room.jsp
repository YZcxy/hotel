<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>ADMIN - HOTEL</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
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
        <li class="active"><a href="">å®¢æ¿ç®¡ç</a></li>
        <li><a href="">å®¢æ·ä¿¡æ¯ç®¡ç</a></li>
        <li><a href="">å®¢æ¿é¢è®¢ç®¡ç</a></li>
        <li><a href="">å®¢æ¿å¥ä½ç®¡ç</a></li>
        <li><a href="">åå·¥ç®¡ç</a></li>
    </ul>
</div>

<!--åå®¹åº-->
<link rel="stylesheet" href="css/admin-room.css"/>
<div id="contentBox">
    <div class="room">
        <h4>å®¢æ¿ç®¡ç
            <button class="btn btn-info btn-sm" id="add_btn">æ·»å å®¢æ¿</button>
        </h4>
        <div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>æ¿é´ç±»å</th>
                    <th>æ¿é´å·</th>
                    <th>æ¿é´å¤§å°(m<sup>2</sup>)</th>
                    <th>æ¯å¦ç¬å«</th>
                    <th>ä»·æ ¼(å)</th>
                    <th>ä¿®æ¹</th>
                </tr>
                </thead>
                <tbody id="room_body">
                 <tr>
                     <td>1</td>
                     <td>åå¡åæ¿é´</td>
                     <td>0123</td>
                     <td>32</td>
                     <td>æ¯</td>
                     <td>998</td>
                     <td>
                         <button class="btn btn-warning btn-sm">ä¿®æ¹</button>
                     </td>
                 </tr>

                </tbody>
            </table>
        </div>

        <!--æ·»å å®¢æ¿çªå£-->
        <div class="modal fade" id="addRoom">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>æ·»å å®¢æ¿ä¿¡æ¯</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="addRoom_form">
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¿é´å·ç </label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_num" placeholder="è¯·è¾å¥æ¿é´å·ç "
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¿é´å¤§å°</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_size" placeholder="è¯·è¾å¥æ¿é´å¤§å°ï¼åä½(å¹³æ¹ç±³)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">å®¢æ¿ç±»å</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_typeid">
                                        <option value="0">åå¡åå®¢æ¿</option>
                                        <option value="1">æ®éå®¢æ¿</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¯å¦æç¬å«</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_isbath">
                                        <option value="1">æ</option>
                                        <option value="0">æ²¡æ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">å®¢æ¿ä»·æ ¼</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_money" placeholder="è¯·è¾å¥ä»·æ ¼ï¼åä½(å)"
                                           autocomplete="off"/>
                                </div>
                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">åæ¶</button>
                        <button type="button" class="btn btn-primary" id="add_sub" data-loading-text="æ­£å¨æ·»å ...">
                            æ·»å å®¢æ¿
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!--ä¿®æ¹å®¢æ¿çªå£-->
        <div class="modal fade" id="updateRoom">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>ä¿®æ¹å®¢æ¿ä¿¡æ¯</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="updateRoom_form">
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¿é´å·ç </label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_num" placeholder="è¯·è¾å¥æ¿é´å·ç "
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¿é´å¤§å°</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_size" placeholder="è¯·è¾å¥æ¿é´å¤§å°ï¼åä½(å¹³æ¹ç±³)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">å®¢æ¿ç±»å</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_typeid">
                                        <option value="0">åå¡åå®¢æ¿</option>
                                        <option value="1">æ®éå®¢æ¿</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">æ¯å¦æç¬å«</label>

                                <div class="col-xs-9">
                                    <select class="form-control" name="r_isbath">
                                        <option value="1">æ</option>
                                        <option value="0">æ²¡æ</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-xs-3 control-label">å®¢æ¿ä»·æ ¼</label>

                                <div class="col-xs-9">
                                    <input type="text" class="form-control" name="r_money" placeholder="è¯·è¾å¥ä»·æ ¼ï¼åä½(å)"
                                           autocomplete="off"/>
                                </div>
                            </div>
                            <input type="hidden" name="r_id">

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="deleteRoom_sub" data-loading-text="æ­£å¨å é¤...">
                            å é¤
                        </button>
                        <button type="button" class="btn btn-primary" id="updateRoom_sub" data-loading-text="æ­£å¨ä¿®æ¹...">
                           ä¿®æ¹æ¿é´
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
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
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
<script src="js/admin-room.js"></script>

<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/admin.js"></script>
</body>

</html>