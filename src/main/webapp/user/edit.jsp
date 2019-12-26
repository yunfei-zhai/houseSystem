<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<link href="../layui/css/layui.css" rel="stylesheet">
<script type="text/javascript" src="../layui/layui.all.js"></script>
<script src="../js/jquery-2.2.4.min.js" ></script>
<script type="text/javascript" src="../js/my.js"></script>

<title></title>
</head>
<body>
<style>
.layui-input{width:200px;}
.mystyle{
display:inline-block;
position: left;
}
 .mybtn{
position:absolute;
bottom:10%;
left:30%;
} 
</style>


<form class="layui-form" lay-filter="myform">

<input type="hidden" name="id" > 

  <div class="layui-form-item mystyle">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="name"  autocomplete="off" placeholder="请输入名字" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item mystyle">
    <label class="layui-form-label">电话</label>
    <div class="layui-input-block">
      <input type="text" name="tel"  autocomplete="off" placeholder="请输入电话" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item mystyle">
    <label class="layui-form-label">邮箱</label>
    <div class="layui-input-block">
      <input type="text" name="email"  autocomplete="off" placeholder="请输入电话" class="layui-input">
    </div>
  </div>
   <div class="layui-form-item mystyle">
    <label class="layui-form-label">性别</label>
    <div class="layui-input-block">
      <select name="sex">
      </select>
    </div>
  </div>

    <div class="layui-form-item mystyle">
    <label class="layui-form-label">地址</label>
    <div class="layui-input-block">
      <input type="text" name="address"  autocomplete="off" placeholder="请输入电话" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item  mybtn">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">保存</button>
    </div>
  </div>
</form>
<!-- layui.use(['form',], function(){ -->
<script type="text/javascript">


var id="${param.id}";
function init(){
	$.post("edit.do",{id:id}, function(json) {
		render('myform', json);
		getarray("getsexs.do",{},"[name=sex]",json.sex);
	},"json");
	
}

	init();
	layui.use('form', function(){
		  var form = layui.form;
		  form.on('submit(demo1)', function(data){
			 $.post("update.do", data.field, function(json) {
				  closeFrame();
				  parent.fresh('demo');
				}, "json");
			    return false;
			  });
	});


</script>
</body>
</html>