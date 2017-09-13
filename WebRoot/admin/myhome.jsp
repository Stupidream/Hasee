<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html >
  <head>
    <meta charset="UTF-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
    <link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
	<link rel="stylesheet" type="text/css" href="lib/layer/2.4/skin/layer.css" />
    <style>
     body{
     	background: #2F4056;
     }


    </style>

    
    
  </head>

  <body>
	<div class="main">
		<p class="f-20 text-success" style="text-align: left;font-weight:900; color: #FFFFFF;">神州商城管理中心</p>
		<br>
		<ul class="container">
			<li>
				<span>
					<svg class="icon" aria-hidden="true">
					  <use xlink:href="#icon-baoguofahuo"></use>
					</svg>
				</span>
				<p>待发货：<i id="wsog"></i></p>
			</li>
			<li>
				<span>
					<svg class="icon" aria-hidden="true">
					  <use xlink:href="#icon-wodedingdan"></use>
					</svg>
				</span>
				<p>今日订单：<i id="tdorder"></i></p>
			</li>
			<li>
				<span>
					<svg class="icon" aria-hidden="true">
					  <use xlink:href="#icon-caiwu"></use>
					</svg>
				</span>
				<p>今日订单总金额：<i id="tprice"></i></p>
			</li>
		</ul>
	
	</div> 
	<audio hidden="hidden" autoplay="autoplay" id="myaudio"></audio>
  </body>
  	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="static/h-ui/js/H-ui.js"></script>
	<script type="text/javascript" src="lib/font/iconfont.js"></script>
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
    <script type="text/javascript">
  	
  		load();
  		
  		window.setInterval("load()",1000);
  		
  		function load(){
  			/* var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","goods.do?p=showgoods&x="+Math.random());
			request.send(null);
			
			request.onreadystatechange=function(){
				if(request.readyState==4&&request.status==200){
					var text=request.responseText;
					var info=eval("("+text+")");
					document.getElementById("wsog").innerHTML=info.wsog;
					document.getElementById("tdorder").innerHTML=info.tdorder;
					document.getElementById("tprice").innerHTML="￥"+info.tprice+".00";
					if(info.wsog>0){
						document.getElementById("myaudio").src="audio/1704.mp3";
						layer.open({
						  type: 0
						  ,icon: 0
						  ,offset: 'rb'
						  ,title: '消息提醒'
						  ,area: ['250px', '200px']
						  ,time:10000
						  ,content: '您有新的订单未处理,请及时处理!'
						  ,shade: 0
						}); 
					} 
				}
			} */
  		}
  	
    </script>
</html>
