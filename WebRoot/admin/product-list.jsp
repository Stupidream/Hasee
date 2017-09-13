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
<title>产品列表</title>
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
</head>
<body class="pos-r">
<div>
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 商品管理 <span class="c-gray en">&gt;</span> 商品列表 <span class="c-gray en">&gt;</span> 版本列表<a class="btn btn-success radius r" id="vrefresh" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="page-container">
		<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a class="btn btn-primary radius" onclick="product_add('添加版本','product_version_add.jsp')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加版本</a></span> <span class="r">共有数据：<strong>${fn:length(vlist)}</strong> 条</span> </div>
		<div class="mt-20">
			<table class="layui-table table-sort" lay-skin="line">
				<thead>
					<tr class="text-c">
						<th><input name="" type="checkbox" value=""></th>
						<th>ID</th>
						<th>商品名称</th>
						<th>版本描述</th>
						<th>销量</th>
						<th>库存</th>
						<th>成本价</th>
						<th>市场价</th>
						<th>发布状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${vlist }" var="goods">
				<c:set var="state" scope="session" value="${goods.state }"></c:set>
					<tr class="text-c va-m">
						<td><input name="" type="checkbox" value=""></td>
						<td>${goods.vid }</td>
						<td class="text-l"><a style="text-decoration:none" onClick="product_show('aa','product-show.html','10001')" href="javascript:;"><b class="text-success"></b> ${goods.lname }</a></td>
						<td class="text-l">${goods.vname }</td>
						<td>${goods.vsales }</td>
						<td>${goods.vstock }</td>
						<td></td>
						<td><span class="price">${goods.vprice }</span>0</td>
						<c:choose>
							<c:when test="${state==1 }">
								<td class="td-status"><span class="label label-success radius">已发布</span></td>
								<td class="td-manage"><a style="text-decoration:none" onClick="product_stop(this,${goods.vid },${goods.lid })" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;&nbsp;&nbsp;|&nbsp;&nbsp;</i></a> <a style="text-decoration:none" onClick="indexshow(${goods.vid },${goods.lid })" href="javascript:;" title="首页展示"><i class="Hui-iconfont">&#xe625;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('产品编辑','product_change.jsp',${goods.vid })" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe60c;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
							</c:when>
							<c:otherwise>
								<td class="td-status"><span class="label label-defaunt radius">已下架</span></td>
								<td class="td-manage"><a style="text-decoration:none" onClick="product_start(this,${goods.vid },${goods.lid })" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe6dc;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('商品编辑','product_change.jsp',${goods.vid })" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe60c;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
							</c:otherwise>
						</c:choose>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<input type="hidden" id="lid">
			<input type="hidden" id="vid">
		</div>
	</div>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">

function indexshow(vid,lid){
	$("#lid").val(lid);
	$("#vid").val(vid);
	layer.open({
	  title:'选择展示专区',
	  type: 2,
	  area: ['400px', '280px'],
	  fixed: false, 
	  scrollbar:false,
	  content: 'choose_index.jsp'
	});
}

$('.table-sort').dataTable({
	"aaSorting": [[ 1, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[0,2,3,8,9]}// 制定列不参与排序
	]
});
/*产品-添加*/
function product_add(title,url){
	
	layer.open({
	  title:title,
	  type: 2,
	  area: ['800px', '500px'],
	  fixed: false, 
	  maxmin: true,
	  content: url
	});
}
/*产品-查看*/
function product_show(title,url,id){
	layer.open({
	  type: 2,
	  area: ['1000px', '800px'],
	  fixed: false, 
	  maxmin: true,
	  content: url
	});
}
/*产品-下架*/
function product_stop(obj,id,lid){
	layer.confirm('确认要下架吗？',function(index){
		var a="'商品编辑'";
		var b="'product_change.jsp'";
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).parents("tr").find(".td-manage").html('<a style="text-decoration:none" onClick="product_start(this,'+id+','+lid+')" href="javascript:;" title="上架"><i class="Hui-iconfont">&#xe6dc;&nbsp;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('+a+','+b+','+id+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe60c;&nbsp;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
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
		request.open("post","bmanager.do?p=changestate&id="+id+"&lid="+lid+"&state="+0+"&x="+Math.random());
		request.send(null);
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*产品-发布*/
function product_start(obj,id,lid){
	layer.confirm('确认要上架吗？',function(index){
		var a="'商品编辑'";
		var b="'product_change.jsp'";
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).parents("tr").find(".td-manage").html('<a style="text-decoration:none" onClick="product_stop(this,'+id+','+lid+')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;&nbsp;&nbsp;|&nbsp;&nbsp;</i></a> <a style="text-decoration:none" onClick="indexshow('+id+','+lid+')" href="javascript:;" title="首页展示"><i class="Hui-iconfont">&#xe625;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_edit('+a+','+b+','+id+')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe60c;&nbsp;&nbsp;|&nbsp;</i></a> <a style="text-decoration:none" class="ml-5" onClick="product_del(this)" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>');
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
		request.open("post","bmanager.do?p=changestate&id="+id+"&lid="+lid+"&state="+1+"&x="+Math.random());
		request.send(null);
		layer.msg('已上架!',{icon: 6,time:1000});
	});
}

/*产品-申请上线*/
function product_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

/*产品-编辑*/
function product_edit(title,url,id){

	var request=null;
	try
	{
		request=new  XMLHttpRequest();
	}
	catch(e)
	{
		request=new  ActiveXObject("Microsoft.XMLHttp");
	}
	request.open("post","bmanager.do?p=getvinfo&id="+id+"&x="+Math.random());
	request.send(null);
	
	request.onreadystatechange=function()
	{
		if(request.readyState==4&&request.status==200)
		{
			var txt=request.responseText;
			if(txt=="ok")
			{
				layer.open({
				  title:title,
				  type: 2,
				  area: ['800px', '500px'],
				  fixed: false,
				  content: url
				});
			}
		} 
	}
}

/*产品-删除*/
function product_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '',
			dataType: 'json',
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}
</script>
</body>
</html>