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
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<title>产品管理</title>
</head>
<body>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="text-c"> 日期范围：
			<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
			<input type="text" name="" id="" placeholder=" 商品名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加产品','product-add.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加商品</a></span> <span class="r">共有数据：<strong>${fn:length(llist)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="layui-table table-sort" lay-skin="line">
				<thead>
					<tr class="text-c">
						<th><input type="checkbox" name="" value=""></th>
						<th>ID</th>
						<th>图片</th>
						<th>商品名称</th>
						<th>发布时间</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${llist }" var="lap">
					<tr class="text-c">
						<td><input name="" type="checkbox" value=""></td>
						<td>${lap.lid }</td>
						<td><img src="../img/pcdetail/${lap.picname }"></td>
						<td class="text-l">${lap.lname }</td>
						<td>${lap.ltime }</td>
						<td class="f-14 product-brand-manage"><a style="text-decoration:none" onClick="product_brand_edit('版本管理','product-list.jsp',${lap.lid })" href="javascript:;" title="版本管理"><i class="Hui-iconfont">版本管理&nbsp;&nbsp;&nbsp;|</i></a> <a style="text-decoration:none" class="ml-5" onClick="active_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
	
	
	var setting = {
		view: {
			dblClickExpand: false,
			showLine: false,
			selectedMulti: false
		},
		data: {
			simpleData: {
				enable:true,
				idKey: "id",
				pIdKey: "pId",
				rootPId: ""
			}
		},
		callback: {
			beforeClick: function(treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("tree");
				if (treeNode.isParent) {
					zTree.expandNode(treeNode);
					return false;
				} else {
					//demoIframe.attr("src",treeNode.file + ".html");
					return true;
				}
			}
		}
	};

	
	$(document).ready(function(){

		var request=null;
		try
		{
			request=new  XMLHttpRequest();
		}
		catch(e)
		{
			request=new  ActiveXObject("Microsoft.XMLHttp");
		}
		request.open("post","bmanager.do?p=getsort&x="+Math.random());
		request.send(null);
		
		request.onreadystatechange=function(){
			if(request.readyState==4&&request.status==200){
				var text=request.responseText;
				var sort=eval("["+text+"]");
				var t = $("#treeDemo");
				t = $.fn.zTree.init(t, setting, sort);
				demoIframe = $("#testIframe");
				var zTree = $.fn.zTree.getZTreeObj("tree");
			}
		}
		
		
	});


	
	$('.table-sort').dataTable({
		
		"bPaginate": true,
		"aaSorting": [[ 4, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[0,2,3,5]}// 制定列不参与排序
		]
	});
	
	
	
	function product_brand_edit(title,url,id){
		var request=null;
		try
		{
			request=new  XMLHttpRequest();
		}
		catch(e)
		{
			request=new  ActiveXObject("Microsoft.XMLHttp");
		}
		request.open("post","goods.do?p=showorversions&id="+id+"&x="+Math.random());
		request.send(null);
		
		var index=layer.open({
		  type: 2,
		  title:title,
		  content: url
		});
		layer.full(index);
	}
	
	function product_add(title,url){
	
		layer.open({
		  type: 2,
		  area: ['1000px', '800px'],
		  fixed: false, 
		  maxmin: true,
		  content: url
		});
	}
</script>
</body>
</html>