<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/mystore.css"/>
		<link rel="stylesheet" type="text/css" href="css/odercheckout.css"/>
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
						<a href="changepsw.jsp">修改密码</a>
					</li>
					<li>
						<a class="selected">收货信息</a>
					</li>
				</ul>
			</div>
			<div class="myaddress">
				<h1>
					<span class="span1">收货信息</span>
				</h1>
				<div class="addressinfo">
				<form method="post" id="forms">
					<div class="addr_panel"  style="border: none;">
						<input type="hidden" value="0" name="aid" id="aid"/>
						<p class="add_addr_p1">
							编辑收货地址：各项均为必填项，请填入准确的数据
						</p>
						<p id="show">
							<span>所在地区：</span>
							<select id="s_province" name="s_province"></select>
							<select id="s_city" name="s_city"></select>
							<select id="s_county" name="s_county"></select>
						</p>
						<p>
							<span>详细地址：</span>
							<textarea id="detail_addr" name="detail_addr" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
						</p>
						<p>
							<span>邮政编码：</span>
							<input type="text" id="citycode" name="citycode" />
						</p>
						<p>
							<span>收货人姓名：</span>
							<input type="text" id="addrname" name="addrname" />
						</p>
						<p>
							<span>手机/电话：</span>
							<input type="text" id="addrtel" name="addrtel" />
						</p>
						<p>
							<span>&nbsp;</span>
							<input type="button" id="savebt" value="保存" onclick="return checkinfo()">
							<input type="reset" value="重置" onclick="resetid()">
						</p>
					</div>
					</from>
				</div>
			</div>
			<table class="addr_info">
				<tr>
					<th>收货人</th>
					<th>所在地区</th>
					<th>详细地址</th>
					<th>邮编</th>
					<th>联系电话</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${addrlist }" var="addr" varStatus="vs">
					<tr>
						<td>${addr.realname }</td>
						<td>${addr.dlprovince } ${addr.dlcity } ${addr.dlcounty }</td>
						<td>${addr.dtaddress }</td>
						<td>${addr.zipcode }</td>
						<td>${addr.phone }</td>
						<td>
							<a href="javascript:changeaddr(${addr.id })">修改</a> | 
							<a href="javascript:deladdr(${addr.id })">删除</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script src="js/area.js" type="text/javascript"></script>
	<script type="text/javascript">
	
		_init_area();
		
		function deladdr(id){
			layer.confirm('您确定要删除该地址吗?', {
            	btn: ['确定','取消'] 
            	,icon:0
            	,skin: 'layui-layer-molv'
            	,offset: ['300px', '800px']
	        }, function(){
	        	$.ajax({
	        		type:'post',
	        		url:'addr.do?p=dele_addr',
	        		data:{id:id},
	        		success:function(data){
						if(data=="ok"){
							window.location.reload();
						}
					}
	        	});
	        }, function(){
            
        	});
		}
		
		function changeaddr(id){
			document.getElementById("aid").value=id;
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","addr.do?p=editaddr&id="+id+"&x="+Math.random());
			request.send(null);
			
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{	
					var x=0;
					var txt=request.responseText;
					var address=eval("("+txt+")");
					document.getElementById("s_province").value=address.dlprovince;
					change(1);
					document.getElementById("s_city").value=address.dlcity;
					change(2);
					document.getElementById("s_county").value=address.dlcounty;
					document.getElementById("detail_addr").value=address.dtaddress;
					document.getElementById("citycode").value=address.zipcode;
					document.getElementById("addrname").value=address.realname;
					document.getElementById("addrtel").value=address.phone;
				} 
			}
		}
		
		function checkinfo(){
			var forms=document.getElementById("forms");
			var province=document.getElementById("s_province").selectedIndex;
			var city=document.getElementById("s_city").selectedIndex;
			var county=document.getElementById("s_county").selectedIndex;
			var detailaddr=document.getElementById("detail_addr").value;
			var zipcode=document.getElementById("citycode").value;
			var addrname=document.getElementById("addrname").value;
			var addrtel=document.getElementById("addrtel").value;
			if(province==0){
				layer.alert('请选择所在省份!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}
			if(city==0){
				layer.alert('请选择所在地级市!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				return false;
			}
			if(county==0){
				layer.alert('请选择所在县级市!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				return false;
			}
			if(detailaddr==""){
				layer.alert('请填写详细地址!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				return false;
			}
			if(zipcode==""){
				layer.alert('请填写邮政编码!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				return false;
			}
			if(zipcode!=""){
				var reg= /^[1-9][0-9]{5}$/;
				if(reg.test(zipcode)){
					
				}else{
					layer.alert('邮政编码格式不正确!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
					return false;
				}
			}
			if(addrname==""){
				layer.alert('请填写收货人姓名!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}
			if(addrtel==""){
				layer.alert('请填写手机号/电话!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}else{
				if (!checkMobile(addrtel)) {
	                layer.alert('手机号格式输入有误!', {
					  skin: 'layui-layer-molv' 
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
	                return false;
				}else{
					$.ajax({
						type:'POST',
						url:'addr.do?p=add_addr',
						data:$("#forms").serialize(),
						success:function(data){
							if(data=="ok"){
								window.location.reload();
							}
						}
					});
				}
			}
		}
		function checkMobile(s) {
		    var myreg = /^1[34587]\d{9}$/;
		    if (myreg.test(s)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}
		
		function resetid(){
			document.getElementById("aid").value=0;
		}
	</script>
</html>
<%@ include  file="footer.html" %>
