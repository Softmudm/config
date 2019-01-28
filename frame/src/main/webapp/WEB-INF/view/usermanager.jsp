<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" type="text/css" href="../hUI/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="../hUI/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="../hUI/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="../hUI/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="../hUI/static/h-ui.admin/css/style.css" />

<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- <div class="text-c">
		<button onclick="removeIframe()" class="btn btn-primary radius">关闭选项卡</button>
	 <span class="select-box inline">
		<select name="" class="select">
			<option value="0">全部分类</option>
			<option value="1">分类一</option>
			<option value="2">分类二</option>
		</select>
		</span> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
		<input type="text" name="" id="" placeholder=" 资讯名称" style="width:250px" class="input-text">
		<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 查询用户</button>
	</div> -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
	<a href="javascript:;" onclick="delUsers()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> 
	<!-- <button type="button" class="btn btn-outline btn-default"
                                               data-toggle="modal" data-target="#xzyg">
                                           <i class="glyphicon glyphicon-plus " aria-hidden="true"><span style="margin-left:3px;">新增用户</span></i></span>
                                       </button> -->
	<a href="javascript:;" data-toggle="modal" data-target="#xzyh" class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a></span>
	<span class="r">共有数据：<strong>${fn:length(users)}</strong> 条</span> </div><!-- onclick="user_add('550','','添加用户','user-add.jsp')" -->
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive" id="table">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th width="80">ID</th>
					<th width="80">姓名</th>
					<th>密码</th>
					<th width="80">帐号</th>
					<th width="120">操作</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${users}" var="user">
				<tr class="text-c">
					<td><input type="checkbox" value="checkbox" name="usercb"></td>
					<td>${user.userId}</td>
					<!-- <td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">资讯标题</u></td> -->
					<td>${user.userName}</td>
					<td>${user.password}</td>
					<td>${user.account}</td>
					<!-- <td class="td-status"><span class="label label-success radius">已发布</span></td> -->
					<td class="f-14 td-manage">
						<a style="text-decoration:none" 
						class="ml-5" 
						onClick="article_edit('编辑','article-add.html','10001')" 
						href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> 
						<a style="text-decoration:none" 
						class="ml-5" 
						onClick="delUser(${user.userId})" 
						href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
</div>
<!----------------------------------------------新增用户弹出框代码结束------------------------------------------------->
    <div class="modal inmodal fade" id="xzyh" tabindex="-1" role="dialog"  aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header"  style="padding: 10px 15px">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h5 class="modal-title" style="font-size: 16px" >新增用户</h5>
                </div>
                <div class="modal-body form-horizontal" style="padding: 20px 50px 70px;">

                    <div class="row">
                        <div class="col-sm-12">

                            <div class="col-sm-6  control-label col-jj ">
                                <label class="col-sm-4 control-label col-jj  text-right">姓名:</label>

                                <div class="col-sm-7  col-jj">
                                    <input id="userName" placeholder="" class="form-control" >
                                </div>

                            </div>
                            <div class="col-sm-6  control-label col-jj">
                                <label class="col-sm-4 control-label col-jj  text-right">帐号:</label>

                                <div class="col-sm-7 col-jj">
                                    <input id="account" placeholder="" class="form-control ">
                                </div>

                            </div>
                        </div >
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

                            <div class="col-sm-6  control-label col-jj ">
                                <label class="col-sm-4 control-label col-jj  text-right">密码:</label>

                                <div class="col-sm-7  col-jj">
                                    <input id="password" type="password" placeholder="" class="form-control" >
                                </div>

                            </div>
                            <div class="col-sm-6  control-label col-jj">
                                <label class="col-sm-4 control-label col-jj  text-right">确认密码:</label>

                                <div class="col-sm-7 col-jj">
                                    <input id="password1" type="password" placeholder="" class="form-control ">
                                </div>

                            </div>
                        </div >
                    </div>
                </div>

                <div class="modal-footer" >
                    <button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" onclick="saveUser()">保存</button>
                </div>
            </div>
        </div>
    </div>
<!----------------------------------------------新增用户弹出框代码结束------------------------------------------------->
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="../hUI/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="../hUI/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="../hUI/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="../hUI/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="../hUI/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="../hUI/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="../hUI/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	/* "aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false, */
	/* "aoColumnDefs": [
	  {"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,5]}// 不参与排序的列
	] */
});

/*用户-新增*/
function saveUser() {
   var pass = $("#password").val();
   var pass1 = $("#password1").val();
   var userName = $("#userName").val();
   var account = $("#account").val();
   if(pass == "" || pass1 == "" || userName == "" || account == ""){
	   layer.msg('请完善信息',{icon:2,time:2000});
	    return;
   }
   if(pass != pass1){
	   layer.msg('两次密码不一致',{icon:2,time:2000});
	    return;
   }
   $("#xzyh").modal('hide');
	var formData = {
			"userName":userName,
			"account":account,
			"password":pass,
	};
	var jsonData  = JSON.stringify(formData);
	$.ajax({
		url:"../user/saveUser.do",
		type:"POST",
		async:false, 
		data: {data:jsonData},
		dataType: "text",
		success:function(data){
			if(data=="Success"){
				layer.msg('已新增',{icon:1,time:2000});
				setTimeout(function(){location.reload();}, 2000);
			}else if(data=="Fail"){
				layer.msg('帐号已存在',{icon:2,time:2000});
			}else{
				layer.msg('新增失败',{icon:2,time:2000});
			}  
		}
	})
}
/*资讯-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

function delUsers(){
	layer.confirm('确认要删除选中的用户吗？',{ title: "删除确认" },
			function(index){
		layer.close(index);
	var data = [];
    $("#table").find(":checkbox:checked").each(
    		function(){
       var val = $(this).parent().next().text();
       data.push(val);
    });
    $.ajax({
    	type:'POST',
    	async:false, 
    	url:'../user/delUsers.do',
    	traditional:true,
    	data:{
    		data : data
    	},
    	success: function(data){
			if(data=="Success"){
				layer.msg('已删除',{icon:1,time:1000});
				setTimeout(function(){location.reload();}, 1000);
			}else{
				layer.msg('删除失败',{icon:2,time:1000});
			}
		},
    })
	});
}

/*用户-删除(单个)*/
function delUser(obj){
	layer.confirm('确认要删除吗？',{ title: "删除确认" },
			function(index){
		layer.close(index);
		$.ajax({
			type: 'POST',
			url: '../user/delUser.do?id='+obj,
			success: function(data){
				if(data=="Success"){
					layer.msg('已删除',{icon:1,time:1000});
					setTimeout(function(){location.reload();}, 1000);
				}else{
					layer.msg('删除失败',{icon:1,time:1000});
				}
			},
		});		
	});
}

/*资讯-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*资讯-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
		$(obj).remove();
		layer.msg('已下架!',{icon: 5,time:1000});
	});
}

/*资讯-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布!',{icon: 6,time:1000});
	});
}
/*资讯-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}

</script> 
</body>
</html>