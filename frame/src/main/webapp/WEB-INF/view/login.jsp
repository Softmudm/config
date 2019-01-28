<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<%@include file="/public/loginTag.jsp" %>
		<title>登录</title>
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
		                //async:false,//同步
		                success: function(result) {
		                    if (result="success") {
		                    	console.info(result);
		                        window.location.href = "/frame/login/index.do";
		                        alert('登录成功');
		                    } else {
		                    	alert('账号或密码错误');
		                    }
		                }
		            });
		        });
				if (window != top) 
					 top.location.href = location.href;
		    });
			</script>
	</head>
<body>
<h2>Login!</h2>
                 <form  role="form" id="loginform"  method="post" onsubmit="return false;">

                    <div class="form-group">
                        <input type="text" name="account" class="form-control" placeholder="用户名" required="">
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" class="form-control" placeholder="密码" required="">
                    </div>
                    <button type="submit" class="btn btn-primary block full-width m-b" style="margin-top: 30px;">登 录</button>
                </form>
</body>
</html>