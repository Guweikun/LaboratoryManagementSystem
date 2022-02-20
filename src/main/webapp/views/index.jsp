<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/2/14
  Time: 11:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="实验室管理系统">
    <meta name="keywords" content="实验室管理系统">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <title>实验室管理系统</title>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!--[if lt IE 9]>
    <script src="js/html5shiv.min.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/common.css" />
    <link rel="stylesheet" type="text/css" href="css/slide.css" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/flat-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/jquery.nouislider.css">
</head>

<body>
<div id="wrap">
    <!-- 左侧菜单栏目块 -->
    <div class="leftMeun" id="leftMeun">
        <div id="logoDiv">
            <p id="logoP"><img id="logo" alt="左右结构项目" src="images/logo.png"><span>实验室管理系统</span></p>
        </div>
        <div id="personInfor">
            <p id="userName">${sessionScope.u},欢迎您</p>
            <p>
                <a href="http://localhost:8080/LaboratoryManagementSystem/logout">退出登录</a>
            </p>
        </div>
        <div class="meun-title">系统管理</div>
        <div class="meun-item " href="#sour" aria-controls="sour" role="tab" data-toggle="tab"><img src="images/icon_source.png">实验室管理</div>
        <div class="meun-item" href="#char" aria-controls="char" role="tab" data-toggle="tab"><img src="images/icon_chara_grey.png">软件管理</div>
        <div class="meun-item" href="#user" aria-controls="user" role="tab" data-toggle="tab"><img src="images/icon_user_grey.png">用户管理</div>
        <div class="meun-item" href="#chan" aria-controls="chan" role="tab" data-toggle="tab"><img src="images/icon_change_grey.png">课程管理</div>
        <div class="meun-title">信息查看</div>
        <div class="meun-item" href="#scho" aria-controls="scho" role="tab" data-toggle="tab"><img src="images/icon_house_grey.png">实验室信息</div>
        <div class="meun-item" href="#regu" aria-controls="regu" role="tab" data-toggle="tab"><img src="images/icon_rule_grey.png">软件信息</div>
        <div class="meun-item" href="#stud" aria-controls="stud" role="tab" data-toggle="tab"><img src="images/icon_card_grey.png">人员信息</div>
        <div class="meun-item" href="#sitt" aria-controls="sitt" role="tab" data-toggle="tab"><img src="images/icon_char_grey.png">课程信息</div>
    </div>
    <!-- 右侧具体内容栏目 -->
    <div id="rightContent">
        <a class="toggle-btn" id="nimei">
            <i class="glyphicon glyphicon-align-justify"></i>
        </a>
        <!-- Tab panes -->
        <div class="tab-content">
            <!-- 实验室管理模块 -->
            <div role="tabpanel" class="tab-pane active" id="sour">
                <div class="check-div form-inline">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSource">添加实验室</button>
                </div>
                <div class="data-div">
                    <table class="table">
                        <!--表头-->
                        <thead>
                        <tr>
                            <th>地址</th>
                            <th>名称</th>
                            <th>管理员号</th>
                            <th>电脑台数</th>
                            <th>电脑配置</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <!--表体-->
                        <tbody>
                        <c:forEach items="${labList}" var="lab">
                            <tr>
                                <td>${lab.address}</td>
                                <td>${lab.lab_name}</td>
                                <td>${lab.manager_num}</td>
                                <td>${lab.quantity}</td>
                                <td>${lab.model}</td>
                                <td>
                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource" @click="updateLab('${lab.address}','${lab.lab_name}','${lab.manager_num}','${lab.quantity}','${lab.model}')">修改</button>
                                    <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource" href="http://localhost:8080/LaboratoryManagementSystem/index/${lab.address}" @click="deleteLab">删除</a>
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                    <form id="deleteForm" method="post">
                        <input type="hidden" name="_method" value="delete">
                    </form>
                </div>

                <!--弹出窗口 添加实验室-->
                <div class="modal fade" id="addSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加实验室</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="http://localhost:8080/LaboratoryManagementSystem/index" method="post">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" required="required" name="address">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sLink" required="required" name="lab_name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">管理员：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" required="required" name="manager_num">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">电脑台数：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sKnot" required="required" name="quantity">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">电脑配置：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" required="required" name="model">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-xs btn-green" value="确 定"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--修改资源弹出窗口-->
                <div class="modal fade" id="changeSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改资源</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" id="update_form" action="http://localhost:8080/LaboratoryManagementSystem/index" method="post">
                                        <input type="hidden" name="_method" value="put">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">地址：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" v-bind:value="lab.address" name="address">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">名称：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sLink" v-bind:value="lab.lab_name" name="lab_name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">管理员：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="manager_num" v-bind:value="lab.manager_num">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">电脑台数：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sKnot" name="quantity" v-bind:value="lab.quantity">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">电脑配置：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" name="model" v-bind:value="lab.model">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-green" value="确 定"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <!--弹出删除资源警告窗口-->
                <div class="modal fade" id="deleteSource" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该资源？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger" @click="delete_sure">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>
            <!-- 软件管理模块 -->
            <div role="tabpanel" class="tab-pane" id="char">

                <div class="check-div">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addChar">添加软件</button>
                </div>
                <div class="data-div">
                    <div class="tablebody">

                        <div class="panel-group" id="accordion">
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        实验室地址
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        实验室名称
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        软件列表
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:forEach items="${labList}" var="lab">

                        <div class="panel-group" id="accordion">
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                            ${lab.address}
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                            ${lab.lab_name}
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        <div id="software" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse${lab.address}" @click="selectSoftware('${lab.address}')">
                                            <span id="topA" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>软件列表</span>
                                        </div>
                                    </div>
                                </div>
                                <div id="collapse${lab.address}" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <table class="table">
                                            <thead>
                                            <tr class="success">
                                                <th>软件名称</th>
                                                <th>类型</th>
                                                <th>版本号</th>
                                                <th>大小</th>
                                                <th>操作</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr v-for="(labsoftware,i) in labsoftwares" class="success">
                                                <td>{{labsoftware.software_name}}</td>
                                                <td>{{labsoftware.category}}</td>
                                                <td>{{labsoftware.edition}}</td>
                                                <td>{{labsoftware.space}}</td>
                                                <td>
                                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeChar" @click="changeSoftware('${lab.address}',labsoftware.software_name,labsoftware.category,labsoftware.edition,labsoftware.space)">修改</button>
                                                    <button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteChar" @click="deleteSoftware('${lab.address}',labsoftware.software_name,labsoftware.category,labsoftware.edition,labsoftware.space)">删除</button>
                                                <td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>

                </div>

                <form id="selectSoftware" method="get">
                    <input type="hidden">
                </form>

                <!--增加软件弹出窗口-->
                <div class="modal fade" id="addChar" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加软件</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="http://localhost:8080/LaboratoryManagementSystem/index/labsoftware" method="post">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-4 control-label">实验室地址：</label>
                                            <div class="col-xs-4" style=" padding-right: 40px;text-align: right;">
                                                <select class=" form-control" name="address">
                                                <c:forEach items="${labList}" var="lab">
                                                    <option>${lab.address}</option>
                                                </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">软件名称：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="software_name"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件类型：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="category">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件版本：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="edition">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件大小：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="space">
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-green" value="添 加"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--修改软件弹出窗口-->
                <div class="modal fade" id="changeChar" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改软件</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="http://localhost:8080/LaboratoryManagementSystem/index/labsoftware" method="post">
                                        <input type="hidden" name="_method" value="put">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-4 control-label">实验室地址：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="address" v-bind:value="labsoftware.address"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">软件名称：</label>
                                            <div class="col-xs-6 ">
                                                <input type="text" class="form-control input-sm duiqi" name="software_name" v-bind:value="labsoftware.software_name"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件类型：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="category" v-bind:value="labsoftware.category">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件版本：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="edition" v-bind:value="labsoftware.edition">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">软件大小：</label>
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="space" v-bind:value="labsoftware.space">
                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-green" value="修 改"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--弹出删除权限警告窗口-->
                <div class="modal fade" id="deleteChar" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该软件？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger" @click="deleteSoftware_sure">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

            </div>
            <!--用户管理模块-->
            <div role="tabpanel" class="tab-pane" id="user">
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-3">
                            员工号
                        </div>
                        <div class="col-xs-3">
                            用户名
                        </div>
                        <div class="col-xs-3">
                            权限
                        </div>
                        <div class="col-xs-3">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">

                        <c:forEach items="${userList}" var="user">
                            <div class="row">
                                <div class="col-xs-3 ">
                                        ${user.account}
                                </div>
                                <div class="col-xs-3">
                                        ${user.name}
                                </div>
                                <div class="col-xs-3">
                                    <c:if test="${user.permission == 0}">
                                        普通用户
                                    </c:if>
                                    <c:if test="${user.permission == 1}">
                                        管理员
                                    </c:if>
                                </div>
                                <div class="col-xs-3">
                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#reviseUser" @click="changeUser('${user.account}','${user.name}','${user.permission}')">修改</button>
                                    <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteUser" href="http://localhost:8080/LaboratoryManagementSystem/index/user/${user.account}" @click="deleteUser">删除</a>
                                </div>
                            </div>

                        </c:forEach>

                    </div>

                </div>


                <!--弹出修改用户窗口-->
                <div class="modal fade" id="reviseUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改用户</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="http://localhost:8080/LaboratoryManagementSystem/index/user" method="post">
                                        <input type="hidden" name="_method" value="put">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">员工号：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" name="account" v-bind:value="user.account">
                                            </div>
                                        </div>
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">用户名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" name="name" v-bind:value="user.name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">权限：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sKnot" name="permisson" v-bind:value="user.permission">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-green" value="修 改"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <form id="deleteUserform" method="post">
                    <input type="hidden" name="_method" value="delete">
                </form>

                <!--弹出删除用户警告窗口-->
                <div class="modal fade" id="deleteUser" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该用户？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn  btn-xs btn-danger" @click="deleteUser_sure">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>

            <!-- 课程管理模块 -->
            <div role="tabpanel" class="tab-pane" id="chan">
                <div class="check-div form-inline">
                    <button class="btn btn-yellow btn-xs" data-toggle="modal" data-target="#addSource1">添加课程</button>
                </div>
                <div class="data-div">
                    <table class="table">
                        <!--表头-->
                        <thead>
                        <tr>
                            <th>课程名</th>
                            <th>学院</th>
                            <th>老师</th>
                            <th>学时</th>
                            <th>人数</th>
                            <th>教室</th>
                        </tr>
                        </thead>

                        <!--表体-->
                        <tbody>
                        <c:forEach items="${courseList}" var="course">
                            <tr>
                                <td>${course.course_name}</td>
                                <td>${course.college}</td>
                                <td>${course.teacher}</td>
                                <td>${course.hours}</td>
                                <td>${course.people_num}</td>
                                <td>${course.classroom}</td>
                                <td>
                                    <button class="btn btn-success btn-xs" data-toggle="modal" data-target="#changeSource1" @click="updateCourse('${course.course_name}','${course.college}','${course.teacher}','${course.hours}','${course.people_num}','${course.classroom}')">修改</button>
                                    <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#deleteSource1" href="http://localhost:8080/LaboratoryManagementSystem/index/course/${course.course_name}" @click="deleteCourse">删除</a>
                                </td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>

                    <form id="deleteCourseForm" method="post">
                        <input type="hidden" name="_method" value="delete">
                    </form>
                </div>

                <!--弹出窗口 添加实验室-->
                <div class="modal fade" id="addSource1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">添加课程</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" action="http://localhost:8080/LaboratoryManagementSystem/index/course" method="post">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">课程名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" required="required" name="course_name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">学院：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sLink" required="required" name="college">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">教师：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" required="required" name="teacher">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">学时：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sKnot" required="required" name="hours">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">人数：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" required="required" name="people_num">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">教室：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" required="required" name="classroom">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-xs btn-green" value="确 定"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>

                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->

                <!--修改资源弹出窗口-->
                <div class="modal fade" id="changeSource1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">修改课程</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    <form class="form-horizontal" id="update_form" action="http://localhost:8080/LaboratoryManagementSystem/index/course" method="post">
                                        <input type="hidden" name="_method" value="put">
                                        <div class="form-group ">
                                            <label for="sName" class="col-xs-3 control-label">课程名：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sName" v-bind:value="course.course_name" name="course_name">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sLink" class="col-xs-3 control-label">学院：</label>
                                            <div class="col-xs-8 ">
                                                <input type="text" class="form-control input-sm duiqi" id="sLink" v-bind:value="course.college" name="college">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sOrd" class="col-xs-3 control-label">教师：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sOrd" name="teacher" v-bind:value="course.teacher">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="sKnot" class="col-xs-3 control-label">学时：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="sKnot" name="hours" v-bind:value="course.hours">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">人数：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" name="people_num" v-bind:value="course.people_num">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInput1" class="col-xs-3 control-label">教室：</label>
                                            <div class="col-xs-8">
                                                <input type="text" class="form-control input-sm duiqi" id="exampleInput1" name="classroom" v-bind:value="course.classroom">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                            <input type="submit" class="btn btn-xs btn-green" value="确 定"></input>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->


                <!--弹出删除资源警告窗口-->
                <div class="modal fade" id="deleteSource1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="gridSystemModalLabel">提示</h4>
                            </div>
                            <div class="modal-body">
                                <div class="container-fluid">
                                    确定要删除该资源？删除后不可恢复！
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-xs btn-white" data-dismiss="modal">取 消</button>
                                <button type="button" class="btn btn-xs btn-danger" @click="deleteCourse_sure">确 定</button>
                            </div>
                        </div>
                        <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
            </div>

            <!-- 实验室信息模块 -->
            <div role="tabpanel" class="tab-pane" id="scho">
                <div class="data-div">
                    <table class="table">
                        <!--表头-->
                        <thead>
                        <tr>
                            <th>地址</th>
                            <th>名称</th>
                            <th>管理员号</th>
                            <th>电脑台数</th>
                            <th>电脑配置</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <!--表体-->
                        <tbody>
                        <c:forEach items="${labList}" var="lab">
                            <tr>
                                <td>${lab.address}</td>
                                <td>${lab.lab_name}</td>
                                <td>${lab.manager_num}</td>
                                <td>${lab.quantity}</td>
                                <td>${lab.model}</td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 软件信息模块 -->
            <div role="tabpanel" class="tab-pane" id="regu">
                <div class="data-div">
                    <div class="tablebody">

                        <div class="panel-group" id="accordion">
                            <div class="tablebody">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        实验室地址
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        实验室名称
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                        软件列表
                                    </div>
                                </div>
                            </div>
                        </div>

                        <c:forEach items="${labList}" var="lab">

                            <div class="panel-group" id="accordion">
                                <div class="tablebody">
                                    <div class="row">
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                ${lab.address}
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                                ${lab.lab_name}
                                        </div>
                                        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                            <div id="software" class="col-lg-4 col-md-4 col-sm-4 col-xs-4" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1${lab.address}" @click="selectSoftware('${lab.address}')">
                                                <span id="topA" class="glyphicon  glyphicon-triangle-bottom  "></span> <span>软件列表</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="collapse1${lab.address}" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <table class="table">
                                                <thead>
                                                <tr class="success">
                                                    <th>软件名称</th>
                                                    <th>类型</th>
                                                    <th>版本号</th>
                                                    <th>大小</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr v-for="(labsoftware,i) in labsoftwares" class="success">
                                                    <td>{{labsoftware.software_name}}</td>
                                                    <td>{{labsoftware.category}}</td>
                                                    <td>{{labsoftware.edition}}</td>
                                                    <td>{{labsoftware.space}}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>

                </div>

            </div>

            <!--用户管理模块-->
            <div role="tabpanel" class="tab-pane" id="stud">
                <div class="data-div">
                    <div class="row tableHeader">
                        <div class="col-xs-3">
                            员工号
                        </div>
                        <div class="col-xs-3">
                            用户名
                        </div>
                        <div class="col-xs-3">
                            权限
                        </div>
                        <div class="col-xs-3">
                            操作
                        </div>
                    </div>
                    <div class="tablebody">

                        <c:forEach items="${userList}" var="user">
                            <div class="row">
                                <div class="col-xs-3 ">
                                        ${user.account}
                                </div>
                                <div class="col-xs-3">
                                        ${user.name}
                                </div>
                                <div class="col-xs-3">
                                    <c:if test="${user.permission == 0}">
                                        普通用户
                                    </c:if>
                                    <c:if test="${user.permission == 1}">
                                        管理员
                                    </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- 课程管理模块 -->
            <div role="tabpanel" class="tab-pane" id="sitt">
                <div class="data-div">
                    <table class="table">
                        <!--表头-->
                        <thead>
                        <tr>
                            <th>课程名</th>
                            <th>学院</th>
                            <th>老师</th>
                            <th>学时</th>
                            <th>人数</th>
                            <th>教室</th>
                        </tr>
                        </thead>

                        <!--表体-->
                        <tbody>
                        <c:forEach items="${courseList}" var="course">
                            <tr>
                                <td>${course.course_name}</td>
                                <td>${course.college}</td>
                                <td>${course.teacher}</td>
                                <td>${course.hours}</td>
                                <td>${course.people_num}</td>
                                <td>${course.classroom}</td>
                            </tr>

                        </c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="js/jquery.nouislider.js"></script>
<script src="js/axios-0.18.0.js"></script>
<script src="js/vue.js"></script>

<script>

    new Vue({
        el: "#wrap",

        methods:{
            addLab(){
                var _this = this;
                axios({
                    method:"post",
                    url:"http://localhost:8080/LaboratoryManagementSystem/index",
                    data:_this.lab
                }).then(function (resp){

                })

            },
            deleteLab:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteForm");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.action = event.target.href;
                //取消超链接的默认行为
                event.preventDefault();
            },
            delete_sure:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteForm");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.submit();
            },
            updateLab:function (address,lab_name,manager_num,quantity,model) {
                this.lab.address = address;
                this.lab.lab_name = lab_name;
                this.lab.model = model;
                this.lab.manager_num = manager_num;
                this.lab.quantity = quantity;
            },
            selectSoftware:function (address) {
                /*//根据id获取表单元素
                var selectSoftware = document.getElementById("selectSoftware");
                //将触发点击事件的超链接的href属性赋值给表单的action
                selectSoftware.action = "http://localhost:8080/LaboratoryManagementSystem/index/labsoftware/"+address;
                selectSoftware.submit();*/

                var _this = this;
                axios({
                    method:"get",
                    url:"http://localhost:8080/LaboratoryManagementSystem/index/labsoftware/"+address,
                }).then(function (resp){
                    _this.labsoftwares = resp.data;
                })
            },
            changeSoftware:function (address,software_name,category,edition,space) {
                this.labsoftware.address = address;
                this.labsoftware.software_name = software_name;
                this.labsoftware.category = category;
                this.labsoftware.edition = edition;
                this.labsoftware.space = space;
            },
            deleteSoftware:function (address,software_name,category,edition,space) {
                this.labsoftware.address = address;
                this.labsoftware.software_name = software_name;
                this.labsoftware.category = category;
                this.labsoftware.edition = edition;
                this.labsoftware.space = space;
            },
            deleteSoftware_sure:function (event) {
                var _this = this;
                axios({
                    method:"post",
                    url:"http://localhost:8080/LaboratoryManagementSystem/index/labsoftware?_method=delete",
                    data:this.labsoftware
                }).then(function (resp){
                    if (resp.data == "success"){
                        location.href = "http://localhost:8080/LaboratoryManagementSystem/index";
                    }
                })
            },
            changeUser:function (account,name,permission) {
                this.user.account = account;
                this.user.name = name;
                this.user.permission = permission;
            },
            deleteUser:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteUserform");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.action = event.target.href;
                //取消超链接的默认行为
                event.preventDefault();
            },
            deleteUser_sure:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteUserform");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.submit();
            },
            deleteCourse:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteCourseForm");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.action = event.target.href;
                //取消超链接的默认行为
                event.preventDefault();
            },
            deleteCourse_sure:function (event) {
                //根据id获取表单元素
                var deleteForm = document.getElementById("deleteCourseForm");
                //将触发点击事件的超链接的href属性赋值给表单的action
                deleteForm.submit();
            },
            updateCourse:function (course_name,college,teacher,hours,people_num,classroom) {
                this.course.course_name = course_name;
                this.course.college = college;
                this.course.teacher = teacher;
                this.course.hours = hours;
                this.course.people_num = people_num;
                this.course.classroom = classroom;
            }
        },

        data() {
            return {
                lab:{
                    lab_name:'',
                    address:'',
                    model:'',
                    manager_num:'',
                    quantity:''
                },
                labsoftwares:[],
                labsoftware:{
                    address:'',
                    software_name:'',
                    category:'',
                    edition:'',
                    space:''
                },
                user:{
                    account:'',
                    name:'',
                    permission:'',
                    password:''
                },
                course:{
                    course_name:'',
                    college:'',
                    teacher:'',
                    hours:'',
                    people_num:'',
                    classroom:'',
                    college_num:''
                }
            }
        }

    })
</script>
</body>

</html>
