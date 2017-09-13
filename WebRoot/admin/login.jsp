<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<%
	if(session.getAttribute("adminName")!=null){
	
%>
		<jsp:forward page="index.jsp"></jsp:forward>
<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>后台登录</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="lib/layer/2.4/skin/layer.css" />
<style>
body {
	height: 100%;
	background: #16a085;
	overflow: hidden;
}

canvas {
	z-index: -1;
	position: absolute;
}
</style>

</head>
<body>
	<dl class="admin_login">
		<dt>
			<strong>神舟商城管理中心</strong> <em>Management System</em>
		</dt>
		<dd class="user_icon">
				<input type="text" placeholder="账号" autocomplete="off" id="usernames" class="login_txtbx" />
		</dd>
		<dd class="pwd_icon">
			<input type="password" placeholder="密码" autocomplete="off" id="passwords" class="login_txtbx" />
		</dd>
		<dd>
			<input type="button" value="立即登陆" class="submit_btn" onclick="return checks()"/>
		</dd>
		<dd>
			<p>© 2015-2016 Hasee 版权所有</p>
			<p>粤ICP备11003995</p>
		</dd>
	</dl>
</body>
<script src="js/jquery.js"></script>
<script src="js/Particleground.js"></script>
<script src="lib/layer/2.4/layer.js"></script>
<script>
	$(document).ready(function() {
		//粒子背景特效
		$('body').particleground({
			dotColor : '#5cbdaa',
			lineColor : '#5cbdaa'
		});
		
	});
	function checks(){
			var userName=document.getElementById("usernames").value;
			var password=document.getElementById("passwords").value;
			if(userName==""){
				layer.tips('请输入帐号!', '#usernames', {
				  tips: [1, '#3595CC'],
				  time: 4000
				});
				document.getElementById("usernames").focus();
			}
			if(password==""){
				layer.tips('请输入密码!', '#passwords', {
				  tips: [2, '#3595CC'],
				  time: 4000
				});
				document.getElementById("passwords").focus();
			}
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","admin.do?p=CheckPassword&username="+userName+"&password="+password+"&x="+Math.random());
			request.send(null);
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{
					var txt=request.responseText;
					if(txt=="no")
					{
						layer.tips('密码输入错误!', '#passwords', {
						  tips: [1, '#3595CC'],
						  time: 4000
						});
						document.getElementById("passwords").focus();
					}else{
						window.location.href="index.jsp";
					}
				} 
			}
		}
</script>
</html>
