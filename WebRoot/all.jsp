<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="css/all.css" />
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
	</head>
	<body>
		<div class="reorder">
			<p class="rod_p">
				<a class="hovers">综合</a>
				<a>销量</a>
				<a>价格</a>
				<a>时间</a>
			</p>
			<span>价格</span>
			<input type="text" placeholder="最低价"/> - 
			<input type="text" placeholder="最高价"/>
			<input type="button" value="确定" />
			<p class="rod_p2">
				共${allpMap.total }件商品
				<a href="product.do?p=${method }&page=${allpMap.prevPage}"><</a>
				<span>${allpMap.page }/${allpMap.pageSize }</span>
				<a href="product.do?p=${method }&page=${allpMap.page+1}">></a>
			</p>
		</div>
		<div class="allgoods">
			<ul id="page">
			<c:forEach items="${allpMap.allpList }" var="all">
				<li>
					<a href="product.do?p=showdetail&vid=${all.id }" class="pro_a" target="_blank">
						<img src="img/pcdetail/${all.laptop.laptoppics.iterator().next().picname }"/>
					</a>
					<a href="product.do?p=showdetail&vid=${all.id }" target="_blank">
						<h1>${all.vname }</h1>
					</a>
					<p>${all.laptop.lname }</p>
					<h2>￥${all.vprice }0</h2>
					<table>
                    	<tr>
                            <td>
                            	<c:if test="${empty username }">
									<a href="users.do?p=dologin" class="pro_cart">加入购物车</a>
								</c:if>
								<c:if test="${not empty username }">
									<a href="javascript:checks(${all.vstock },${all.id })" class="pro_cart">加入购物车</a>
								</c:if>
                            </td>
                            <td>
                            	<a>0人评论</a>
                           	</td>
                    	</tr>
					</table>
				</li>
			</c:forEach>
			</ul>
		</div>
		<div class="pages">
			<a href="product.do?p=${method }&page=${allpMap.prevPage}"><</a>
			<c:forEach var="pages" varStatus="vs" begin="1" end="${allpMap.pageSize }">
				<c:set var="page" scope="session" value="${map.page }"></c:set>
				<c:choose>
				<c:when test="${vs.count==allpMap.page }">
					<a class="sel">${vs.count }</a>
				</c:when>
				<c:otherwise>
					<a href="product.do?p=${method }&page=${vs.count }">${vs.count }</a>
				</c:otherwise>
				</c:choose>
			</c:forEach>
			<a href="product.do?p=${method }&page=${allpMap.nextPage}">></a>
			<span>共${allpMap.pageSize }页，跳转到:</span>
			<input type="text" id="ipage">
			<input type="button" onclick="goto('${method }',${allpMap.pageSize })" value="确定">
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script type="text/javascript">
	
	
		function goto(method,pageSize){
			var page=document.getElementById("ipage").value;
			if(page!=""){
				if(!isNaN(page)&&(page*1<=pageSize)&&(page*1>0)){
					page=parseInt(page);
					location.href="product.do?p="+method+"&page="+page;
				}
			}
		}
	
		function checks(stock,vid){
			if(stock*1==0){
				layer.alert('库存不足!', {
				  skin: 'layui-layer-molv'
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}else{
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","product.do?p=addcart&vid="+vid+"&pid=1&num=1");
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