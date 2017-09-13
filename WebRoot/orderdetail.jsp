<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/orderdetail.css"/>
	</head>
	<body>
		<div class="odetail">
			<h1>
				<span class="span1">订单详情</span>
			</h1>
			<div class="orderinfo">
				<div class="left_info">
					<h2>订单信息</h2>
					<ul>
						<li>
							<p>订单编号</p>
							<p>${orderdetail.onum }</p>
						</li>
						<li>
							<p>订单总计：</p>
							<p>¥${orderdetail.tprice }0（含运费0.00）</p>
						</li>
						<li>
							<p>订单信息：</p>
							<p>收货人（${orderdetail.addresses.realname }）配送至（${orderdetail.addresses.dlprovince } ${orderdetail.addresses.dlcity } ${orderdetail.addresses.dlcounty }&nbsp;${orderdetail.addresses.dtaddress }）</p>
							<p>付款方式（支付宝支付）</p>
						</li>
						<li>
							<p>订单备注：${orderdetail.other }</p>
						</li>
					</ul>
				</div>
				<div class="right_info">
					<c:choose>
						<c:when test="${orderdetail.status==5||orderdetail.status==6 }">
							<div>
								<p class="p11">订单状态：订单已取消！</p>
								<h3>
									<b>发票信息：</b>
									普通发票  &nbsp;&nbsp;&nbsp;发票抬头：个人   &nbsp;&nbsp;&nbsp; 
								</h3>
							</div>
						</c:when>
						<c:otherwise>
							<div>
								<p class="p21">订单状态：正常！</p>
								<h3>
									<b>发票信息：</b>
									普通发票  &nbsp;&nbsp;&nbsp;发票抬头：个人   &nbsp;&nbsp;&nbsp; 
								</h3>
								<span><a onclick="viewExpress(${orderdetail.id})">查看物流信息</a></span>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="product_list">
				<table>
					<tr>
						<th>商品图片</th>
						<th>商品名称</th>
						<th>单价</th>
						<th>数量</th>
						<th>总价</th>
					</tr>
					<c:forEach items="${orderdetail.getOrderses() }" var="olist">
						<tr>
							<td>
								<img src="img/pcdetail/${olist.lversion.laptop.laptoppics.iterator().next().picname }"/>
							</td>
							<td><a href="product.do?p=showdetail&vid=${olist.lversion.id }" target="_blank">${olist.lversion.laptop.lname }&nbsp;&nbsp;&nbsp;${olist.lversion.colors.cname }&nbsp;&nbsp;&nbsp;${olist.pakages.pname }</a></td>
							<td>${olist.lversion.vprice }</td>
							<td>${olist.lamount }</td>
							<td>${olist.lamount*olist.lversion.vprice }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
		function viewExpress(id){
		
	        var left = ($(window).width() -600)/2;     
	        var scrollLeft = $(document).scrollLeft();
	        
	        var lefts=(left+scrollLeft)+"px";
		
			var url="order.do?p=showExpressInfo&id="+id;
			
			layer.open({
			  title:'物流信息',
			  offset: ['50px',lefts],
			  type: 2,
			  area: ['600px', '700px'],
			  fixed: false,
			  content: url
			});
		}
	</script>
</html>
<%@ include  file="footer.html" %>