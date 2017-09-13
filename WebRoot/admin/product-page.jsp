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
<link rel="stylesheet" href="lib/zTree/v3/css/zTreeStyle/zTreeStyle.css" type="text/css">
<title>产品管理</title>
</head>
<body>
<div class="pos-a" style="width:150px;left:0;top:0; bottom:0; height:100%; border-right:1px solid #e5e5e5; background-color:#f5f5f5">
	<ul id="treeDemo" class="ztree">
	</ul>
</div>
<div style="margin-left:150px;">
	<iframe src="product-brand.jsp" scrolling="auto" frameborder="0" width="100%" id="myiframe"></iframe>
</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript" src="lib/zTree/v3/js/jquery.ztree.all-3.5.min.js"></script> 
<script type="text/javascript">

	$(document.body).css({
	   "overflow-y":"hidden"
	 });
	
	var ifm= document.getElementById("myiframe");
	ifm.height=document.documentElement.clientHeight;
	
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
					var id=treeNode.id;
					var request=null;
					try
					{
						request=new  XMLHttpRequest();
					}
					catch(e)
					{
						request=new  ActiveXObject("Microsoft.XMLHttp");
					}
					request.open("post","bmanager.do?p=showsortlt&sid="+id+"&x="+Math.random());
					request.send(null);
					request.onreadystatechange=function(){
						if(request.readyState==4&&request.status==200){
							var txt=request.responseText;
							if(txt=="ok"){
								$("#myiframe").attr("src","product-brand.jsp");
							}
						}
					}
					
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


</script>
</body>
</html>