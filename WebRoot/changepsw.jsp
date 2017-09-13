<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/mystore.css"/>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
	</head>
	<body>
		<div class="main">
			<div class="storelist">
				<h1>我的商城</h1>
				<p>交易管理</p>
				<ul>
					<li>
						<a href="cart.do?p=showmycart">我的购物车</a>
					</li>
					<li>
						<a href="order.do?p=showOrder">我的订单</a>
					</li>
					<li>
						<a href="collect.do?p=showcollect">我的收藏</a>
					</li>
				</ul>
				<p>个人资料管理</p>
				<ul>
					<li>
						<a class="selected">修改密码</a>
					</li>
					<li>
						<a href="addr.do?p=showaddress">收货信息</a>
					</li>
				</ul>
			</div>
			<div class="changepswd">
				<h1>
					<span class="span1">修改密码</span>
				</h1>
				<form action="users.do?p=changePassword" id="myform" method="post">
					<div class="pswd_panel">
						<p>
							<span>用户名：</span>
							<b>${username }</b>
						</p>
						<p>
							<span>旧密码：</span>
							<input class="OldPwd" type="password" id="OldPwd" name="OldPwd" placeholder="输入旧密码">
						</p>
						<p>
							<span>新密码：</span>
							<input class="NewPwd" type="password" id="NewPwd" name="password" placeholder="请输入新密码">
						</p>
						<p>
							<span>确认密码：</span>
							<input class="ReNewPwd" type="password" id="ReNewPwd" name="ReNewPwd" placeholder="请再次输入新密码">
						</p>
						<p>
							<span>&nbsp;</span>
							<input type="button" class="okbtn" value="确认修改" onclick="return checkpsw(${username })">
							<span id="infotip"></span>
						</p>
					</div>
				</form>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
		function checkpsw(username){
			var oldpsw=document.getElementById("OldPwd").value;
			var NewPwd=document.getElementById("NewPwd").value;
			var ReNewPwd=document.getElementById("ReNewPwd").value;
			if(oldpsw.length==0){
				document.getElementById("infotip").innerHTML="请输入旧密码!";
				document.getElementById("OldPwd").focus();
				return false;
			}else if(NewPwd.length<1){
				document.getElementById("infotip").innerHTML="请输入新密码!";
				document.getElementById("NewPwd").focus();
				return false;
			}else if(NewPwd.length<6){
				document.getElementById("infotip").innerHTML="密码长度必须大于6位!";
				document.getElementById("NewPwd").focus();
				return false;
			}else if(NewPwd!=ReNewPwd){
				document.getElementById("infotip").innerHTML="两次输入的密码不一样!";
				document.getElementById("ReNewPwd").focus();
				return false;
			}else if(oldpsw.length>0){
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","users.do?p=checkPassword&username="+username+"&password="+oldpsw+"&x="+Math.random());
				request.send(null);
				
				request.onreadystatechange=function()
				{
					if(request.readyState==4&&request.status==200)
					{
						var txt=request.responseText;
						if(txt=="no")
						{
							document.getElementById("infotip").innerHTML="旧密码输入错误!";
							document.getElementById("OldPwd").focus();
						}else{
							layer.alert('密码已更改,请重新登录!',{icon:6},
							function(index){
							
							  	document.getElementById("myform").submit();
							  
							});
							
						}
					} 
				}
			}
		}
	</script>
</html>
<%@ include  file="footer.html" %>