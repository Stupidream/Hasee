<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<LINK rel="Bookmark" href="/favicon.ico" >
<LINK rel="Shortcut Icon" href="/favicon.ico" />

<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<title></title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span> 订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<button name="" id="" onclick="queryByDate()" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</div>
	
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a></span> <span class="r">共有数据：<strong>${fn:length(olist)}</strong> 条</span> </div>
	<div class="mt-20">
		<table class="layui-table table-sort" lay-skin="line">
			<thead>
				<tr class="text-c">
					<th width="40"><input name="" type="checkbox" value=""></th>
					<th width="80">订单号</th>
					<th width="100">下单时间</th>
					<th width="80">订单总金额</th>
					<th width="200">收货地址</th>
					<th width="100">运单号码</th>
					<th width="130">备注</th>
					<th width="100">状态</th>
					<th width="100">操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${allorder }" var="orders">
					<tr class="text-c">
						<td><input name="" type="checkbox" value=""></td>
						<td>${orders.onum }</td>
						<td>${orders.otime }</td>
						<td>${orders.tprice }0</td>
						<td>${orders.addresses.dlprovince } ${orders.addresses.dlcity } ${orders.addresses.dlcounty } ${orders.addresses.dtaddress } (${orders.addresses.realname } 收) &nbsp;&nbsp;&nbsp;邮编:${orders.addresses.zipcode }  &nbsp;&nbsp;&nbsp;电话:${orders.addresses.phone }</td>
						<td>${orders.epxnum }</td>
						<td>${orders.other }</td>
						<c:if test="${orders.status==0 }">
							<td class="td-status"><span class="label label-primary radius">其它</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==1 }">
							<td class="td-status"><span class="label label-primary radius">待付款</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==2 }">
							<td class="td-status"><span class="label label-danger radius">已付款,待处理</span></td>
							<td class="td-manage"><a style="text-decoration:none" onClick="product_sendinfo(this,${orders.id })" href="javascript:;" title="发货"><i class="Hui-iconfont">&#xe603;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==3 }">
							<td class="td-status"><span class="label laber-pay radius">已发货</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==4 }">
							<td class="td-status"><span class="label label-success radius">交易成功</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==5 }">
							<td class="td-status"><span class="label label-cancel radius">订单已取消</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
						<c:if test="${orders.status==6 }">
							<td class="td-status"><span class="label label-cancel radius">订单已关闭</span></td>
							<td class="td-manage"><a style="text-decoration:none" class="ml-5" onClick="product_edit('订单详情','omanager.do?p=showDetail&id=${orders.id }')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

	function queryByDate(){
		var minDate=$("#logmin").val();
		var maxDate=$("#logmax").val();
		if(minDate==""){
			layer.tips('请输入查询起始日期!', '#logmin', {
			  tips: [1, '#19a97b'],
			  time: 4000
			});
		}else if(maxDate==""){
			layer.tips('请输入查询终止日期!', '#logmax', {
			  tips: [3, '#19a97b'],
			  time: 4000
			});
		}else{
			window.location.href="omanager.do?p=queryByDate&minDate="+minDate+"&maxDate="+maxDate;
		}
	}
	
	var table=$('.table-sort').dataTable({
		"aaSorting": [[ 2, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"bFilter": true,
		"sScrollY": "550px",
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,3,4,5,6,7,8]}// 制定列不参与排序
		],
		initComplete: function () {
                   var api = this.api();
                   api.columns().indexes().flatten().each(function (i) {
                       if (i != 0 && i != 1 && i != 2 && i != 3 && i != 4 && i != 5 && i != 6 && i != 8) {
                           var column = api.column(i);
                           var $span = $('<span class="addselect">▾</span>').appendTo($(column.header()))
                           var select = $('<select><option value="">所有状态</option></select>')
                                   .appendTo($(column.header()))
                                   .on('click', function (evt) {
                                       evt.stopPropagation();
                                       var val = $.fn.dataTable.util.escapeRegex(
                                               $(this).val()
                                       );
                                       column
                                               .search(val ? '^' + val + '$' : '', true, false)
                                               .draw();
                                   });
                           column.data().unique().sort().each(function (d, j) {
                               function delHtmlTag(str) {
                                   return str.replace(/<[^>]+>/g, "");//去掉html标签
                               }
 
                               d = delHtmlTag(d)
                               select.append('<option value="' + d + '">' + d + '</option>')
                               $span.append(select)
                           });
 
                       }
                   });
 
               }
	});
	
	
	function product_edit(title,url,id){
		
		layer.open({
		  title:title,
		  type: 2,
		  area: ['1000px', '800px'],
		  fixed: false, 
		  maxmin: true,
		  content: url
		});
		
	}
	function product_sendinfo(obj,id){
		layer.prompt({
			title:'填写运单号码'
		},function(value, index, elem){
			var reg=/^[0-9]{8,13}$/;
			epxnum=value;
			if(!reg.test(epxnum)){
				layer.alert("快递单号格式错误!",function(){
					product_sendinfo(obj,id);
				});
			}else{
			    var a="'订单详情'";
			    var b="'omanager.do?p=showDetail&id="+id+"'";
				$(obj).parents("tr").find(".td-status").html('<span class="label laber-pay radius">已发货</span>');
				$(obj).parents("tr").find(".td-manage").html('<a style="text-decoration:none" class="ml-5" onClick="product_edit('+a+','+b+')" href="javascript:;" title="查看订单详情"><i class="Hui-iconfont">&#xe667;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'+id+')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
				$(obj).remove();
				var request=null;
				try
				{
					request=new  XMLHttpRequest();
				}
				catch(e)
				{
					request=new  ActiveXObject("Microsoft.XMLHttp");
				}
				request.open("post","omanager.do?p=sendOut&id="+id+"&epxnum="+epxnum+"&x="+Math.random());
				request.send(null);
				layer.close(index);
				layer.msg('已发货!',{icon: 6,time:2000});
			}
		    
		});
	}
</script>
</body>
</html>