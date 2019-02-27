<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<link  href="<%=basePath%>hUI/static/h-ui/css/H-ui.min.css" rel="stylesheet" />
<link  href="<%=basePath%>hUI/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet"/>
<link  href="<%=basePath%>hUI/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet">
<link  href="<%=basePath%>hUI/static/h-ui.admin/skin/default/skin.css" id="skin" rel="stylesheet"/>
<link  href="<%=basePath%>hUI/static/h-ui.admin/css/style.css" rel="stylesheet"/>

<script type="text/javascript" src="../hUI/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../hUI/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../hUI/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="../hUI/static/h-ui.admin/js/H-ui.admin.js"></script>