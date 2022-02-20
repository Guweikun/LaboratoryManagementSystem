<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>登录</title>

    <%-- 引入JQ和Bootstrap--%>
    <script src="js/jquery.min.js"></script>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/bootstrap.min.js"></script>
    <link href="css/style.css" rel="stylesheet">

    <style>
        .header {
            padding: 22px 0px;
            height: 88px;
            width: 1190px;
            margin: auto;
        }

        a {
            text-decoration: none;
        }

        .header .tm-logo {
            margin-top: 8px;
            width: 190px;
        }

        #mallPage, #mallPage.mallChn {
            width: auto;
            min-width: 990px;
            background-color: transparent;
        }
    </style>

    <style>
        .content {
            position: relative;
            width: 100%;
            margin-bottom: 40px;
        }

        .login-banner-wrap img {
            display: block;
            margin: auto;
        }

        .content .form {
            display: none;
            position: absolute;
            top: 91px;
            right: 60px;
            background: #fff;
        }

        .form-inner {
            padding: 25px 26px 20px;
            width: 350px;
            height: 404px;
        }

        .static-form {
            display: block;
            position: relative;
        }

        .login-title {
            height: 18px;
            line-height: 18px;
            font-size: 16px;
            color: #3c3c3c;
            margin-top: 19px;
            padding-bottom: 8px;
            font-weight: 700;
        }

        .field {
            margin-top: 25px;
            position: relative;
        }

        div.field {
            border: 1px solid #CBCBCB;
            margin: 20px 0px;
        }

        div.field span.loginInputIcon {
            margin: 0px;
            background-color: #CBCBCB;
            width: 40px;
            height: 40px;
            display: inline-block;
        }

        span.loginInputIcon span.glyphicon {
            font-size: 22px;
            position: relative;
            left: 9px;
            top: 9px;
            color: #606060;
        }

        div.field input {
            display: inline-block;
            border: 0px solid transparent;
            width: 244px;
            height: 30px;
            position: relative;
            left: 6px;
            top: 6px;
        }

        button.redButton {
            color: white;
            background-color: #FF0036;
            font-size: 16px;
            font-weight: 700;
            height: 42px;
            line-height: 42px;
            vertical-align: middle;
            width: 300px;
            border-radius: 3px;
            border: 0;
        }

        button.redButton:hover {
            background-color: rgba(255, 0, 54, .8);
        }
    </style>
</head>
<body>

<div class="content">

    <div class="form" style="display: block; right: 176.5px;">
        <div class="form-inner">
            <div class="static-form">
                <div class="loginErrorMessageDiv" style="display: none;">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <div class="login-title">密码登录</div>
                <form action="http://localhost:8080/LaboratoryManagementSystem/login" class="loginForm" method="post">
                    <div class="field">
                        <span class="loginInputIcon">
					        <span class=" glyphicon glyphicon-user"></span>
				        </span>
                        <input id="name" name="account" placeholder="账号" type="text">
                    </div>
                    <div class="field">
                        <span class="loginInputIcon ">
                            <span class=" glyphicon glyphicon-lock"></span>
                        </span>
                        <input id="password" name="password" type="password" placeholder="密码" type="text">
                    </div>

                    <span id="username_err" class="err_msg" style="display: none">账号不存在</span>
                    <span id="password_err" class="err_msg" style="display: none">密码错误</span>

                    <div style="margin-top:10px">
                        <button class="redButton" type="submit">登 录</button>
                    </div>

                    <div style="margin-top: 20px;">
                        <a href="http://localhost:8080/LaboratoryManagementSystem/register" class="pull-right">免费注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    if (${wrongAccount == 1}){
        document.getElementById("username_err").style.display = '';
    }else {
        if (${wrongPassword == 1}){
            document.getElementById("password_err").style.display = '';
        }
    }

</script>

</body>
</html>