<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script src="../js/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/index.css" />
</head>
<body>
	<c:if test="${findSize==0}">
		<div
			style="background-image: url(../images/sorry.gif); height: 600px; width: 60%; background-size: cover;">
			<h1>对不起！没有找到您要搜索的房子!</h1>
		</div>

	</c:if>
	<c:if test="${findSize!=0}">
		<h1>根据您的搜索共找到${findSize}套 青岛二手房</h1>
	</c:if>
	<ul class="ul" style="list-style: none;">
		<c:forEach items="${findInfo}" var="house" varStatus="status">
			<li>
				<div style="display: inline-block; width: 23%; height: 150px;">
					<img style="height: 150px; width: 230px;" src="${house.img}">
				</div>
				<div style="display: inline-block; width: 76%;">
					<h2 style="margin-bottom: 20px;">${house.topic}</h2>
					<p style="float: right; color: red; font-size: 20px;">${house.price}万元</p>
					<b style='display: block; margin-bottom: 20px;'>类型：${house.typeName}</b>
					<span>${house.position}</span> <span>${house.area}平方米</span> <span>楼龄${house.houseage}年</span>
					<br>
					<div style="height: 20px;"></div>
					<span>${house.creattime}发布<span> 
					<a style="float: right;" target="_blank" href="detail.do?id=${house.id}">查看详情</a>
				</div>
				<hr>
			</li>
		</c:forEach>
	</ul>
	<script type="text/javascript">
		
	</script>
</body>
</html>