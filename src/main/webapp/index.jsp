<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="js/jquery-2.2.4.min.js"></script>
</head>
<body>
	<div>
		<img class="imgHouse" src="images/house.png">
		<h1 class="topic">青大找房</h1>
		<div>
			<form class="find" action="" method="">
				<input type="text" name="txt" id="" value="请输入房源相关信息" /> <input
					type="submit" value="搜房源" />
			</form>
			<a class="post" href="#">免费发布</a>
		</div>

		<div style="height: 10px; width: 10px;"></div>
		<div style="height: 45px; background-color: rgb(48, 114, 230);">
			<ul class="ulstyle">
				<li><a href="House/index.dao" target="houseInfo">首页</a></li>
				<li><a href="">公寓</a></li>
				<li><a href="">住宅</a></li>
				<li><a href="">工业厂房</a></li>
				<li><a href="">别墅</a></li>
				<li><a href="">商业办公</a></li>

			</ul>
		</div>
	</div>
	<div class="nav">
		<form action="" method="">
			<table border="0" cellspacing="10px" cellpadding="">
				<tr>
					<th>位置</th>
					<td><label><input name="Position" type="checkbox"
							value="崂山区" />崂山区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="市南区" />市南区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="市北区" />市北区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="李沧区" />李沧区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="城阳区" />城阳区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="即墨区" />即墨区</label></td>
					<td><label><input name="Position" type="checkbox"
							value="市海岸新区" />市海岸新区</label></td>
				</tr>
				<tr>
					<th>房型</th>
					<td><label><input name="shape" type="checkbox"
							value="一室" />一室</label></td>
					<td><label><input name="shape" type="checkbox"
							value="二室" />二室</label></td>
					<td><label><input name="shape" type="checkbox"
							value="三室" />三室</label></td>
					<td><label><input name="shape" type="checkbox"
							value="四室" />四室</label></td>
					<td><label><input name="shape" type="checkbox"
							value="四室以上" />四室以上</label></td>
				</tr>
				<tr>
					<th>面积</th>
					<td><label><input name="area" type="checkbox"
							value="area<50" />50㎡以下</label></td>
					<td><label><input name="area" type="checkbox"
							value="50<=area and area <80" />50㎡-80㎡</label></td>
					<td><label><input name="area" type="checkbox"
							value="80<=area and area <100" />80㎡-100㎡</label></td>
					<td><label><input name="area" type="checkbox"
							value="100<=area and area <120" />100㎡-120㎡</label></td>
					<td><label><input name="area" type="checkbox"
							value="120<=area and area <150" />120㎡-150㎡</label></td>
					<td><label><input name="area" type="checkbox"
							value="area > 150" />150㎡以上</label></td>
				</tr>
				<tr>
					<th>楼龄</th>
					<td><label><input name="houseage" type="checkbox"
							value="全新" />全新</label></td>
					<td><label><input name="houseage" type="checkbox"
							value="三年内" />三年内</label></td>
					<td><label><input name="houseage" type="checkbox"
							value="五年内" />五年内</label></td>
					<td><label><input name="houseage" type="checkbox"
							value="十年内" />十年内</label></td>
					<td><label><input name="houseage" type="checkbox"
							value="二十年内" />二十年内</label></td>
					<td><label><input name="houseage" type="checkbox"
							value="二十年以上" />二十年以上</label></td>
				</tr>
			</table>
		</form>
	</div>
	<div style="height: 2px; width: 100%; background-color: #9199AA;">
	</div>
	<iframe style="height: 500px; width: 100%; border: 0;"
		src="houseInfo.html" name="houseInfo"></iframe>
	
</body>
</html>