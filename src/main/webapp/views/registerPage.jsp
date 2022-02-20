<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>注册</title>

    <%-- 引入JQ和Bootstrap--%>
    <script src="js/jquery.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <style>
        .page {
            width: 990px;
            margin: 0 auto;
            color: #3c3c3c;
            font: 400 12px/1.6 arial, 'Hiragino Sans GB', 宋体, sans-serif;
        }

        .page-top {
            height: 46px;
            border-bottom: 2px solid #e6e6e6;
            position: relative;
        }

        .active {
            position: relative;
            margin: 0 auto;
            width: 110px;
            border-bottom: 2px solid #ff4700;
            text-align: center;
        }

        .tsl {
            height: 46px;
            line-height: 46px;
            font-size: 16px;
            font-weight: 700;
            color: #3e3e3e;
        }

        .content {
            padding: 50px 0;
        }

        .form-main-list {
            width: 720px;
        }

        .form-list {
            margin: 0 auto;
            font-size: 14px;
        }

        .form-group {
            padding: 10px 0;
        }

        .form-item {
            padding: 10px 0 10px 260px;
            line-height: 36px;
            zoom: 1;
            height: 57px;
        }

        .form-item .form-label {
            display: inline;
            float: left;
            margin-left: -260px;
            width: 240px;
            height: 37px;
            line-height: 37px;
            text-align: right;
        }

        .form-item input {
            float: left;
            width: 300px;
            border: 1px solid #dedede;
            height: 37px;
            line-height: 37px;
            padding: 9px;
            font-size: 14px;
            _margin-left: -3px;
        }

        .btn-register {
            height: 36px;
            line-height: 36px;
            padding: 0 20px;
            color: #FFF;
            font-weight: 700;
            font-size: 16px;
            text-align: center;
            background: #ff0036;;
            border: 0;
            vertical-align: middle;
            border-radius: 3px;
            cursor: pointer;
            width: 300px;
        }

        .btn-register:hover {
            background-color: rgba(255, 0, 54, .8);
        }

        .registerErrorMessageDiv {
            width: 400px;
            margin: 0 auto;
            text-align: center;
        }
    </style>
</head>
<body>

<div class="page">
    <div class="page-top">
        <div class="active">
            <div class="tsl">用户注册</div>
        </div>
    </div>

    <div class="content">
        <form action="http://localhost:8080/LaboratoryManagementSystem/register" method="post" class="registerFrom">
            <div class="form-list form-main-list">
                <div class="form-group">
                    <div class="form-item">
                        <span class="form-label tsl">用户名</span>
                        <input type="text" id="name" name="name" placeholder="请在这里输入用户名">
                    </div>
                    <div class="form-item">
                        <span class="form-label tsl">账号</span>
                        <input type="text" id="account" name="account" placeholder="请在这里输入账号">
                    </div>
                    <div class="form-item">
                        <span class="form-label tsl">用户密码</span>
                        <input type="password" id="password" name="password">
                    </div>
                    <div class="form-item">
                        <span class="form-label tsl">确认密码</span>
                        <input type="password" id="password-confirm" name="password-confirm">
                    </div>
                    <div class="form-item">
                        <button type="submit" class="btn-register">确认注册</button>
                    </div>
                    <div class="registerErrorMessageDiv" style="display: none;">
                        <div class="alert alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                            <span class="errorMessage"></span>
                        </div>
                    </div>
                </div>
            </div>
            <span id="username_err" class="err_msg" style="display: none">该账号已存在</span>
        </form>
    </div>

</div>

<script>

    if (${sameAccount == 1}){
        document.getElementById("username_err").style.display = '';
    }else {
        document.getElementById("password_err").style.display = 'none';
    }

</script>

</body>
</html>