<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" href="css/style2.css" />
	</head>
	<body>
		<div class="index_main">
			<div>
				<p>
					<select id="series">
					</select>
				</p>
				<p>
					<button id="okbtn">确定</button>
					<button id="cancel">取消</button>
				</p>
			</div>
		</div>
	</body>
	<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
	<script type="text/javascript">
		
		var series=document.getElementById("series");
		var  request=null;
	    try
	    {
	       request=new XMLHttpRequest();
	    }
	    catch(e)
	    {
	    	request=new ActiveXObject("Microsoft.XMLHttp");
	    }
	    
	    request.open("post","bmanager.do?p=getindextype");
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
	    	  	  	series.add(op);
	    	  	  }
	    	  	  getseries2();
	    	  }
	    
	    }
		
		$("#okbtn").click(function(){
			var vid=parent.$("#vid").val();
			var lid=parent.$("#lid").val();
			var tid=$("#series").val();
			var  request=null;
		    try
		    {
		       request=new XMLHttpRequest();
		    }
		    catch(e)
		    {
		    	request=new ActiveXObject("Microsoft.XMLHttp");
		    }
		    
		    request.open("post","bmanager.do?p=indexshow&tid="+tid+"&lid="+lid+"&vid="+vid);
		    request.send(null);
		    
		    request.onreadystatechange=function()
		    {
		    	  if(request.readyState==4&&request.status==200)
		    	  {
		    	  	  var txt=request.responseText;
		    	  	  if(txt=="ok"){
		    	  	  	var index = parent.layer.getFrameIndex(window.name);
		    	  	  	parent.layer.msg('操作成功!',{icon: 6,time:2000});
						parent.layer.close(index);
		    	  	  }
		    	  }
		    
		    }
		});
		
		$("#cancel").click(function(){
			var index = parent.layer.getFrameIndex(window.name);
			parent.layer.close(index);
		});
		
	</script>
</html>

