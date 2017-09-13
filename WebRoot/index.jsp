<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	if(session.getAttribute("map")==null){
	
%>
		<jsp:forward page="page.jsp"></jsp:forward>
<%
	}
%>
<jsp:include page="header.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8">
		<title>神舟商城官网</title>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
	</head>
	<body>
		<div id="banner">
			<div style="width: 100%; min-width: 1240px;margin: auto;">
				<a href=""><img class="pic1" name="tu" src="img/lunbo/20170221030652738.jpg"/></a>
				<a href=""><img class="pic2" name="tu" src="img/lunbo/2016121909584947.jpg"/></a>
				<a href=""><img class="pic3" name="tu" src="img/lunbo/20161219025753448.jpg"/></a>
				<a href=""><img class="pic4" name="tu" src="img/lunbo/20160120073243182.jpg"/></a>
				<a href=""><img class="pic5" name="tu" src="img/lunbo/20160219064016095.jpg"/></a>
				<ul class="dot_list">
					<li class="cc" onclick="go(0)">1</li>
					<li class="cc" onclick="go(1)">2</li>
					<li class="cc" onclick="go(2)">3</li>
					<li class="cc" onclick="go(3)">4</li>
					<li class="cc" onclick="go(4)">5</li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div class="left_side">
				<ul>
					<li><a href="#star">明星<br />单品</a></li>
					<li><a href="#notebook">笔记本</a></li>
					<li><a href="#pad">PCpad平板电脑</a></li>
					<li><a href="#desktopcomputer">台式机</a></li>
					<li><a href="#near">周边</a></li>
					<li><a href="tencent://message/?uin=1791955183&Site=&Menu=yes"><img src="img/icon/qq.png"/><br />客服</a></li>
					<li><a href="#"><img src="img/icon/top.png"/></a></li>
				</ul>
			</div>
			<div class="right_side_up">
				<a href="tencent://message/?uin=1791955183&Site=&Menu=yes">
					<div>
						<img src="img/icon/ty_icon1.png" />
						在线客服
					</div>
				</a>
			</div>
			<div class="right_side_down">
				<ul>
					<li title="地图名片">
						<div>
							地图名片
						</div>
					</li>
					<li title="反馈建议">
						<div>
							反馈建议
						</div>
					</li>
					<li>
						<div onclick="window.location.href='#'">
							
						</div>
					</li>
				</ul>
			</div>
			<div class="zhuanqu">
				<ul>
					<li>
						<a href=""><img src="img/20160108104035201.jpg"/></a>
					</li>
					<li>
						<a href=""><img src="img/20160108114259192.jpg"/></a>
					</li>
					<li>
						<a href=""><img src="img/20160108104556359.jpg"/></a>
					</li>
					<li>
						<a href=""><img src="img/20160108104251415.jpg"/></a>
					</li>
				</ul>
			</div>
			<div class="stargoods" id="star">
				<h1 class="title1">明星单品</h1>
				<ul class="starul1">
				<c:forEach items="${map.list1 }" var="lap" varStatus="vs" begin="0" end="1">
					<li>
						<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
							<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
							<div>
								<h3>${lap.laptop.lname }</h3>
								<p>${lap.lversion.vname }</p>
								<p>商城价:<span>￥${lap.lversion.vprice }0</span></p>
							</div>
						</a>
					</li>
				</c:forEach>
				</ul>
				<ul class="starul2">
				<c:forEach items="${map.list1 }" var="lap" varStatus="vs" begin="2" end="5">
					<li>
						<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
							<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
							<div>
								<h3>${lap.laptop.lname }</h3>
								<p>${lap.lversion.vname }</p>
								<span>￥${lap.lversion.vprice }0</span>
							</div>
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>
			<div class="notebook" id="notebook">
				<h1 class="title1">
					<a href="" class="title2">笔记本  </a>
					<a href="" class="more">更多>></a>
				</h1>
				<div class="notebook_left">
					<ol>
						<li class="bb" onclick="go1(0)">1</li>
						<li class="bb" onclick="go1(1)">2</li>
					</ol>
					<ul>
						<li>
						<c:forEach items="${map.list2 }" var="lap" varStatus="vs" begin="0" end="1">
							<c:if test="${vs.index==0 }">
								<div class="note1" name="note">
							</c:if>
							<c:if test="${vs.index==1 }">
								<div class="note2" name="note">
							</c:if>
								<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
									<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
								</a>
								<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
									<div class="note1_1">
										<h3>${lap.laptop.lname }</h3>
										<p>${lap.lversion.vname }</p>
										<span>￥${lap.lversion.vprice }0</span>
									</div>
								</a>
							</div>
						</c:forEach>
						</li>
						<c:forEach items="${map.list2 }" var="lap" varStatus="vs" begin="2" end="5">
							<li>
								<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
									<div class="noteli2">
										<div>
											<h1>${lap.laptop.lname }</h1>
											<p>${lap.lversion.vname }</p>
											<span>￥${lap.lversion.vprice }0</span>
										</div>
										<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
									</div>
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="notebook_right">
					<h1>HOT热销商品排行</h1>
					<ul>
					<c:forEach items="${map.toplist }" var="lap" varStatus="vs" begin="0" end="4">
						<li>
							<a href="product.do?p=showdetail&vid=${lap.id }" target="_blank">
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
			</div>
			<div class="pcpad" id="pad">
				<h1 class="title1">
					<a href="" class="title2">PCpad平板电脑</a>
					<a href="" class="more">更多>></a>
				</h1>
				<ul>
					<li><a href=""><img src="img/20160804035715302.jpg"/></a></li>
				</ul>
				<ol>
					<li>1</li>
				</ol>
			</div>
			<div class="taishi" id="desktopcomputer">
				<h1 class="title1">
					<a href="" class="title2">台式机</a>
					<a href="" class="more">更多>></a>
				</h1>
			</div>
			<div class="zhoubian" id="near">
				<h1 class="title1">
					<a href="" class="title2">周边</a>
					<a href="" class="more">更多>></a>
				</h1>
				<ul class="starul2">
				<c:forEach items="${map.list3 }" var="lap" varStatus="vs" begin="0" end="3">
					<li>
						<a href="product.do?p=showdetail&vid=${lap.lversion.id }" target="_blank">
							<img src="img/pcdetail/${lap.laptop.laptoppics.iterator().next().picname }"/>
							<div>
								<h3>${lap.laptop.lname }</h3>
								<p>${lap.lversion.vname }</p>
								<span>￥${lap.lversion.vprice }0</span>
							</div>
						</a>
					</li>
				</c:forEach>
				</ul>
			</div>
		</div>
	</body>
</html>
<%@ include  file="footer.html" %>
<script>
	var x=document.getElementsByName('tu');		
	var y=document.querySelectorAll('.cc');
	for(var i = 0; i < x.length; i++){
		x[i].onmouseover=function (){window.clearInterval(t1)}
		x[i].onmouseout=function (){t1=window.setInterval('show()',3000)}
	}
	function go(s)
	{
		window.clearInterval(t1)
		for(var i = 0; i < x.length; i++){
			if(i==s)
			{
				x[i].style.display="block";
				y[i].style.background="#D61818"
			}	
			else{
				x[i].style.display="none";
				y[i].style.background='black';
			}
		a=s;
		}
	}
	var a=0;
	function show()
	{
		
		for(var i = 0; i < x.length; i++){
			if(i==a)
			{
				x[i].style.display='block';
				y[i].style.background='#D61818';
			}	
			else{
				x[i].style.display='none';
				y[i].style.background='black'
			}
		}				
		a++;
		if(a==x.length)
			a=0;
	}
	t1=window.setInterval('show()',3000)
	
	var m=document.getElementsByName('note');		
	var n=document.querySelectorAll('.bb');
	function go1(s)
	{
		window.clearInterval(t2)
		for(var j = 0; j < m.length; j++){
			if(j==s)
			{
				m[j].style.display="block";
				n[j].style.background="#D61818"
			}	
			else{
				m[j].style.display="none";
				n[j].style.background='black';
			}
		c=s;
		}
	}
	var c=0;
	function show1()
	{
		
		for(var j = 0; j < m.length; j++){
			if(j==c)
			{
				m[j].style.display='block';
				n[j].style.background='#D61818';
			}	
			else{
				m[j].style.display='none';
				n[j].style.background='black'
			}
		}				
		c++;
		if(c==m.length)
			c=0;
	}
	t2=window.setInterval('show1()',3000)
	
</script>
