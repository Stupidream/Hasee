<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
		<link rel="shortcut icon" type="image/x-icon" href="img/icon/icon.ico">
	</head>
	<body>
		<div id="head">
			<div class="head_nav">
				<a href="" class="head_logou"></a>
				<p class="wellcome">欢迎注册</p>
			</div>
		</div>
		
		<div id="main">
			<form action="users.do?p=register" method="post" id="myform">
				<div class="register">
					<ul>
						<li>
							<i>用户名：</i>
							<p class="p1">
								<input type="text" name="username" id="username" placeholder="请输入你的手机号或者邮箱" />
							</p>
							<span>* 请用邮箱或手机号</span>
						</li>
						<li>
							<i>请设置密码：</i>
							<p class="p2">
								<input type="text" name="password" id="password1" onfocus="this.type='password'"/>
							</p>
							<span>* 6-20位字符，建议由字母，数字和符号两种以上组合</span>
						</li>
						<li>
							<i>请确认密码：</i>
							<p class="p2">
								<input type="text" name="password2" id="password2" onfocus="this.type='password'"/>
							</p>
							<span>* 请再次输入密码</span>
						</li>
						<li>
							<i>验证码：</i>
							<p class="p3">
								<input type="text" name="registercode" id="registercode"/>
							</p>
							<img src="users.do?p=getcode" style="cursor: pointer;" onclick="changecode(this)"/>
						</li>
						<li class="reg_li">
							<i>&nbsp;</i>
							<label>
								<input type="checkbox" id="agree"/>
								我已阅读并同意
							</label>
							<a href="">《神舟用户注册协议》</a>
						</li>
						<li>
							<i>&nbsp;</i>
							<input type="button" value="注册" class="reg_bt" onclick="check()"/>
						</li>
						<li>
							<i>&nbsp;</i>
							<p id="tip"></p>
						</li>
					</ul>
				</div>
			</form>
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
	<script type="text/javascript">
	
	
		function check(){
			
			var username=document.getElementById('username').value;
			
			if(username==''){
				document.getElementById("tip").innerHTML="用户名不能为空";
				document.getElementById('username').focus();
			}
			if(username!=''){
				var reg1 =/^1[34587]\d{9}$/;
				var reg2 =/^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
				if(reg1.test(username)||reg2.test(username)){
				
					var username=document.getElementById('username').value;
			
					var request=null;
					try
					{
						request=new  XMLHttpRequest();
					}
					catch(e)
					{
						request=new  ActiveXObject("Microsoft.XMLHttp");
					}
					request.open("post","users.do?p=checkUsername&username="+username+"&x="+Math.random());
					request.send(null);
					
					request.onreadystatechange=function()
					{
						if(request.readyState==4&&request.status==200)
						{
							var txt=request.responseText;
							if(txt=="no"){
								document.getElementById('username').focus();
								document.getElementById("tip").innerHTML="该用户名已存在，请输入其他用户名!";
							}else{
								var password1=document.getElementById("password1").value;
								var password2=document.getElementById("password2").value;
								var registercode=document.getElementById("registercode").value;
								var pswinput1=document.getElementById("password1");
								var pswinput2=document.getElementById("password2");
								var pregisterp=document.getElementById("registercode");
								var agree=document.getElementById("agree");
								
								if(password1<0){
									document.getElementById("tip").innerHTML="密码不能为空";
									pswinput1.focus();
								}else if((password1.length<6)||(password1.length>20)){
									document.getElementById("tip").innerHTML="密码长度为6-20";
									pswinput1.focus();
								}else if(password2!=password1){
									document.getElementById("tip").innerHTML="两次密码输入不一致";
									pswinput2.focus();
								}else if(registercode==''){
									document.getElementById("tip").innerHTML="请输入验证码";
									pregisterp.focus();
								}else if(agree.checked==false){
									document.getElementById("tip").innerHTML="请阅读《神舟用户注册协议》";
								}else{
								
									checkcode(registercode);
									
								}
							}
						} 
					}
				}else{
					document.getElementById("tip").innerHTML="用户名格式输入有误";
					document.getElementById('username').focus();
				}
			}
		}
		
		function checkcode(registercode){
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","users.do?p=checkcode&code="+registercode+"&x="+Math.random());
			request.send(null);
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{
					var txt=request.responseText;
					if(txt=="ok"){
						document.getElementById('myform').submit();
					}else{
						document.getElementById("tip").focus();
						document.getElementById("tip").innerHTML="验证码输入错误!";
					}
				} 
			}
		}
		
		function changecode(code){
			 code.src="users.do?p=getcode&x="+Math.random();
		}
	</script>
</html>


