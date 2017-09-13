<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
						<a class="selected">我的收藏</a>
					</li>
				</ul>
				<p>个人资料管理</p>
				<ul>
					<li>
						<a href="changepsw.jsp">修改密码</a>
					</li>
					<li>
						<a href="addr.do?p=showaddress">收货信息</a>
					</li>
				</ul>
			</div>
			<div class="mycollect">
				<h1>
					<span class="span1">我的收藏</span>
					<p>
						<b>
							全部商品<i>（${fn:length(collectList)}）</i>
						</b>
						<label>
							<input type="checkbox" id="quan" onclick="allsel(${fn:length(collectList)})" />
							全选
						</label>
						<a href="javascript:delall(${fn:length(collectList)})">删除</a>
					</p>
				</h1>
				<div class="collectlist">
					<ul class="collect_ul">
						<c:forEach items="${collectList}" var="collect" varStatus="vs">
						<li id="sel${vs.count }" onclick="selects(${vs.count },${collect.id })">
							<input type="hidden" value="${collect.id }" id="id${vs.count }">
							<a>
								<img src="img/pcdetail/${collect.lversion.laptop.laptoppics.iterator().next().picname }"/>
							</a>
							<a href="product.do?p=showdetail&vid=${collect.lversion.id }" target="_blank">
								<h2>${collect.lversion.laptop.lname }</h2>
							</a>
							<p>${collect.lversion.vname }</p>
							<span>￥${collect.lversion.vprice }0</span>
						</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
		function selects(liid,id){
			var lis=document.getElementById("sel"+liid);
			var quan=document.getElementById("quan");
			quan.checked=false;
			if(lis.className!="sel"){
				lis.className="sel";
			}else{
				lis.className="";
			}
		}
		
		function allsel(sizes){
			var quan=document.getElementById("quan");
			if(quan.checked){
				for(var i=1;i<=sizes;i++){
					document.getElementById("sel"+i).className="sel";
				}
			}else{
				for(var i=1;i<=sizes;i++){
					document.getElementById("sel"+i).className="";
				}
			}
		}
		
		function delall(sizes){
			
			var f=false;
			var idString="";
			for(var i=1;i<=sizes;i++){
				var lis=document.getElementById("sel"+i);
				if(lis.className=="sel"){
					idString+=document.getElementById("id"+i).value+",";
					f=true;
				}
			}
			if(f){
				layer.confirm('您确定要把选中商品移出收藏夹吗？', {
	            	btn: ['确定','取消'] 
	            	,skin: 'layui-layer-molv'
	            	,offset: ['300px', '800px']
	            	,icon:0
		        }, function(){
		        	var request=null;
					try
					{
						request=new  XMLHttpRequest();
					}
					catch(e)
					{
						request=new  ActiveXObject("Microsoft.XMLHttp");
					}
					request.open("post","collect.do?p=delcollect&idString="+idString.substring(0, idString.length-1));
					request.send(null);
					request.onreadystatechange=function()
					{
						if(request.readyState==4&&request.status==200)
						{
							var txt=request.responseText;
							if(txt=="ok")
							{
								window.location.reload();
							}
							else
							{
								layer.alert('删除失败!', {
								  skin: 'layui-layer-molv' 
								  ,offset: ['300px', '800px']
								  ,icon:5
								  ,closeBtn: 0
								});
							}
						} 
					}
		        }, function(){
	            
	        	});
			}else{
				layer.alert('请选择要删除的产品!', {
				  skin: 'layui-layer-molv' 
				  ,offset: ['300px', '800px']
				  ,icon:5
				  ,closeBtn: 0
				});
			}
		}
	</script>
</html>
<%@ include  file="footer.html" %>