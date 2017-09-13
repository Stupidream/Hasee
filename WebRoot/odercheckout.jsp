<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<jsp:include page="sheader.jsp"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/odercheckout.css"/>
		<link rel="stylesheet" type="text/css" href="layer/skin/default/layer.css"/>
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
		<div id="main">
			<form method="post" id="forms">
			<div class="address">
				<h1 class="title">确认收货地址</h1>
				<ul>
				<c:forEach items="${buymap.addrlist }" var="addr" varStatus="vs">
				<c:choose>
					<c:when test="${vs.index==0 }">
						<li class="selected" id="add${vs.count }" onclick="changes(${fn:length(buymap.addrlist)},${vs.count })">
							<label>
								<input type="radio" name="radio" value="${addr.id }" checked="checked" id="radios${vs.count }"/>
					</c:when>
					<c:otherwise>
						<li id="add${vs.count }" onclick="changes(${fn:length(buymap.addrlist)},${vs.count })">
							<label>
								<input type="radio" name="radio" value="${addr.id }" id="radios${vs.count }"/>
					</c:otherwise>
				</c:choose>
							${addr.dlprovince } ${addr.dlcity } ${addr.dlcounty } ${addr.dtaddress } (${addr.realname } 收) ${addr.phone }
						</label>
						<p>
							<a href="javascript:changeaddr(${addr.id })" class="a_color">修改</a>
							<a href="javascript:deladd(${addr.id })">删除</a>
						</p>
					</li>
				</c:forEach>
				</ul>
				<a href="javascipt:" class="add_addr" onclick="displays()">+新增收货地址</a>
				<div class="addr_panel" id="addr_div">
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
						<textarea name="detail_addr" id="detail_addr" placeholder="建议您如实填写详细收货地址，例如街道名称，门牌号码，楼层和房间号等信息"></textarea>
					</p>
					<p>
						<span>邮政编码：</span>
						<input type="text" name="citycode" id="citycode"/>
					</p>
					<p>
						<span>收货人姓名：</span>
						<input type="text" name="addrname" id="addrname"/>
					</p>
					<p>
						<span>手机/电话：</span>
						<input type="text" name="addrtel" id="addrtel"/>
					</p>
					<p>
						<span>&nbsp;</span>
						<input type="button" id="savebt" value="保存" onclick="return checkinfo()">
						<input type="button" id="canselbt" value="取消" onclick="hiddes()">
					</p>
				</div>
				<div class="payway">
					<h1 class="title">支付方式</h1>
					<p>
						<span>在线支付</span>
						支持多家银行借记卡、信用卡支付；支持支付宝、银联等多种支付平台。
					</p>
					<label>
						<input type="radio" checked="checked">
						<img src="img/odercheckout/addr2_1.png" />
					</label>
				</div>
				<div class="det_list">
					<h1 class="title">送货清单<a href="cart.do?p=showmycart">返回购物车修改</a></h1>
					
					<div class="explain">
						<div>
							<span>配送方式：</span>
							<p>神舟商城将会选择合适的快递公司为您运送商品</p>
						</div>
						<div>
							<span>配送说明：</span>
							<p>单件商品我们统一采用顺丰快递，多件商品统一采用天地华宇快递，以上两家快递不能送达的地区采用EMS（具体的快递类型可在订单详情内查看或咨询在线客服）</p>
						</div>
						<div>
							<span>配送时间：</span>
							<p>工作日、双休日与节假日均可送货</p>
						</div>
					</div>
					<div class="goods">
						<c:set var="mark" value="1"></c:set>
						<c:set var="price" value="0"></c:set>
						<table>
							<c:forEach items="${buymap.buylist }" var="pmt" varStatus="vs">
								<tr>
									<td>
										<img src="img/pcdetail/${pmt.lversion.laptop.laptoppics.iterator().next().picname }"/>
									</td>
									<td>
										<span>${pmt.lversion.laptop.lname }</span>
										<p>&nbsp;&nbsp;${pmt.lversion.colors.cname }&nbsp;&nbsp;${pmt.pakages.pname }</p>
									</td>
									<td>
										<c:set var="price" value="${pmt.lversion.vprice*pmt.lamount+price }"></c:set>
										<span class="price_col">￥${pmt.lversion.vprice*pmt.lamount}0</span>
										<p>(含运费：0.00 )</p>
									</td>
									<td>x${pmt.lamount }</td>
									<c:if test="${pmt.lamount<=pmt.lversion.vstock }"><td>有货</td></c:if>
									<c:if test="${pmt.lamount>pmt.lversion.vstock }">
										<td>库存不足</td>
										<c:set var="mark" value="0"></c:set>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="remarks">
						<p>
							<span>订单备注：</span>
							<input type="text" name="other" />
						</p>
					</div>
				</div>
				<div class="orders">
					<h1 class="title">订单结算</h1>
					<table>
						<tr>
							<td>
								<p>商品总金额：￥${price }0</p>
								<p>+ 运费：￥0.00</p>
								<p>总计金额：<span>￥${price }0</span></p>
							</td>
						</tr>
						<tr>
							<td>
								<input type="hidden" name="tprice" value="${price }">
								<c:if test="${mark==1 }">
									<input type="submit" value="提交订单" id="submits" onclick="return checkadd()">
								</c:if>
								<c:if test="${mark==0 }">
									<input type="submit" value="提交订单" id="submits" onclick="return errors()">
								</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
			</form>
		</div>
	</body>
	<script src="js/jquery.js"></script>
	<script src="layer/layer.js"></script>
	<script src="js/area.js" type="text/javascript"></script>
	<script type="text/javascript">
	
		_init_area();
		
		function errors(){
			layer.alert('提交订单失败,购买的商品库存不足!', {
			  skin: 'layui-layer-molv' 
			  ,offset: ['300px', '800px']
			  ,icon:5
			  ,closeBtn: 0
			});
			return false;
		}
		
		var x=document.getElementsByName("radio")
		if(x.length>0){
			document.getElementById("addr_div").style.display="none";
		}
		
		function displays(){
			document.getElementById("aid").value=0;
			document.getElementById("addr_div").style.display="block";
			_init_area();
			document.getElementById("detail_addr").value="";
			document.getElementById("citycode").value="";
			document.getElementById("addrname").value="";
			document.getElementById("addrtel").value="";
		}
		function hiddes(){
			document.getElementById("addr_div").style.display="none";
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
				  ,offset: ['300px', '800px']
				  ,icon:5
				  ,closeBtn: 0
				});
				return false;
			}
			if(city==0){
				layer.alert('请选择所在地级市!', {
					  skin: 'layui-layer-molv' 
					  ,offset: ['300px', '800px']
					  ,icon:5
					  ,closeBtn: 0
					});
				return false;
			}
			if(county==0){
				layer.alert('请选择所在县级市!', {
					  skin: 'layui-layer-molv' 
					  ,offset: ['300px', '800px']
					  ,icon:5
					  ,closeBtn: 0
					});
				return false;
			}
			if(detailaddr==""){
				layer.alert('请填写详细地址!', {
					  skin: 'layui-layer-molv' 
					  ,offset: ['300px', '800px']
					  ,icon:5
					  ,closeBtn: 0
					});
				return false;
			}
			if(zipcode==""){
				layer.alert('请填写邮政编码!', {
					  skin: 'layui-layer-molv' 
					  ,offset: ['300px', '800px']
					  ,icon:5
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
					  ,offset: ['300px', '800px']
					  ,icon:5
					  ,closeBtn: 0
					});
					return false;
				}
			}
			if(addrname==""){
				layer.alert('请填写收货人姓名!', {
				  skin: 'layui-layer-molv' 
				  ,offset: ['300px', '800px']
				  ,icon:5
				  ,closeBtn: 0
				});
				return false;
			}
			if(addrtel==""){
				layer.alert('请填写手机号/电话!', {
				  skin: 'layui-layer-molv' 
				  ,offset: ['300px', '800px']
				  ,icon:5
				  ,closeBtn: 0
				});
				return false;
			}else{
				if (!checkMobile(addrtel)) {
	                layer.alert('手机号格式输入有误!', {
					  skin: 'layui-layer-molv' 
					  ,offset: ['300px', '800px']
					  ,icon:5
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
		function changes(sizes,liid){
			var lis=document.getElementById("add"+liid);
			var ra=document.getElementById("radios"+liid);
			if(ra.checked==true){
				for(var i=1;i<=sizes;i++){
					document.getElementById("add"+i).className="";
				}
				if(lis.className!="selected"){
					lis.className="selected";
				}
			}
		}
		
		function deladd(id){
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
		
		function checkadd(){
			var forms=document.getElementById("forms");
			var x=document.getElementsByName("radio");
			if(x.length==0){
				layer.alert('请填写收货地址!', {
				  skin: 'layui-layer-molv' 
				  ,icon:5
				  ,offset: ['300px', '800px']
				  ,closeBtn: 0
				});
				return false;
			}else{
				forms.action="product.do?p=submitorder";
			}
		}
		function changeaddr(id){
			document.getElementById("aid").value=id;
			document.getElementById("addr_div").style.display="block";
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
		
	</script>
</html>
<%@ include  file="footer.html" %>

