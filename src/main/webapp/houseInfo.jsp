<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="js/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css" />
</head>
<body>
<h1>共找到<span id="count"></span>套 青岛二手房</h1>
	<ul class="ul" style="list-style: none;">
		
	</ul>
	<script type="text/javascript">
	var type = "${param.type}";
	$.ajax({
	  	  type: 'POST',
	  	  url: "house/count.do?type="+type,
	  	  data: JSON.stringify({
	  	    
	  	  }),
	  	  contentType:'application/json',
	  	  success: function(data){
	  		 $("#count").append(data);
	  	  },
	  	  dataType: "json",
	  	});
	
	$.ajax({
  	  type: 'POST',
  	  url: "house/index.do?type="+type,
  	  data: JSON.stringify({
  	    
  	  }),
  	  contentType:'application/json',
  	  success: function(data){
  		  for(var i=0;i<data.length;i++){
  			  var id=data[i].id;
  			  var item="<li><div  style='display: inline-block; width: 23%; height: 150px;'><img style='height: 150px; width: 230px;' src='"+data[i].img+"'></div>"
  			  +"<div style='display: inline-block; width: 76%;'>"
  			  +"<h2 style='margin-bottom: 20px;'>"+data[i].topic+"</h2>"
  			  +"<p style='float: right; color: red; font-size: 20px;'>"+data[i].price+"万元</p>"
  			  +"<b style='display: block; margin-bottom: 20px;'>类型："+data[i].typeName+"</b>"
  			  +"<span>"+data[i].position+"</span> <span>"+data[i].area+"平方米</span> <span>"+data[i].houseage+"室</span> <br>"
  			  +"<div style='height: 20px;'></div>"
  			  +"<span>"+data[i].creattime+"发布<span>"
  			  +"<a style='float: right;' target='_parent _blank' href='house/detail.do?id="+id+"'>查看详情</a>"
  			  +"</div>"
  			  +"<hr>"
  			  +"</li>";
  			 $(".ul").append(item);
  		  }
  	  },
  	  dataType: "json",
  	});
	
	</script>
</body>
</html>