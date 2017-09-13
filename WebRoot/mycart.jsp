<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="sheader.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/mycart.css"/>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
	</head>
	<body>
		<div class="head_tip">
			<a href="index.jsp" class="logou"></a>
			<p class="check_p">购物车</p>
			<ul class="shop_process">
				<li class="p_bpic">
					<p>1</p>
					我的购物车
				</li>
				<li>
					<p>2</p>
					填写核对订单
				</li>
				<li>
					<p>3</p>
					支付
				</li>
				<li>
					<p>4</p>
					订单成功
				</li>
			</ul>
		</div>
		<div class="main">
			<h1 class="title">
				全部商品
				<span id="allgoods"></span>
			</h1>
			<table class="shopcart" id="tab">
				<tr>
					<th>
						
					</th>
					<th>宝贝</th>
					<th>单价</th>
					<th>数量</th>
					<th>金额（元）</th>
					<th>操作</th>
				</tr>
				<tr id="nogoods">
					<td  colspan="6" >
						<strong>您的购物车中没有商品，请先<a href="showlaptop.do?p=pages&page=1&b=1" style="color:red;">选购商品>></a></Strong>
					</td>
				</tr>
				<c:forEach items="${cartlist }" var="cart">
				<tr>
					<td>
						<input type="checkbox" name="checkbox" checked="checked" value="${cart.id}" onclick="add(${uid },${cart.lversion.id})">
					</td>
					<td>
						<img src="img/pcdetail/${cart.lversion.laptop.laptoppics.iterator().next().picname }"/>
						<p>
							<a href="product.do?p=showdetail&vid=${cart.lversion.id }&uid=${uid }">${cart.lversion.laptop.lname } &nbsp&nbsp&nbsp ${cart.lversion.colors.cname } &nbsp&nbsp&nbsp ${cart.pakages.pname }</a>
						</p>
					</td>
					<td>
						${cart.lversion.vprice }0
					</td>
					<td>
						<div class="numdiv">
							<input type="button" value="-" class="addbt" onclick="downs(${cart.id },${cart.lversion.vprice })"/>
							<input type="text" id="num${cart.id }" value="${cart.lamount }" onblur="checknum(${cart.id },${cart.lversion.vstock },${cart.lversion.vprice })"/>
							<input type="button" value="+" class="addbt" onclick="ups(${cart.id },${cart.lversion.vstock },${cart.lversion.vprice })"/>
						</div>
					</td>
					<td id="tvprice${cart.id }">${cart.lversion.vprice*cart.lamount }0</td>
					<td>
						<a href="javascript:addcollect(${cart.lversion.id })">移入收藏夹</a><br />
						<a href="javascript:delcart(${cart.id })">删除</a>
					</td>
				</tr>
			</c:forEach>
			
			</table>
			<div class="cartsetl">
				<label>
					<input type="checkbox" checked="checked" class="CheckAll" id="quan" onclick="quans()">
							全选
				</label>
				<a href="javascript:delSelcart()" class="itmes">删除选中的商品</a>
				<a href="javascript:addSelcollect()" class="itmes">移入收藏夹</a>
				
				<input class="pay" type="button" value="去结算" onclick="topay(${uid })"/>
				<div class="total">
					<p>
						合计(不含运费):
						<span id="price"></span>
					</p>
				</div>
				<div class="static">
					已选商品
					<span id="checked"></span>
					件
				</div>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
	
		init();
	
		function init(){
			var x=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var sum=0;
			for(var i = 0; i <x.length ; i++){
				if(x[i].checked)
				{
					sum+=table.rows[i+2].cells[4].innerHTML*1;				
				}
			}
			if(x.length==0){
				document.getElementById("nogoods").className='cur1';
			}else{
				document.getElementById("nogoods").className='cur2';
			}
			document.getElementById('price').innerHTML="¥"+sum+".00";
			document.getElementById('checked').innerHTML=x.length;
			document.getElementById('allgoods').innerHTML="（"+x.length+"）";
		}
	
		
		//选中购物车
		function add(uid,vid){
			var x=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var quan=document.getElementById('quan').checked=false;
			var sum=0;
			var y=0;
			for(var i = 0; i <x.length ; i++){
				if(x[i].checked)
				{
					y=y+1;
					sum+=table.rows[i+2].cells[4].innerHTML*1;				
				}
			}
			document.getElementById('price').innerHTML="¥"+sum+".00";
			document.getElementById('checked').innerHTML=y;
		}
		
	
		//全选	
		function quans(){
			var check=document.getElementsByName('checkbox');
			var quan=document.getElementById('quan');
			for(var i = 0; i < check.length; i++){
				check[i].checked=quan.checked;
			}
			var x=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var sum=0;
			var y=0;
			for(var i = 0; i <x.length ; i++){
				if(x[i].checked)
				{
					y=y+1;
					sum+=table.rows[i+2].cells[4].innerHTML*1;				
				}
			}
			document.getElementById('price').innerHTML="¥"+sum+".00";
			document.getElementById('checked').innerHTML=y;
		}
		
		
		//删除单个购物车
		function delcart(id){
			layer.confirm('您确定要将该商品移出购物车吗？', {
            	btn: ['确定','取消']
            	,icon:0 
            	,skin: 'layui-layer-molv'
            	,offset: ['300px', '800px']
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
				request.open("post","cart.do?p=delcart&id="+id);
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
							  ,icon:5
							  ,offset: ['300px', '800px']
							  ,closeBtn: 0
							});
						}
					} 
				} 
	        }, function(){
	            
	        });
		}
		
		
		//删除选中购物车
		function delSelcart(uid){
			
			var x=document.getElementsByName("checkbox");
			var idString="";
			for(var i = 0; i <x.length ; i++){
				if(x[i].checked)
				{
					idString+=x[i].value+",";
				}
			}
			
			if(idString.length>0){
				
				layer.confirm('您确认要将选中商品移出购物车吗？', {
	            	btn: ['确定','取消'] 
	            	,skin: 'layui-layer-molv'
	            	,icon:0
	            	,offset: ['300px', '800px']
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
					request.open("post","cart.do?p=delSelcart&idString="+idString.substring(0, idString.length-1));
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
						} 
					} 
		        }, function(){
		            
		        });
				
			}else{
				layer.alert('请选择要删除的商品!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			}
		
		}
		
		//添加收藏
		function addcollect(vid){
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","collect.do?p=addCollectOnCart&vid="+vid);
			request.send(null);
			
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{
					var txt=request.responseText;
					if(txt=="ok")
					{
						layer.alert('收藏成功!', {
						  skin: 'layui-layer-molv' 
						  ,icon:6
						  ,offset: ['300px', '800px']
						  ,closeBtn: 0
						});
					}
					else
					{
						layer.alert('您已收藏过该商品!', {
						  skin: 'layui-layer-molv' 
						  ,icon:6
						  ,offset: ['300px', '800px']
						  ,closeBtn: 0
						});
					}
				} 
			}
		}
		
		//选中商品添加收藏
		function addSelcollect(){
			
			var x=document.getElementsByName("checkbox");
			var idString="";
			for(var i = 0; i <x.length ; i++){
				if(x[i].checked)
				{
					idString+=x[i].value+",";
				}
			}
			
			if(idString.length>0){
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","collect.do?p=addSelcollect&idString="+idString.substring(0, idString.length-1));
				request.send(null);
				
				request.onreadystatechange=function()
				{
					if(request.readyState==4&&request.status==200)
					{
						layer.alert('加入收藏成功!', {
						  skin: 'layui-layer-molv' 
						  ,icon:6
						  ,offset: ['300px', '800px']
						  ,closeBtn: 0
						});
					} 
				}
			}else{
				layer.alert('请选择要收藏的商品!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			} 
			
		}
		
		//更改购物车数量
		function changeNum(id,x){
		
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","cart.do?p=changeNum&id="+id+"&num="+x);
			request.send(null);
		}
		
		//检查数量输入是否正确
		function checknum(id,stock,price){
			var input="num"+id;
			var x=document.getElementById(input).value;
			if(isNaN(x)){
				document.getElementById(input).value="1";
			}else if(x>stock){
				layer.alert('库存不足!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				x=stock;
				document.getElementById(input).value=stock;
			}else if(x<1){
				document.getElementById(input).value="1";
			}
			var sum=x*price;
			document.getElementById('tvprice'+id).innerHTML=sum+".00";
			var y=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var sum1=0;
			for(var i = 0; i <y.length ; i++){
				if(y[i].checked)
				{
					sum1+=table.rows[i+2].cells[4].innerHTML*1;				
				}
			}
			
			document.getElementById('price').innerHTML="¥"+sum1+".00";
			changeNum(id,x);

		}
		
		//增加购物车商品数量
		function ups(id,stock,aprice){
			var input="num"+id;
			var x=document.getElementById(input).value;
			if(x<stock){
				x=1*x+1;
			}else{
				layer.alert('库存不足!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			}
			
			document.getElementById(input).value=x;
			
			var sum=x*aprice;
			
			document.getElementById('tvprice'+id).innerHTML=sum+".00";
			
			var y=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var sum1=0;
			for(var i = 0; i <y.length ; i++){
				if(y[i].checked)
				{
					sum1+=table.rows[i+2].cells[4].innerHTML*1;				
				}
			}
			
			document.getElementById('price').innerHTML="¥"+sum1+".00";
			
			changeNum(id,x);
			
		}
		
		//减少购物车商品数量
		function downs(id,aprice){
			var input="num"+id;
			var x=document.getElementById(input).value;
			if(x>1){
				x=x-1;
			}else{
				x=1;
			}
			
			document.getElementById(input).value=x;
			
			var sum=x*aprice;
			
			document.getElementById('tvprice'+id).innerHTML=sum+".00";
			
			var y=document.getElementsByName("checkbox");
			var table=document.getElementById("tab");
			var sum1=0;
			for(var i = 0; i <y.length ; i++){
				if(y[i].checked)
				{
					sum1+=table.rows[i+2].cells[4].innerHTML*1;
				}
			}
			
			document.getElementById('price').innerHTML="¥"+sum1+".00";
			
			changeNum(id,x);
		}
		
		function topay(uid){
			var x=document.getElementsByName("checkbox");
			if(x.length==0){
				layer.alert('您的购物车没有商品', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			}else{
				var idString="";
				for(var i = 0; i <x.length ; i++){
					if(x[i].checked)
					{
						idString+=x[i].value+",";
					}
				}
				
				if(idString.length>0){
					var request=null;
					try
					{
						request=new  XMLHttpRequest();
					}
					catch(e)
					{
						request=new  ActiveXObject("Microsoft.XMLHttp");
					}
					request.open("post","cart.do?p=toPay&idString="+idString.substring(0, idString.length-1));
					request.send(null);
					
					request.onreadystatechange=function()
					{
						if(request.readyState==4&&request.status==200)
						{
							var txt=request.responseText;
							if(txt=="ok"){
								location.href="odercheckout.jsp";
							}
						} 
					}
				}else{
					layer.alert('请选择要结算的商品!', {
					  skin: 'layui-layer-molv'
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				} 
			}
		}
		
	</script>
</html>
<%@ include  file="footer.html" %>