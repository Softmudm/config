<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@include file="/public/loginTag.jsp" %>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link href="../hUI/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="../hUI/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="../hUI/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="../hUI/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<title>博客 - 登录</title>
</head>
<body>
<div class="header">博客登陆</div>
<div class="loginWraper">
  <div class="loginBox">
    <form class="form form-horizontal" id="loginform" method="post" onsubmit="return false;">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="account" name="account" type="text" placeholder="账号" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="password" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <!-- <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;"> -->
          <button type="submit" class="btn btn-success radius size-L" style="margin-top: 30px;">登 录</button>
          <button type="" class="btn btn-success radius size-L" style="margin-left: 160px;margin-top: 30px;">注 册</button>
          <!-- <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;"> -->
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 软泥怪 by H-ui.admin v3.1</div>
<script>
		    if(window.top!==window.self){window.top.location=window.location};
			$(function() {
		        $('#loginform').submit(function() { //当提交表单时，会发生 submit 事件。
		            //此处可做表单验证
		            var postData = $("#loginform").serialize(); //序列化表单，后台可正常通过post方法获取数据
		            $.ajax({
		                type: "POST",
		                url: "/frame/login/goIndex.do",
		                data: postData,
		                dataType: "text",
		                success: function(result) {
		                    if (result == "success") {
		                    	console.info(result);
		                        window.location.href = "/frame/login/index.do";
		                    } else{
		                    	layer.msg('帐号或密码错误',{icon:1,time:2000});
		                    }
		                }
		            });
		        });
				if (window != top) 
					 top.location.href = location.href;
		    });
			</script>
<script type="text/javascript" src="../hUI/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../hUI/static/h-ui/js/H-ui.min.js"></script>
</body>
</html>