<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>百度地图API</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=nSxiPohfziUaCuONe4ViUP2N"></script>  
    <!-- 如果需要拖拽鼠标进行操作，可引入以下js文件 -->
    <script type="text/javascript" src="http://api.map.baidu.com/library/RectangleZoom/1.2/src/RectangleZoom_min.js"></script> 
     <style type="text/css">
        body, html {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
    </style> 
</head>
<body>  
   <div id="allmap" style="width: 100%;height: 100%;"></div>
</body>  
</html>  
<script type="text/javascript">  
	var position="${param.position}";
    // 百度地图API功能
    function G(id) {
        return document.getElementById(id);
    }

    var map = new BMap.Map("allmap");
    map.enableScrollWheelZoom();   //启用滚轮放大缩小，默认禁用
    map.enableContinuousZoom();    //启用地图惯性拖拽，默认禁用
    var myDrag = new BMapLib.RectangleZoom(map, {
        followText: "拖拽鼠标进行操作"
    });
    myDrag.open();  //开启拉框放大
    // myDrag.close();  //关闭拉框放大

    map.centerAndZoom("青岛",15);   // 初始化地图,设置城市和地图级别。

    var ac = new BMap.Autocomplete(    //建立一个自动完成的对象
        {"input" : "suggestId"
        ,"location" : map
    });

   map.clearOverlays();    //清除地图上所有覆盖物
   function myFun(){
       var pp = local.getResults().getPoi(0).point;    //获取第一个智能搜索的结果
       console.log('经度：'+pp.lng, '纬度：'+pp.lat);
       map.centerAndZoom(pp, 18);
       map.addOverlay(new BMap.Marker(pp));    //添加标注
   }
   var local = new BMap.LocalSearch(map, { //智能搜索
     onSearchComplete: myFun
   });
   local.search(position);

   
    
</script>