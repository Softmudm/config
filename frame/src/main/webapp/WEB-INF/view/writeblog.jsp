<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>写博客</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="opensource rich wysiwyg text editor jquery bootstrap execCommand html5" />
    <meta name="description" content="This tiny jQuery Bootstrap WYSIWYG plugin turns any DIV into a HTML5 rich text editor" />
    <link rel="apple-touch-icon" href="//mindmup.s3.amazonaws.com/lib/img/apple-touch-icon.png" />
    <link rel="shortcut icon" href="http://mindmup.s3.amazonaws.com/lib/img/favicon.ico" >
    <link href="../bootstrap-wysiwyg-master/external/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
	<link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <script src="../hUI/lib/jquery/1.9.1/jquery.min.js"></script>
	<script src="../bootstrap-wysiwyg-master/external/jquery.hotkeys.js"></script>
    <script src="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    <script src="../bootstrap-wysiwyg-master/external/google-code-prettify/prettify.js"></script>
	<link href="../bootstrap-wysiwyg-master/index.css" rel="stylesheet">
    <script src="../bootstrap-wysiwyg-master/bootstrap-wysiwyg.js"></script>
    <link  href="../hUI/static/h-ui/css/H-ui.min.css" rel="stylesheet" />
	<link  href="../hUI/static/h-ui.admin/css/H-ui.admin.css" rel="stylesheet"/>
	<link  href="../hUI/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet">
	<link  href="../hUI/static/h-ui.admin/skin/default/skin.css" id="skin" rel="stylesheet"/>
	<link  href="../hUI/static/h-ui.admin/css/style.css" rel="stylesheet"/>

	<script type="text/javascript" src="../hUI/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="../hUI/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript" src="../hUI/static/h-ui.admin/js/H-ui.admin.js"></script>
  </head>
  <body>

<div class="container">
    <div style="margin-top:50px" class="input-group input-group-lg"><span class="input-group-addon"></span>
    <input type="text" placeholder="标题" name="title" id="title" class="form-control"></div>
    <input type="text" placeholder="标签" name="kindsId" id="kindsId" class="form-control"></div>
    <div style="margin-top:20px ; margin-left:40px" data-role="editor-toolbar" data-target="#editor" class="btn-toolbar">
        <div class="btn-group"><a data-toggle="dropdown" title="Font" class="btn dropdown-toggle"><i
                class="glyphicon glyphicon-font"></i><b class="caret"></b></a>
            <ul class="dropdown-menu"></ul>
        </div>
    <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Font Size"><i class="icon-text-height"></i> <b class="caret"></b></a>
        <ul class="dropdown-menu">
            <li><a data-edit="fontSize 5"><font size="5">Huge</font></a></li>
            <li><a data-edit="fontSize 3"><font size="3">Normal</font></a></li>
            <li><a data-edit="fontSize 1"><font size="1">Small</font></a></li>
        </ul>
    </div>
    <div class="btn-group">
        <a class="btn" data-edit="bold" title="Bold (Ctrl/Cmd+B)"><i class="icon-bold"></i></a> <!--加粗-->
        <a class="btn" data-edit="italic" title="Italic (Ctrl/Cmd+I)"><i class="icon-italic"></i></a><!-- 斜体-->
        <a class="btn" data-edit="strikethrough" title="Strikethrough"><i class="icon-strikethrough"></i></a><!-- 删除线-->
        <a class="btn" data-edit="underline" title="Underline (Ctrl/Cmd+U)"><i class="icon-underline"></i></a><!-- 下划线-->
    </div>
    <div class="btn-group">
        <a class="btn" data-edit="insertunorderedlist" title="Bullet list"><i class="icon-list-ul"></i></a><!-- 加点-->
        <a class="btn" data-edit="insertorderedlist" title="Number list"><i class="icon-list-ol"></i></a><!-- 数字排序-->
        <a class="btn" data-edit="outdent" title="Reduce indent (Shift+Tab)"><i class="icon-indent-left"></i></a><!-- 减少缩进-->
        <a class="btn" data-edit="indent" title="Indent (Tab)"><i class="icon-indent-right"></i></a><!--增加缩进-->
    </div>
    <div class="btn-group">
        <a class="btn" data-edit="justifyleft" title="Align Left (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a><!--左对齐-->
        <a class="btn" data-edit="justifycenter" title="Center (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a><!--居中-->
        <a class="btn" data-edit="justifyright" title="Align Right (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a><!--右对齐-->
        <a class="btn" data-edit="justifyfull" title="Justify (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a><!--垂直对齐-->
    </div>
    <div class="btn-group">
        <a class="btn dropdown-toggle" data-toggle="dropdown" title="Hyperlink"><i class="icon-link"></i></a><!-- 链接-->
        <div class="dropdown-menu input-append">
            <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
            <button class="btn" type="button">Add</button>
        </div>
        <a class="btn" data-edit="unlink" title="Remove Hyperlink"><i class="icon-cut"></i></a>
    </div>
    <div class="btn-group">
        <a class="btn" title="Insert picture (or just drag & drop)" id="pictureBtn"><i class="icon-picture"></i></a>
        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
    </div>
    <div class="btn-group">
        <a class="btn" data-edit="undo" title="Undo (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a><!--撤销-->
        <a class="btn" data-edit="redo" title="Redo (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a><!--恢复-->
    </div>
    <input type="text" data-edit="inserttext" id="voiceBtn" x-webkit-speech="">
</div>
</div>
 
<div id="editor">
    Go ahead…
</div>
<div style="margin-top:50px">
<span class="l">
	<a href="javascript:;" onclick="saveBlog()" class="btn btn-success radius"><i class="Hui-iconfont">&#xe6dc;</i> 发布</a> 
	<a href="javascript:;" onclick="saveBlog1()" class="btn btn-warning radius"><i class="Hui-iconfont">&#xe626;</i> 保存</a>
	</span>
</div>
<script>
$(function(){
    function initToolbarBootstrapBindings() {
        var fonts = ['Serif', 'Sans', 'Arial', 'Arial Black', 'Courier',
                    'Courier New', 'Comic Sans MS', 'Helvetica', 'Impact', 'Lucida Grande', 'Lucida Sans', 'Tahoma', 'Times',
                    'Times New Roman', 'Verdana'],
                fontTarget = $('[title=Font]').siblings('.dropdown-menu');
        $.each(fonts, function (idx, fontName) {
            fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
        });
        $('a[title]').tooltip({container:'body'});
        $('.dropdown-menu input').click(function() {return false;})
                .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
                .keydown('esc', function () {this.value='';$(this).change();});

        $('[data-role=magic-overlay]').each(function () {
            var overlay = $(this), target = $(overlay.data('target'));
            overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
        });
        $('#voiceBtn').hide();
         if ("onwebkitspeechchange"  in document.createElement("input")) {
           var editorOffset = $('#editor').offset();
           $('#voiceBtn').css('position','absolute').offset({top: editorOffset.top, left: editorOffset.left+$('#editor').innerWidth()-35});
         } else {
           $('#voiceBtn').hide();
         }
    };
    function showErrorAlert (reason, detail) {
        var msg='';
        if (reason==='unsupported-file-type') {
            msg = "Unsupported format " +detail;
        } else {
            console.log("error uploading file", reason, detail);
        }
        $('<div class="alert"> <button type="button" class="close" data-dismiss="alert">×</button>'+
                '<strong>File upload error</strong> '+msg+' </div>').prependTo('#alerts');
    };
    initToolbarBootstrapBindings();
    $('#editor').wysiwyg({ fileUploadError: showErrorAlert} );
});
</script>
<script>
/*博客-发布*/
function saveBlog() {
   var title = $("#title").val();
   var kindsId = $("#kindsId").val();
   var content = $('#editor').html();
   if(title == "" || kindsId == "" || content == ""){
	   layer.msg('请完善博客信息',{icon:2,time:2000});
	    return;
   }
	var formData = {
			"title":title,
			"kindsId":kindsId,
			"content":content,
	};
	var jsonData  = JSON.stringify(formData);
	$.ajax({
		url:"../blog/saveBlog.do",
		type:"post",
		async:false, 
		data: {data:jsonData},
		dataType: "text",
		success:function(data){
			console.info(data);
			if(data=="Success"){
				layer.msg('已发布',{icon:1,time:2000});
				setTimeout(function(){location.reload();}, 2000);
			}else{
				layer.msg('发布失败',{icon:2,time:2000});
			}  
		}
	})
}
/*博客-保存*/
function saveBlog1() {
	   var title = $("#title").val();
	   var kindsId = $("#kindsId").val();
	   var content = $('#editor').html();
	   if(title == "" || kindsId == "" || content == ""){
		   layer.msg('请完善博客信息',{icon:2,time:2000});
		    return;
	   }
		var formData = {
				"title":title,
				"kindsId":kindsId,
				"content":content,
		};
		var jsonData  = JSON.stringify(formData);
		$.ajax({
			url:"../blog/saveBlog.do",
			type:"POST",
			async:false, 
			data: {data:jsonData},
			dataType: "text",
			success:function(data){
				if(data=="Success"){
					layer.msg('已保存',{icon:2,time:2000});
				}else{
					layer.msg('保存失败',{icon:2,time:2000});
				}  
			}
		})
	}
</script>
</html>