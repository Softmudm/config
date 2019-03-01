<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head id="Head1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta charset="utf-8" /><meta http-equiv="X-UA-Compatible" content="IE=edge" /><meta name="viewport" content="width=device-width, initial-scale=1" /><meta name="applicable-device" content="pc,mobile" /><title>
	技高网_专利查询，服务中国智造，推动技术升级转型！
</title><meta content="专利查询系统，提供各行业专利查询，转让，最新前沿专利技术对接信息，专注专利查询15年，简洁易操作的专利查询系统，免费下载专利数据，拥有1500万条专利数据供您免费使用的专利查询系统。技高网，技高一筹，专注专利技术。" name="description" /><meta content="专利技术网,技高网,专利查询,专利转让网,专利交易网,专利查询系统,专利检索,专利技术下载,专利下载网,中国应用技术网" name="keywords" />

<!-- Bootstrap core CSS -->
    <link href="http://img.jigao616.com/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://img.jigao616.com/css/style.css" rel="stylesheet">
    <script src='http://img.jigao616.com/js/jquery.min.js'></script>
    <meta name="keywords" content="技高网,专利技术图纸，专利下载" />
    <meta name="description" content="各种最新技术资料，包含节能减排技术，新材料技术，航空航天，生物医药等技术资料，里面包含了图纸，配方等信息！" /></head>
  <body>
    
<nav class="navbar navbar-diy">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">专利查询</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="http://www.jigao616.com/"><img src="http://img.jigao616.com/images/logo.png" alt="技高网"></a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="firstpage/goFirstPage.do">首页</a></li>
            <li><a href="../login/goLogin.do">博客管理</a></li>
          </ul>
           <ul id="top1_denglu" class="nav navbar-nav navbar-right">
            <li><a href="../login/goLogin.do">登录</a></li>
            <li><a href="http://www.jigao616.com/reg.aspx">注册</a></li>
          </ul>
            
        </div><!--/.nav-collapse -->
         <div class="navbar-form navbar-left topsearch" role="search">
            <input type="text" class="top-control" placeholder="搜索技术材料..." id="patentText" onkeydown= "if(event.keyCode==13){patentS(); return false;}">
            <button type="submit" class="btn btn-so" onclick="patentS();return false;"></button>
          </div>
          
      </div>
    </nav>
    <div class="wrap">
      <div class="container">
          <div class="row">
            <div class="col-md-8">
                <div class="col-box">
                  <div class="col-box-header">
                    <div id="PanelZhongshuju">
					<div class="box-header-h3">最新专利技术资料</div>
                    <div class="box-header-h5">
                        	截至2019年02月28日，共有<strong class="text-red">17,760,694</strong>条技术数据。
                    </div>
					</div>
                  </div>
                </div>
                <div class="col-search-list">
                <ul>


                <c:forEach items="${maps.blogs}" var="blog">
						<li>
                          <div class="so-header">
                              <a href='../firstpage/goFirstPage1.do?blogId=${blog.blogId}'  target="_blank">${blog.title}</a>
                          </div>
                          <div class="so-body">
							<div class="so-cont">
                                ${blog.content}
                            </div>
                          </div>
                          <div class="so-meta">
                           	 作者：<a href=''>${blog.userName}</a> 　　分类：<a href=''>${blog.kindsId}</a>
                          </div>
                          <div class="so-footer">
                            <span class="pull-left">
                                1天前更新
                            </span>
                            <span class="pull-right"> 访问量：11</span>
                          </div>
                      </li>
                </c:forEach>
                </ul>
                </div>
                <!-- pages -->
                <div class="pages">
                        
                    <button class="btn" id="prePage" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage-1}'">上一页</button>
				    <button class="btn" id="btn1" onclick="window.location.href='goFirstPage.do?page=1'">1</button>
				    <span id="prePoint">...</span>
				    <button class="btn" id="btn2" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage-2}'"></button>
				    <button class="btn" id="btn3" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage-1}'"></button>
				    <button class="btn" id="btn4" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage}'"></button>
				    <button class="btn" id="btn5" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage+1}'"></button>
				    <button class="btn" id="btn6" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage+2}'"></button>
				    <span id="sufPoint">...</span>
				    <button class="btn" id="btn7" ></button>
				    <button class="btn" id="sufPage" onclick="window.location.href='goFirstPage.do?page=${maps.currentPage+1}'">下一页</button>
                    </div>
            </div>
            <script type="text/javascript">
            $(function(){
                var currentPage=${maps.currentPage};
                var pageNum=Number(50);

                //给每个button赋值（第一个默认为1）
                $("#btn2").text(currentPage-2);
                $("#btn3").text(currentPage-1);
                $("#btn4").text(currentPage);
                $("#btn5").text(currentPage+1);
                $("#btn6").text(currentPage+2);
                $("#btn7").text(pageNum);

                //可改变当前页的button样式
                $("#btn4").css("background-color","#ff3f0f"); 

                //先处理"上一页"和"下一页"的情况
                if(currentPage==1)  //如果当前页为首页
                {
                    $("#prePage").hide();  
                }

                if(currentPage==pageNum)    //如果当前页为末页
                {
                    $("#sufPage").hide();
                }

                //处理当前页小于等于3的特殊情况
                if(currentPage<=3){
                    $("#prePoint").hide();
                    $("#btn1").hide();
                }//当前页是4还需要hide掉第一个省略号按钮（！重要）
                else if(currentPage==4){
                    $("#prePoint").hide();
                }
                //当前页是1还需要hide掉第二第三个按钮
                if(currentPage==1)
                {
                    $("#btn2").hide();
                    $("#btn3").hide();
                }
                //当前页是2则也需要hide掉第二个按钮（此时为-1）
                else if(currentPage==2)
                {
                    $("#btn2").hide();
                }

                //最末端的特殊情况处理和最前端是一样的
                if(currentPage>=pageNum-2){
                    $("#sufPoint").hide();
                    $("#btn7").hide();
                }
                else if(currentPage==pageNum-3){
                    $("#sufPoint").hide();
                }

                if(currentPage==pageNum)
                {
                    $("#btn5").hide();
                    $("#btn6").hide();
                }

                if(currentPage==pageNum-1)
                {
                    $("#btn6").hide();
                }
            });
            </script>
            
<div class="col-md-4">
                <div class="col-box">
                  <div class="col-box-header"><span class="search-tit"><a href="http://www.jigao616.com/zhuanli/zhuanliMulu.aspx" title="2019-02-28发明人排行榜">科研机构数量排行前10</a></span></div>
                  <div class="col-box-list">
                      <ul>

                          
							<li><a href="http://www.jigao616.com/zhuanli/huaweijishuyouxiangongsi/" title="华为技术有限公司专利">华为技术有限公司</a> 61287</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/guojiadianwanggongsi/" title="国家电网公司专利">国家电网公司</a> 59213</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhongxintongxungufenyouxiangongsi/" title="中兴通讯股份有限公司专利">中兴通讯股份有限公司</a> 51995</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/sanxingdianzizhushihuishe/" title="三星电子株式会社专利">三星电子株式会社</a> 42517</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhongguoshiyouhuagonggufenyouxiangongsi/" title="中国石油化工股份有限公司专利">中国石油化工股份有限公司</a> 41863</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhejiangdaxue/" title="浙江大学专利">浙江大学</a> 39675</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/songxiadianqichanyezhushihuishe/" title="松下电器产业株式会社专利">松下电器产业株式会社</a> 34426</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhuhaigelidianqigufenyouxiangongsi/" title="珠海格力电器股份有限公司专利">珠海格力电器股份有限公司</a> 31125</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/qinghuadaxue/" title="清华大学专利">清华大学</a> 27849</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/huananligongdaxue/" title="华南理工大学专利">华南理工大学</a> 25590</li>
							
                      </ul>
                  </div>
                </div>
    <div class="col-box">
                  <div class="col-box-header"><span class="search-tit"><a href="http://www.jigao616.com/zhuanli/zhuanliMulu.aspx" title="2019-02-28发明人排行榜">最新更新发明人</a></span></div>
                  <div class="col-box-list">
                      <ul>

                          
							<li><a href="http://www.jigao616.com/zhuanli/luofangming/" title="罗放明专利">罗放明</a> 59</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhongguokexueyuanshenyangzidonghuayanjiusuo/" title="中国科学院沈阳自动化研究所专利">中国科学院沈阳自动化研究所</a> 2595</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhongguokexueyuanhefeiwuzhikexueyanjiuyuan/" title="中国科学院合肥物质科学研究院专利">中国科学院合肥物质科学研究院</a> 3165</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhangjiakoujuanyanchangyouxianzerengongsi/" title="张家口卷烟厂有限责任公司专利">张家口卷烟厂有限责任公司</a> 76</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/chenwenjie/" title="陈文杰专利">陈文杰</a> 134</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhongyuangongxueyuan/" title="中原工学院专利">中原工学院</a> 1808</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/liyuqiang/" title="李玉强专利">李玉强</a> 63</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/tongyongdianqigongsi/" title="通用电气公司专利">通用电气公司</a> 14773</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/zhuyouxiangjiaogongyezhushihuishe/" title="住友橡胶工业株式会社专利">住友橡胶工业株式会社</a> 2402</li>
							
							<li><a href="http://www.jigao616.com/zhuanli/yaxiaoping/" title="颜小平专利">颜小平</a> 24</li>
							
                      </ul>
                  </div>
                </div>
            </div>
          </div>
      </div>
    </div>
    
    <div class="footer">
        <p>
            
    <a  href="http://www.jigao616.com/about_26.aspx">关于我们</a>
    
    <span class="line">|</span>
    
    
    <a  href="http://www.jigao616.com/about_22.aspx">联系我们</a>
    
    <span class="line">|</span>
    
    
    <a  href="http://www.jigao616.com/about_46.aspx">支付方式</a>
    
    <span class="line"></span>
    
    
        </p>
        <p>Copyright &copy; 2018 All Rights Reserved. </p><p> <a href="http://www.miitbeian.gov.cn/" target="_blank" rel="nofollow">津ICP备16005673号-1</a> 津公网安备 12010002000008号 技高德科技（天津）有限公司版权所有  <a href="http://www.jigao616.com/zuixinzhuanli.aspx">最新专利</a></p>

    </div>
    <script src='http://img.jigao616.com/js/jquery.min.js'></script>
    <script src='http://img.jigao616.com/js/bootstrap.min.js'></script>
<script src="http://img.jigao616.com/js/jquery.lazyload.js"></script>
<script type="text/javascript">
    $(function () {
        $("img.lazyload").lazyload();
    });
    //科技券领取
    function onlogin(url) {
        $.getJSON(url + "ashx/DaKa.ashx?j=" + Math.random(), function (json) {
            if (json.data == 2) {
                //$("#daka").html("已签到");
                alert("今天已领取");
            } else if (json.data == 1) {
                $("#daka").html("已领取科技券");
                alert("签到领取了5个科技券\r\n每天只能领取一次");
            } else {
                alert("领取失败，请重新登录");
            }
        });
    }
</script>
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?12366927c4be2160d368602e4ed13f15";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

  </body>
</html>