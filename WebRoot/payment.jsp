<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<jsp:include page="sheader.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/payment.css"/>
	</head>
	<body>
		<div class="head_tip">
			<a href="index.jsp" class="logou"></a>
			<p class="check_p">核对订单</p>
			<ul class="shop_process">
				<li class="p_bpic">
					<p>1</p>
					我的购物车
				</li>
				<li class="p_bpic">
					<p>2</p>
					订单支付
				</li>
				<li class="p_bpic">
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
			<div class="pymd1">
				<p class="pymp1">订单已提交成功，请您立即付款，我们将为您闪电送达！</p>
				<p>请您在12小时内完成付款，超过后系统将自动关闭订单</p>
				<p class="pymp2">订单编号： ${pmmap.onum }</p>
				<p>订单金额：<span>￥${pmmap.tprice}0</span></p>
				<p class="pymp3">
					已选择付款方式： <img class="pymimg1" src="img/odercheckout/addr2_1.png">
				</p>
				<form action="alipayapi.jsp" method="post">
					<input type="hidden" value="${pmmap.onum }" name="onum">
					<input type="hidden" value="${pmmap.ordername}" name="ordername">
					<input type="submit" value="立即付款">
				</form>
			</div>
			<div class="pymd2">
				<p class="pymp1">注意事项：</p>
				<p>“订单提交成功”仅表明神舟电脑官方商城收到了您的订单，只有您的订单通过审核后，才代表订单正式生效；</p>
				<p>在您签收商品之前，请您认真检查外包装。如有明显损坏迹象，您可以拒收该货品，并及时通知我们；</p>
				<p>建议您在购买的15天内保留商品的全套包装、附件、发票等所有随货物品，以便后续的保修处理。</p>
			</div>
		</div>
	</body>
</html>
<%@ include  file="footer.html" %>
