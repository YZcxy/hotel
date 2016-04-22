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
        <li class="active"><a href="">å®¢æ¿ç±»åç®¡ç</a></li>
        <li><a href="">å®¢æ¿ç®¡ç</a></li>
        <li><a href="">å®¢æ·ä¿¡æ¯ç®¡ç</a></li>
        <li><a href="">å®¢æ¿é¢è®¢ç®¡ç</a></li>
        <li><a href="">å®¢æ¿å¥ä½ç®¡ç</a></li>
        <li><a href="">åå·¥ç®¡ç</a></li>
    </ul>
</div>

<!--åå®¹åº-->
<link rel="stylesheet" href="css/admin-room-type.css"/>
<div id="contentBox">
    <div class="room_type">
        <h4>å®¢æ¿ç±»åç®¡ç
            <button class="btn btn-info btn-sm" id="addType_btn">æ·»å ç±»å</button>
        </h4>
        <div>
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>ç±»ååç§°</th>
                    <th>ä¿®æ¹</th>
                </tr>
                </thead>
                <tbody id="room_type_body">
               <!-- <tr>
                    <td>1</td>
                    <td>åå¡åæ¿é´</td>
                    <td>
                        <button class="btn btn-warning btn-sm">ä¿®æ¹</button>
                    </td>
                </tr>-->

                </tbody>
            </table>
        </div>
        <!--æ·»å ç±»åçªå£-->
        <div class="modal fade" id="addRoomType">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>æ·»å å®¢æ¿ç±»å</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="room_type_input" placeholder="è¯·è¾å¥å®¢æ¿ç±»å"
                                   autocomplete="off"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">åæ¶</button>
                        <button type="button" class="btn btn-primary" id="addType_sub" data-loading-text="æ­£å¨æ·»å ...">
                            æ·»å ç±»å
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!--ä¿®æ¹ç±»åçªå£-->
        <div class="modal fade" id="updateRoomType">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close"
                                data-dismiss="modal" aria-hidden="true">
                            &times;
                        </button>
                        <h4>ä¿®æ¹å®¢æ¿ç±»å</h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group form-group-lg">
                            <input type="text" class="form-control" id="up_room_type_input" autocomplete="off"/>
                        </div>
                        <input type="hidden" id="room_type_id" />
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" id="deleteType_sub" data-loading-text="æ­£å¨å é¤...">
                            å é¤
                        </button>
                        <button type="button" class="btn btn-primary" id="updateType_sub" data-loading-text="æ­£å¨ä¿®æ¹...">
                            ä¿®æ¹ç±»å
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
                        å é¤åå°å é¤ææå³èè¯¥ç±»åçå®¢æ¿ï¼ä½ ç¡®å®è¦å é¤ï¼
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
<script src="js/admin-room-type.js"></script>

<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/admin.js"></script>
</body>

</html>