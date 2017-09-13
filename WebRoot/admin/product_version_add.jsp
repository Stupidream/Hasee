<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
	<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
  </head>
  
  <body>
    <div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-product-change">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>版本描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" id="versions" name="versions" class="input-text" value="" >
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">选择颜色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<select id="colors" style="border: solid 1px #ddd;height: 31px;"></select>
				<input type="button" class="btn" value="添加颜色种类" onclick="addcolor()">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">成本价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="cprice" id="cprice"  value="" class="input-text" style="width:80px">
				元
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">市场价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="mprice" id="mprice"  value="" class="input-text" style="width:80px">
				元
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">库存：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="stock" id="stock" value="" class="input-text" style="width:80px">
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存</button>
				<button onClick="layer_close();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
	</div>
	<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
	<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
	<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript">
	
		getcolor();
		
		function getcolor(){
			var colors=document.getElementById("colors");
			document.getElementById("colors").length=0;
		    var  request=null;
		    try
		    {
		       request=new XMLHttpRequest();
		    }
		    catch(e)
		    {
		    	request=new ActiveXObject("Microsoft.XMLHttp");
		    }
		    
		    request.open("post","bmanager.do?p=getcolors");
		    request.send(null);
		    
		    request.onreadystatechange=function()
		    {
		    	  if(request.readyState==4&&request.status==200)
		    	  {
		    	  	  var txt=request.responseText;
		    	  	  var json=eval("["+txt+"]");
		    	  	  
		    	  	  for(var i=0;i<json.length;i++)
		    	  	  {
		    	  	  	var op=new Option(json[i].name,json[i].id);
		    	  	  	colors.add(op);
		    	  	  }
		    	  }
		    
		    }
		}
		
		function addcolor(){
			layer.prompt(
			{title: '请输入颜色'},
			function(value, index, elem){
			  
			  	var color=value;
			  	
			  	var  request=null;
			    try
			    {
			       request=new XMLHttpRequest();
			    }
			    catch(e)
			    {
			    	request=new ActiveXObject("Microsoft.XMLHttp");
			    }
			    
			    request.open("post","bmanager.do?p=addcolors&cname="+color);
			    request.send(null);
			    
			    request.onreadystatechange=function()
			    {
			    	  if(request.readyState==4&&request.status==200)
			    	  {
			    	  	var txt=request.responseText;
			    	  	if(txt=="ok"){
			    	  		getcolor();
			    	  		layer.close(index);
			    	  	}else{
			    	  		layer.alert('颜色已存在!',{icon: 0,title:'提示'});
			    	  	}
			    	  }
			    
			    }
			  
			  
			});
		}
	
		function layer_close(){
			
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
			
		}
		
		$(function(){
			
			$("#form-product-change").validate({
				rules:{
					versions:{
						required:true,
					},
					cprice:{
						required:true,
						number:true,
					},
					mprice:{
						required:true,
						number:true,
					},
					stock:{
						required:true,
						digits:true,
					},
				},
				onkeyup:false,
				focusCleanup:true,
				success:"valid",
				submitHandler:function(form){
					
					var cid=$("#colors").val();
					var version=$("#versions").val();
					var cprice=$("#cprice").val();
					var mprice=$("#mprice").val();
					var stock=$("#stock").val();
					var request=null;
					try
					{
						request=new  XMLHttpRequest();
					}
					catch(e)
					{
						request=new  ActiveXObject("Microsoft.XMLHttp");
					}
					request.open("post","bmanager.do?p=addversion&cid="+cid+"&version="+version+"&cprice="+cprice+"&mprice="+mprice+"&stock="+stock+"&lid="+${lid });
					request.send(null);
					var index = parent.layer.getFrameIndex(window.name);
					parent.layer.msg('添加成功!',{icon: 6,time:2000});
					parent.layer.close(index);
				}
			});
		});
	</script>
  </body>
</html>
