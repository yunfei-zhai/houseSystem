<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/jquery-2.2.4.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.detail span {
	margin: 20px;
}
</style>
</head>
<body>
	<div style="height: 180px; background-color: rgb(245, 245, 245);">


		<div style="height: 70px;">
			<img style="float: left; margin: 5px;" src="../images/house.png">
			<h1
				style="float: left; display: inline-block; margin: 0; color: #6756EA;">青大找房</h1>
			<h3
				style="float: left; display: inline-block; margin-top: 10px; margin-left: 30px; color: #6756EA;">房子详情</h3>
		</div>
		<div style="height: 80px; margin-left: 80px">
			<h1 style="margin-top: 0">${house.topic}</h1>
			<span style="color: #9199AA">${house.description}</span>
		</div>
	</div>
	<div style="margin-left: 80px; padding: 8px">
		<span>青岛房产>${house.position}>${house.posidetail}</span>
	</div>
	<div style="margin-left: 80px; float: left; height: 380px; width: 50%">
		<img src="${house.img}" style="height: 380px; width: 100%">
	</div>
	<div style="float: left; margin-left: 40px; width: 30%">
		<b style="color: red; font-size: 50px">${house.price}</b> <span
			style="color: red;">万</span> <b style="margin-left: 30px;">${house.unitPrice}元/平米</b>
		<hr>
		<div style="padding-top: 10px; padding-bottom: 10px">
			<b style="font-size: 25px">${house.shape}室</b> <b
				style="font-size: 25px; margin-left: 80px">${house.area}平方米</b>
			<hr>
		</div>
		<div class="detail">
			<div>
				<span>详细地址 </span><span>${house.posidetail} <span></span>
			</div>
			<div>
				<span>所在区域 </span> <span>${house.position}</span>
			</div>
			<div>
				<span>看房时间 </span> <span>请联系房主</span>
			</div>
			<hr>
		</div>
		<div>
			<h1 style="font-size: 27px">${house.name}</h1>
			<div
				style="border-radius:5px;overflow:hidden; height: 40px; width: 80%; background-color: rgb(48, 114, 246); color: white;">
				<span style="font-size: 27px">电话:${house.tel}</span>
			</div>
			<div
				style="border-radius:5px;overflow:hidden; margin-top: 5px; height: 40px; width: 80%; background-color: rgb(48, 114, 246); color: white;">
				<span style="font-size: 27px">邮箱:${house.email}</span>
			</div>
		</div>
	</div>
</body>
</html>