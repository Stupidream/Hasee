<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>神州商城官网</title>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
		<link rel="shortcut icon" type="image/x-icon" href="img/icon/icon.ico">
	</head>
	<body>
		<div id="header">
			<div class="topbox">
				<div class="topboxcenter">
					<div class="topleftbox">
						<span>关注我们</span>
						<a href="" class="iconwebo"></a>
						<a href="" class="iconbaidu"></a>
						<a href="" class="iconwechat"></a>
					</div>
					<div class="loginbox">
						<c:if test="${empty users }">
							<a href="users.do?p=dologin">登录</a> |
							<a href="register.jsp">注册</a> |
						</c:if>
						<c:if test="${not empty users }">
							<a href="collect.do?p=showcollect">欢迎登录：${users.username}</a> |
							<a href="order.do?p=showOrder">我的订单</a> |
							<a href="users.do?p=logout">[退出]</a> |
						</c:if>
						<a href="">销售网点</a> |
						<a href="">服务网点</a>
					</div>
				</div>
			</div>
			<div class="middle">
				<div class="middlebox">
					<a href="index.jsp" class="logo"></a>
					<div class="search">
						<input type="text" placeholder="搜索你想要的产品" id="textsearch"/>
						<input type="button" id="btsearch" /><br />
						<a href="">GTX1060</a>&nbsp;|&nbsp;
						<a href="">Z7</a>&nbsp;|&nbsp;
						<a href="">K610D</a>&nbsp;|&nbsp;
						<a href="">K650D</a>&nbsp;|&nbsp;
						<a href="">热卖推荐</a>&nbsp;|&nbsp;
						<a href="">游戏本</a>
					</div>
					<div class="cart">
						<a href="cart.do?p=showmycart">
							购物车
							<span id="cartcount"></span>
						</a>
					</div>
					<div class="phone">
						<span>咨询热线</span>
						<p>400-886-2668</p>
						<p style="color: red; font-size: 13px;">&nbsp;9:00-12:30 & 14:00-18:00</p>
					</div>
				</div>
				
			</div>
			<div class="navgation">
				<ul class="navlist">
					<li class="navfirst_li">
						<a href="product.do?p=showAll">全部商品分类<i></i></a>
						<div class="goodlist">
							<ul class="listinfo">
								<li>
									<a href="product.do?p=showProductByType&ltid=1" class="a1" >笔记本</a>
									<div class="listmain">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150715071520180.png"/></a>
												<h2>至强王者</h2>
												<h3><a href="">超级战神</a></h3>
												<a href=""><p>战神ZX8-SP7S2</p></a>
												<a href=""><p>战神GX10-SP7 PLUS</p></a>
												<a href=""><p>战神GX10-SP7S1</p></a>
												<a href=""><p>战神GX9-SP7 PLUS</p></a>
												<a href=""><p>战神GX9-SP7S1</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20160224022027973.png"/></a>
												<h2>定制最合适</h2>
												<h3><a href="">定制机</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150819062423474.png"/></a>
												<h2>强悍性能</h2>
												<h3><a href="">战神系列</a></h3>
												<a href=""><p>战神K550D-i7D2</p></a>
												<a href=""><p>战神K610D-A29D4</p></a>
												<a href=""><p>战神ZX7-G4S1</p></a>
												<a href=""><p>战神K650D-G6D1</p></a>
												<a href=""><p>战神K660D-G4D1</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150819060831115.png"/></a>
												<h2>卓越体验</h2>
												<h3><a href="">飞天系列</a></h3>
												<a href=""><p>飞天UT-47D1</p></a>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=3" class="a1">优雅本</a>
									<div class="listmain1">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150819061633414.png"/></a>
												<h2>轻薄商务</h2>
												<h3><a href="">优雅XS系列</a></h3>
												<a href=""><p>优雅X4-SL5 S1</p></a>
												<a href=""><p>优雅XS-5Y71S2</p></a>
												<a href=""><p>优雅XS-5Y10S2</p></a>
												<a href=""><p>优雅XS-5Y10S1</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150715070842179.png"/></a>
												<h2>时尚轻薄</h2>
												<h3><a href="">优雅U/B系列</a></h3>
												<a href=""><p>优雅U3-i4S1</p></a>
												<a href=""><p>优雅U5-i58256 </p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150723101534465.png"/></a>
												<h2>超值实用</h2>
												<h3><a href="">优雅K&HP&A系列</a></h3>
												<a href=""><p>优雅A480B-M10D6</p></a>
												<a href=""><p>优雅A400-N280 D4</p></a>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=7" class="a1">PCpad平板电脑</a>
									<div class="listmain2">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150715072630127.png"/></a>
												<h2>功能强大</h2>
												<h3><a href="">PCpad</a></h3>
												<a href=""><p>PCpad-X5</p></a>
												<a href=""><p>神舟PCpad-pro</p></a>
												<a href=""><p>神舟PCpad-CM</p></a>
												<a href=""><p>神舟PCpad-plus</p></a>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=4" class="a1">台式机</a>
									<div class="listmain3">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150715065248968.png"/></a>
												<h2>畅爽游戏</h2>
												<h3><a href="">战神系列</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150716045115559.png"/></a>
												<h2>家用娱乐</h2>
												<h3><a href="">新瑞系列</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150724102013282.png"/></a>
												<h2>小巧轻薄</h2>
												<h3><a href="">MiniPC</a></h3>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=5" class="a1">一体机</a>
									<div class="listmain4">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150716050815125.png"/></a>
												<h2>高效办公</h2>
												<h3><a href="">唐朝系列</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150716051130087.png"/></a>
												<h2>长辈专用</h2>
												<h3><a href="">奔驰系列</a></h3>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=6" class="a1">商用电脑</a>
									<div class="listmain5">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/nav1_1.png"/></a>
												<h2></h2>
												<h3><a href="">商用笔记本</a></h3>
												<a href=""><p>HX400B5-I34000M</p></a>
												<a href=""><p>HXU407-NYZ</p></a>
												<a href=""><p>QJ-C444</p></a>
												<a href=""><p>QTC-商禧880-0</p></a>
												<a href=""><p>笔记本包鼠套装-神</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150912042548028.png"/></a>
												<h2></h2>
												<h3><a href="">商用台式机</a></h3>
												<a href=""><p>HFMPB-01</p></a>
												<a href=""><p>HFMPB-H32</p></a>
												<a href=""><p>HFMPBD32</p></a>
												<a href=""><p>HFMPBQ7</p></a>
												<a href=""><p>HF-MPBK8神舟</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150912042644165.png"/></a>
												<h2></h2>
												<h3><a href="">商用一体机</a></h3>
												<a href=""><p>HFMPB-A47</p></a>
												<a href=""><p>H-FMPB神舟商</p></a>
												<a href=""><p>HFMPB03-3神舟</p></a>
												<a href=""><p>HFMP-BD33-L2002</p></a>
												<a href=""><p>HFMPBC33-L100-2</p></a>
											</dd>
										</dl>
									</div>
								</li>
								<li>
									<a href="product.do?p=showProductByType&ltid=2" class="a1">周边</a>
									<div class="listmain6">
										<dl>
											<dd>
												<a href="" class="aimgs"><img src="img/20150731094843360.png"/></a>
												<h2>小影霸</h2>
												<h3><a href="">显卡</a></h3>
												<a href=""><p>GT730 2G DD-R3</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20150803110949690.png"/></a>
												<h2>完美搭配</h2>
												<h3><a href="">包类</a></h3>
												<a href=""><p>背包-新款神舟双肩</p></a>
												<a href=""><p>背包-战神</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/2015081810037781.jpg"/></a>
												<h2>神舟高清显示屏</h2>
												<h3><a href="">显示器</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/2016071804202412.png"/></a>
												<h2>游戏专属</h2>
												<h3><a href="">外设</a></h3>
												<a href=""><p>战神-6D炫彩游戏鼠</p></a>
												<a href=""><p>战神-鼠标垫</p></a>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20160422032927908.jpg"/></a>
												<h2>多样可选</h2>
												<h3><a href="">贴纸</a></h3>
											</dd>
											<dd>
												<a href="" class="aimgs"><img src="img/20160122060646693.png"/></a>
												<h2>大无止境</h2>
												<h3><a href="">机械硬盘</a></h3>
											</dd>
										</dl>
									</div>
								</li>
							</ul>
						</div>
					</li>
					<li><a href="index.jsp">首页</a></li>
					<li><a href="">十足战力</a></li>
					<li><a href="">PCpad</a></li>
					<li><a href="">神舟手机</a></li>
					<li><a href="">服务支持</a></li>
				</ul>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
		
		getcartAmount();
		
		function getcartAmount(){
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","cart.do?p=getcartAmount");
			request.send(null);
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{
					document.getElementById("cartcount").innerHTML=request.responseText;
				} 
			}
		}
		
	
		document.getElementById("btsearch").onclick=function(){
			var text=document.getElementById("textsearch").value;
			if(text==""){
				layer.alert('请输入您要搜索的产品关键词!', {
				  skin: 'layui-layer-molv'
				  ,icon:0
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			}else{
				window.location.href="product.do?p=search&keyword="+text;
			}
			
		}
	</script>
</html>
