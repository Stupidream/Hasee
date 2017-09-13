<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>登录</title>
		<link rel="stylesheet" href="css/login.css" />
		<link rel="shortcut icon" type="image/x-icon" href="img/icon/icon.ico">
	</head>
	<body>
		<div id="head">
			<a href="page.jsp" class="head_logou"></a>
			<p class="wellcome">欢迎登录</p>
		</div>
		<div id="main">
			<div class="login">
				<div class="login_panel">
					<form action="users.do?p=login" method="post" id="myform">
						<h1>神舟会员</h1>
						<p class="login_p1">
							<input type="text" name="username" id="username" placeholder="输入你的手机号或者邮箱" />
						</p>
						<p class="login_p2">
							<input type="password" name="password" id="password" onfocus="checkname()"/>
						</p>
						<div>
							<label>
								<input type="checkbox" name="autologin" id="autologin"/>
								自动登录
							</label>
							<span style="margin-left:28px;color:red" id="logintip"></span>
						</div>
						<input type="button" value="登录" id="login"  class="login_bt"  onclick="checkpsw()"/>
						<p class="login_p3">
							<a href="">忘记密码>></a>
							<a href="register.jsp">立即注册>></a>
						</p>
						<div class="other">
							<span>使用合作帐号登录</span>
							<a href="users.do?p=qqlogin" class="qq"></a>
							<a href="" class="weibo"></a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div id="foot">
			<div class="footitem">
				<p>
					<a href="">公司简介</a>|
					<a href="">加入我们</a>|
					<a href="">联系我们</a>
				</p>
				All rights reserved © 2015 Hasee 粤ICP备11003995
			</div>
		</div>
	</body>
	<script>
	
		function checkname(){
			var username=document.getElementById('username').value;
			var password=document.getElementById('password').value;
			var autologin=document.getElementById('autologin').value;
			var uinput=document.getElementById('username');

			if(username==''){
				document.getElementById('logintip').innerHTML="用户名不能为空";
				uinput.focus();
				return false;
			}
			if(username!=''){
				var reg1 =/^1[34587]\d{9}$/;
				var reg2 =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(reg1.test(username)||reg2.test(username)){
					document.getElementById('logintip').innerHTML="";
					return true;
				}else{
					document.getElementById("logintip").innerHTML="用户名格式输入有误";
					uinput.focus();
					return false;
				}
			}
		}
		
		function checkpsw(){
			
			if(checkname()){
			
				var username=document.getElementById('username').value;
				var password=document.getElementById('password').value;
				
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","users.do?p=checkPassword&username="+username+"&password="+password+"&x="+Math.random());
				request.send(null);
				
				request.onreadystatechange=function()
				{
					if(request.readyState==4&&request.status==200)
					{
						var txt=request.responseText;
						if(txt=="no"){
							document.getElementById('password').focus();
							document.getElementById('logintip').innerHTML="账号或者密码错误!";
						}else{
							document.getElementById('myform').submit();
						}
					} 
				}
			}
		}
		
	</script>
</html>

