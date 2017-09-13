<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/pcdetail.css"/>
		<link rel="stylesheet" type="text/css" href="css/picshow.css"/>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
	</head>
	<body>
		<div id="pcshow">
			<div class="fdj-wrap" id="fdj-wrap">
			    <div id="preview">
			        <div id="img-medium">
			            <img  alt="" />
			            <div id="mark"></div>       
			        </div>
			        <div class="img-small">
			            <a href="javascript:;" class="left" id="left"><</a>
			            <a href="javascript:;" class="right" id="right">></a>
			            <div class="img-list-items">
			                <ul id="img-items">
			                    <c:forEach items="${pmap.lversion.laptop.laptoppics }" var="pic" >
									<li>
										<img src="img/pcdetail/${pic.picname }">
									</li>
								</c:forEach>
			                </ul>   
			            </div>
			        </div>
			        <div id="img-big">
			            <img  alt="" id="detail" />
			        </div>
			        <div class="other">
						<a href="" class="drive">&nbsp;驱动下载</a>
						<a href="" class="share">分享</a>
						<c:if test="${empty users }">
							<a href="users.do?p=dologin" class="collect" id="collect">收藏</a>
						</c:if>
						<c:if test="${not empty users }">
							<c:set var="remark" scope="session" value="${remark }"/>
							<c:if test="${pmap.remark==0 }">
								<a href="javascript:" class="collect" id="collect">收藏</a>
							</c:if>
							<c:if test="${pmap.remark==1 }">
								<a href="javascript:" class="collected" id="collect">收藏</a>
							</c:if>
						</c:if>
						
						<a href="tencent://message/?uin=1791955183&Site=&Menu=yes" class="consult">&nbsp;</a>
					</div>
			    </div>
			</div>
				
			<div class="right_intr">
				<h1>${pmap.lversion.laptop.lname }</h1>
				<p>${pmap.lversion.vname }</p>
				<div class="address">
					运费：广东&nbsp;深圳&nbsp;至&nbsp;广东&nbsp;广州<span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;快递：<i>￥00.00</i>
				</div>
				<div class="pc_price">
					<span>商城价：</span>
					<b>￥${pmap.lversion.vprice}0</b>
					<div class="pc_sales">
						<p>月销量：<i>${pmap.lversion.vsales}</i></p>
						<p>累计评论：<i>0</i></p>
					</div>
				</div>
				<div class="pc_version">
					<span>选择版本：</span>
					<div class="version">
						<ul>
						<c:forEach items="${pmap.lversion.laptop.lversions }" var="ver">
							<c:set var="lvid" scope="session" value="${pmap.lversion.id }"/>
							<c:set var="vid" scope="session" value="${ver.id }"/>
							<c:if test="${lvid==vid }">
								<li class="selected" >
									<a>
										${ver.vname }
									</a>
								
								</li>
							</c:if>
							<c:if test="${lvid!=vid }">
								<li>
									<a href="product.do?p=showdetail&vid=${ver.id }&uid=${uid }">
										${ver.vname }
									</a>
								</li>
							</c:if>
						</c:forEach>
						</ul>
					</div>
				</div>
				<div class="pc_color">
					<span>选择颜色：</span>
					<div class="colors">
						<ul>
							<li class="selected">
								<a>${pmap.lversion.colors.cname }</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="pc_pak">
					<span>选择套餐：</span>
					<div class="pakage">
						<ul>
							<c:forEach items="${pmap.plist }" var="p" varStatus="vs">
								<c:if test="${vs.index==0 }">
									<li class="selected paka" data="${p.id }">
										<a>${p.pname }</a>
									</li>
								</c:if>
								<c:if test="${vs.index>0 }">
									<li>
										<a>${p.pname }</a>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="p_amount">
					<span>数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;量：</span>
					<div class="amount">
						<input type="text" value="1" id="num" name="num" onblur="javascript:check(${pmap.lversion.vstock})"/>
						<div>
	                        <input type="button" class="ad_bt" onclick="javascript:return adds(${pmap.lversion.vstock})"/>
	                        <input type="button" class="re_bt" onclick="javascript:return decrease()"/>
						</div>
						库存<i>${pmap.lversion.vstock}</i>件
					</div>
				</div>
				<div class="servers">
					服务承诺：
					<span class="server1">官方品质保障</span>
					<span class="server2">售后维修保障</span>
					<span class="server3">7天退货 15天换货</span>
				</div>
				<div class="p_buy">
				<c:choose>
					<c:when test="${pmap.lversion.state==1 }">
						<c:if test="${empty users }">
							<a href="users.do?p=dologin" class="buy_a">立即购买</a>
						</c:if>
						<c:if test="${not empty users }">
							<input type="button" class="buy_a" value="立即购买" id="pbuy" onclick="buy(${uid },${pmap.lversion.id})"/>
						</c:if>
					
						<c:if test="${empty users }">
							<a href="users.do?p=dologin" class="cart_a">加入购物车</a>
						</c:if>
						<c:if test="${not empty users }">
							<input type="button" class="cart_a" value="加入购物车" onclick="addcart(${pmap.lversion.vstock})"/>
						</c:if>
					</c:when>
					<c:otherwise>
						<a class="stop_a">已下架</a>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<div id="pc_detail">
			<div class="pc_hot">
				<h1>HOT热销商品排行</h1>
				<ul>
				<c:forEach items="${map.toplist }" var="lap" varStatus="vs" begin="0" end="4">
					<li>
						<a href="product.do?p=showdetail&lid=${lap.laptop.id }&vid=${lap.id }" target="_blank">
							<div class="div1">
								<span>${vs.index+1 }</span>
							</div>
							<div class="div2">
								<h2>${lap.laptop.lname }</h2>
								<h3>${lap.vprice }0元</h3>
								<p>月销量<b>${lap.vsales }</b></p>
							</div>
							<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="details">
				<div class="nav_list">
					<ul>
						<li onclick="show(0)">
							<a>商品介绍</a>
						</li>
						<li onclick="show(1)">
							<a>规格参数</a>
						</li>
						<li>
							<a>商品评价</a>
						</li>
						<li onclick="show(2)">
							<a>售后保障</a>
						</li>
					</ul>
				</div>
				<div class="show_details" name="div1">
					<c:forEach items="${pmap.lversion.laptop.detailpics }" var="dpic">
						<img src="img/pcdetail/${dpic.picname }">
					</c:forEach>
				</div>
				<div class="pc_para" name="div2">
					<c:forEach items="${pmap.lversion.laptop.parameters }" var="ppic">
						<img src="img/pcdetail/${ppic.picname }">
					</c:forEach>
				</div>
				<div class="after_sale" name="div3">
					<img src="img/pcdetail/20160224042839613.jpg"/>
					<img src="img/pcdetail/20160224043514311.jpg"/>
				</div>
			</div>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="js/tupian.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
	
	
		function show(a){ //控制商品详情面板
			if(a==0){
				document.querySelector(".show_details").style.display="block";
				document.querySelector(".pc_para").style.display="none";
				document.querySelector(".after_sale").style.display="none";
			}
			if(a==1){
				document.querySelector(".show_details").style.display="none";
				document.querySelector(".pc_para").style.display="block";
				document.querySelector(".after_sale").style.display="none";
			}
			if(a==2){
				document.querySelector(".show_details").style.display="none";
				document.querySelector(".pc_para").style.display="none";
				document.querySelector(".after_sale").style.display="block";
			}
		}
		
		function adds(a){  //增加数量
			var num=document.getElementById("num").value;
			if(num<a){
				num=1*num+1;
				document.getElementById("num").value=num;
			}else{
				layer.alert('库存不足!', {
					  skin: 'layui-layer-molv'
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
				});
				return false;
			}
		}
		function decrease(){
			var num=document.getElementById("num").value;
			if(num>1){
				num=1*num-1;
				document.getElementById("num").value=num;
			}else{
				return false;
			}
		}
		function check(a){
			var num=document.getElementById("num");
			if(isNaN(num.value)){
				num.value="1";
			}else{
				if(num.value>a){
					num.value=a;
					layer.alert('库存不足!', {
					  skin: 'layui-layer-molv'
					  ,icon:5
					  ,offset: ['300px', '800px']
					  ,closeBtn: 0
					});
				}
				if(num.value<1){
					num.value="1";
				}
			}
		}
		function buy(uid,vid) { 
			var a=""+${pmap.lversion.vstock};
			var num=document.getElementById("num").value;
			if(num>a*1){
				layer.alert('库存不足!', {
				  skin: 'layui-layer-molv'
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
			}else{
				var pid=$(".paka").attr("data");
				window.location.href="product.do?p=buy&vid="+vid+"&pid="+pid+"&num="+num;
			}
		}
		document.getElementById("collect").onclick=function(){ //收藏
			var vid=""+${pmap.lversion.id };
			var request=null;
			try
			{
				request=new  XMLHttpRequest();
			}
			catch(e)
			{
				request=new  ActiveXObject("Microsoft.XMLHttp");
			}
			request.open("post","collect.do?p=addcollect&vid="+vid+"&x="+Math.random());
			request.send(null);
			
			request.onreadystatechange=function()
			{
				if(request.readyState==4&&request.status==200)
				{
					var txt=request.responseText;
					if(txt=="ok")
					{
						document.getElementById("collect").className="collected";
					}
					else
					{
						document.getElementById("collect").className="collect";
					}
				} 
			}
			
		}
		
		function addcart(a){  //添加购物车
			var num=document.getElementById("num").value;//添加的数量
			if(num>a*1){
				layer.alert('库存不足!', {
				  skin: 'layui-layer-molv'
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}else{
				var vid=""+${pmap.lversion.id };
				var pid=$(".paka").attr("data");
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","product.do?p=addcart&vid="+vid+"&pid="+pid+"&num="+num);
				request.send(null);
				request.onreadystatechange=function()
				{
					if(request.readyState==4&&request.status==200)
					{
						var txt=request.responseText;
						if(txt=="ok")
						{
							layer.alert('商品已成功加入购物车!', {
							  skin: 'layui-layer-molv'
							  ,icon:6
							  ,offset: ['300px', '800px']
							  ,closeBtn: 0
							});
							getcartAmount();
						}else{
							layer.alert('库存不足!', {
							  skin: 'layui-layer-molv'
							  ,icon:5
							  ,offset: ['300px', '800px']
							  ,closeBtn: 0
							});
						}
					} 
				}
			}
		}
		
	</script>
</html>
<%@ include  file="footer.html" %>
