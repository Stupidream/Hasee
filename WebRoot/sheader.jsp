<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/odercheckout.css"/>
		<link rel="shortcut icon" type="image/x-icon" href="img/icon/icon.ico">
	</head>
	<body>
		<div id="header">
			<div class="topboxcenter">
					<div class="topleftbox">
						<span>关注我们</span>
						<a href="" class="iconwebo"></a>
						<a href="" class="iconbaidu"></a>
						<a href="" class="iconwechat"></a>
					</div>
					<div class="loginbox">
						<c:if test="${empty users }">
							<a href="users.do?p=dologin">登录</a> |
							<a href="register.jsp">注册</a> |
						</c:if>
						<c:if test="${not empty users }">
							<a href="collect.do?p=showcollect">欢迎登录：${users.username}</a> |
							<a href="order.do?p=showOrder">我的订单</a> |
							<a href="users.do?p=logout">[退出]</a> |
						</c:if>
						<a href="">销售网点</a> |
						<a href="">服务网点</a>
					</div>
			</div>
		</div>
	</body>
</html>
