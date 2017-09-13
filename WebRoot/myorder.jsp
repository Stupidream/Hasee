<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
		<link rel="stylesheet" type="text/css" href="css/mystore.css"/>
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
						<a class="selected">我的订单</a>
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
						<a href="addr.do?p=showaddress">收货信息</a>
					</li>
				</ul>
			</div>
			
			<div class="myorder">
				<h1>
					<span>我的订单</span>
				</h1>
				<div class="ordertop">
					<p class="orderp1">
						<input type="text" placeholder="输入商品标题或订单号进行搜索"/>
						<input type="button" id="" value="搜索订单" />
					</p>
					<p class="orderp2">
						成交时间：
						<input type="text" id="" value="" />
						到
						<input type="text" id="" value="" />
					</p>
					<p class="orderp3">
						订单状态：
						<select id="status" onchange="getOrderByState(${uid })">
							<option value="0">全部</option>
							<option value="1">已下单，待付款</option>
							<option value="2">已付款，待发货</option>
							<option value="3">已发货，待收货</option>
							<option value="4">已完成订单</option>
							<option value="5">已取消</option>
							<option value="6">已关闭</option>
						</select>
					</p>
				</div>
				<div class="ortable">
					<table class="order_tb1">
						<tr>
							<th>宝贝</th>
							<th>单价（元）</th>
							<th>数量</th>
							<th>实付款</th>
							<th>交易状态</th>
							<th>交易操作</th>
						</tr>
					</table>
					
					
					<c:forEach items="${omap.orderlist }" var="onum">
					
						<c:set var="tempCount" value="0"></c:set>
						<c:set var="rowspanCount" value="0"></c:set>
						<c:set var="tempFirst" value="0"></c:set>
						<c:set var="tempEnd" value="-1"></c:set>
						
						<c:set var="onum1" scope="session" value="${onum.onum }"/>
						<table class="order_tb2">
							<tr>
								<td colspan=7 class="ordertd2">
									订单号：
									<span>${onum.onum }</span>
									提交时间：
									<span>${onum.otime }</span>
								</td>
							</tr>
							<c:forEach items="${onum.getOrderses() }" var="order" varStatus="vs1">
								<c:set var="onum2" scope="session" value="${order.torder.onum }"/>
								<c:if test="${vs1.index>=tempEnd}">
									<c:set var="rowspanCount" value="0"></c:set>
									<c:forEach items="${onum.getOrderses() }" var="order1" varStatus="vs2">
										<c:set var="onum3" scope="session" value="${order1.torder.onum }"/>
										<c:if test="${onum2==onum3}">
											<c:set var="tempFirst" value="${vs1.index }"></c:set>
											<c:set var="rowspanCount" value="${rowspanCount+1 }"></c:set>
											<c:set var="tempEnd" value="${tempFirst+rowspanCount }"></c:set>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${onum2==onum1 }">
									<tr>
										<td>
											<img src="img/pcdetail/${order.lversion.laptop.laptoppics.iterator().next().picname }"/>
											<p>
												<a href="product.do?p=showdetail&vid=${order.lversion.id }" target="_blabk">${order.lversion.laptop.lname }</a><br>
												<span class="span2">${order.lversion.vname }</span>
											</p>
										</td>
										<td>¥${order.lversion.vprice }0</td>
										<td>
											${order.lamount }
										</td>
										<c:if test="${vs1.index==tempFirst }">
											<td rowspan="${rowspanCount}">¥${order.torder.tprice }0</td>
											<c:if test="${order.torder.status==1 }">
												<td class="shopcart_td" rowspan="${rowspanCount}">待付款</td>
												<td rowspan="${rowspanCount}">
													<a href="order.do?p=topay&id=${order.torder.id }" class="order_tb2_a">去付款</a>
													<a href="javascript:cancel(${order.torder.id })">取消订单</a><br>
												</td>
											</c:if>
											<c:if test="${order.torder.status==2 }">
												<td class="shopcart_td" rowspan="${rowspanCount}">待发货</td>
												<td rowspan="${rowspanCount}">
													<a href="javascript:cancel(${order.torder.id },${uid })">取消订单</a><br>
													<a href="order.do?p=showdetail&id=${order.torder.id }" target="_blank">订单详情</a>
												</td>
											</c:if>
											<c:if test="${order.torder.status==3 }">
												<td class="shopcart_td" rowspan="${rowspanCount}">待收货</td>
												<td rowspan="${rowspanCount}">
													<a href="javascript:received(${order.torder.id });" class="order_tb2_a">确认收货</a>
													<a href="javascript:cancel(${order.torder.id })">取消订单</a><br>
													<a href="order.do?p=showdetail&id=${order.torder.id }" target="_blank">订单详情</a><br>
												</td>
											</c:if>
											<c:if test="${order.torder.status==4 }">
												<td class="shopcart_td" rowspan="${rowspanCount}">交易成功</td>
												<td rowspan="${rowspanCount}">
													<a href="javascript:delorder(${order.torder.id })">删除订单</a><br/>
													<a href="order.do?p=showdetail&id=${order.torder.id }" target="_blank">订单详情</a>
												</td>
											</c:if>
											<c:if test="${order.torder.status==5 }">
												<td class="shopcart_td" rowspan="${rowspanCount}">订单已取消</td>
												<td rowspan="${rowspanCount}">
													<a href="javascript:delorder(${order.torder.id })">删除订单</a><br/>
													<a href="order.do?p=showdetail&id=${order.torder.id }" target="_blank">订单详情</a>
												</td>
											</c:if>
											<c:if test="${order.torder.status==6 }">
												<td rowspan="${rowspanCount}">订单已关闭</td>
												<td rowspan="${rowspanCount}">
													<a href="javascript:delorder(${order.torder.id })">删除订单</a><br/>
													<a href="order.do?p=showdetail&id=${order.torder.id }" target="_blank">订单详情</a>
												</td>
											</c:if>
										</c:if>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:forEach>
				</div>
				<div class="pages">
					<a href="order.do?p=showOrder&page=${omap.prevPage }" class="pages_prev"><</a>
					
					<c:forEach var="pages" varStatus="vs" begin="1" end="${omap.pageSize }">
						<c:set var="page" scope="session" value="${map.page }"></c:set>
						<c:choose>
						<c:when test="${vs.count==omap.page }">
							<a class="sel">${vs.count }</a>
						</c:when>
						<c:otherwise>
							<a href="order.do?p=showOrder&page=${vs.count }">${vs.count }</a>
						</c:otherwise>
						</c:choose>
					</c:forEach>
					
					<a href="order.do?p=showOrder&page=${omap.nextPage }" class="pages_next">></a>
					<span>共${omap.pageSize }页，跳转到:</span>
					<input type="text" id="topage">
					<input type="button" value="确定" onclick="goTo(${omap.pageSize})"/>
				</div>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
	
		function goTo(pageSize){
			var page=document.getElementById("topage").value;
			if(page!=""){
				if(!isNaN(page)&&(page*1<=pageSize)&&(page*1>0)){
					page=parseInt(page);
					location.href="order.do?p=showOrder&page="+page;
				}
			}
		}
	
		function getOrderByState(uid){
			/* var status=document.getElementById("status");
			var num=status.value;
			if(num==0){
				window.location.href="order.do?p=showOrder";
			}else{
				window.location.href="order.do?p=showorderbystate&status="+num;
			} */
		}
	
		function cancel(id){
			layer.confirm('您确定要取消该订单吗?', {
            	btn: ['确定','取消'] 
            	,icon:0
            	,skin: 'layui-layer-molv' 
				,offset: ['300px', '800px']
	        }, function(){
	        	$.ajax({
	        		type:'post',
	        		url:'order.do?p=cancelorder',
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
		function delorder(id){
			layer.confirm('您确定要删除该订单吗?', {
            	btn: ['确定','取消'] 
            	,icon:0
            	,skin: 'layui-layer-molv' 
				,offset: ['300px', '800px']
	        }, function(){
	        	$.ajax({
	        		type:'post',
	        		url:'order.do?p=delorder',
	        		data:{id:id},
	        		success:function(data){
	        			if(data=="ok"){
							window.location.reload();
						}
	        		}
	        	});
	        });
		}
		
		function received(id){
			layer.confirm('您确定要收货吗?', {
            	btn: ['确定','取消'] 
            	,icon:0
            	,skin: 'layui-layer-molv' 
				,offset: ['300px', '800px']
	        }, function(){
		        $.ajax({
		        	type:'post',
		        	url:'order.do?p=receive',
		        	data:{id:id},
		        	success:function(data){
		        		if(data=="ok"){
							window.location.reload();
						}
		        	}
		        });
	        });
		}
		
	</script>
</html>
<%@ include  file="footer.html" %>