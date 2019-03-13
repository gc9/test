<!DOCTYPE html>
<html lang="en">
<head>
    <#import "spring.ftl" as spring>
    <meta charset="utf-8"/>
    <title>${jys}</title>
    <meta name="renderer" content="webkit"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Access-Control-Allow-Origin" content="*"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
    <meta name="apple-mobile-web-app-status-bar-style" content="black"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="static/ico/${jys}.ico"/>
    <link rel="stylesheet" href="static/myicon/iconfont.css" media="all" />
    <link rel="stylesheet" href="static/layui/css/layui_cs.css" media="all" />
    <link rel="stylesheet" href="//at.alicdn.com/t/font_tnyc012u2rlwstt9.css" media="all" />
    <link rel="stylesheet" href="static/css/main_cs.css" media="all" />
    <link rel="stylesheet" href="static/css/user.css" media="all" />
</head>
<body class="main_body">
<div class="layui-layout layui-layout-admin">
    <!-- 顶部 -->
    <div class="layui-header header">
        <div class="layui-main">
            <#--<a  class="logo">${jys}</a>-->
            <#--<a class="shangcheng">后台</a>-->
            <img class="logo" src="static/images/Vtoken.png">
            <div class="navBar"></div>
            <!-- 显示/隐藏菜单 -->
            <#--<a href="javascript:" class="iconfont hideMenu icon-menu1"></a>-->

        <#--<!-- 天气信息 &ndash;&gt;-->
        <#--<div class="weather" pc>-->
        <#--<div id="tp-weather-widget"></div>-->
        <#--<script>(function(T,h,i,n,k,P,a,g,e){g=function(){P=h.createElement(i);a=h.getElementsByTagName(i)[0];P.src=k;P.charset="utf-8";P.async=1;a.parentNode.insertBefore(P,a)};T["ThinkPageWeatherWidgetObject"]=n;T[n]||(T[n]=function(){(T[n].q=T[n].q||[]).push(arguments)});T[n].l=+new Date();if(T.attachEvent){T.attachEvent("onload",g)}else{T.addEventListener("load",g,false)}}(window,document,"script","tpwidget","//widget.seniverse.com/widget/chameleon.js"))</script>-->
        <#--<script>tpwidget("init", {-->
        <#--"flavor": "slim",-->
        <#--"location": "WX4FBXXFKE4F",-->
        <#--"geolocation": "enabled",-->
        <#--"language": "zh-chs",-->
        <#--"unit": "c",-->
        <#--"theme": "chameleon",-->
        <#--"container": "tp-weather-widget",-->
        <#--"bubble": "disabled",-->
        <#--"alarmType": "badge",-->
        <#--"color": "#FFFFFF",-->
        <#--"uid": "U9EC08A15F",-->
        <#--"hash": "039da28f5581f4bcb5c799fb4cdfb673"-->
        <#--});-->
        <#--tpwidget("show");</script>-->
        <#--</div>-->


            <!-- 顶部右侧菜单 -->
            <ul class="layui-nav top_menu" >
                <li class="layui-nav-item" pc>
                    <a href="javascript:" style="color:rgba(255,255,255,1);">
                        <img src="${admin.headPic}" class="layui-circle" width="35" height="35">
                        <cite id="realName">${admin.realName}</cite>
                    </a>
                    <input type="hidden"  id="adminId" value="${admin.id}"/>
                    <input type="hidden"  id="adminName" value="${admin.adminName}"/>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:" id="showInfo"><i
                                class="layui-icon">&#xe66f;</i><cite>
                            <@spring.message  code='mess.index.Personal.information'/>
                        </cite></a></dd>
                        <dd><a href="javascript:" id="changePwdPage"><i
                                class="layui-icon">&#xe642;</i><cite><@spring.message  code='mess.index.change.Password'/></cite></a></dd>
                    </dl>
                </li>
            </ul>
                <ul class="layui-nav top_menu2" >
                    <li class="layui-nav-item" pc>
                        <a href="javascript:" style="color:rgba(255,255,255,1);">
                            <#--<img src="${admin.headPic}" class="layui-circle" width="35" height="35">-->
                            <cite id="language">
                            <@spring.message  code='mess.index.Language'/>
                            </cite>
                        </a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:" id="language_zh_cn"><cite>
                                <@spring.message  code='mess.index.Chinese'/>
                            </cite></a></dd>
                            <dd><a href="javascript:" id="language_en_us"><cite>
                                <@spring.message  code='mess.index.English'/>
                            </cite></a></dd>
                            <dd><a href="javascript:" id="language_zh_tw"><cite>
                                <@spring.message  code='mess.index.traditional.Chinese'/>
                            </cite></a></dd>
                        </dl>
                    </li>
                </ul>
            <a href="loginOut.do" class="signOut"><cite style="padding-right: 5px;">
            <@spring.message  code='mess.index.Exit'/></cite><img
                    src="static/image_cs/login_out.png"></a>
        </div>

    </div>


    <#--<!-- 左侧导航 &ndash;&gt;-->
    <#--<div class="layui-side layui-bg-black">-->
    <#--&lt;#&ndash;<div class="user-photo">&ndash;&gt;-->
    <#--&lt;#&ndash;<a href="javascript:" class="img  closePageAll " title="我的头像" ><img&ndash;&gt;-->
    <#--&lt;#&ndash;id="head"&ndash;&gt;-->
    <#--&lt;#&ndash;src="${admin.headPic}"></a>&ndash;&gt;-->
    <#--&lt;#&ndash;<p>你好！<span class="userName">${admin.realName}</span>, 欢迎登录</p>&ndash;&gt;-->
    <#--&lt;#&ndash;</div>&ndash;&gt;-->

        <#--<div class="navBar layui-side-scroll"></div>-->
        <#--<div >-->
            <#--<a href="loginOut.do" style="width: 180px; margin: 40px 0 0 10px;" class="layui-btn layui-btn-radius-->
            <#--layui-btn-normal"><i-->
                    <#--class="iconfont icon-loginout"></i>退出</a>-->
        <#--</div>-->
    <#--&lt;#&ndash;<a href="javascript:" class="iconfont hideMenu icon-menu1"></a>&ndash;&gt;-->
    <#--</div>-->


    <!-- 右侧内容 -->
    <div class="layui-body layui-form main_top" id="layui-body">
        <div class="layui-tab marg0" lay-filter="bodyTab" id="top_tabs_box">
            <#--<ul class="layui-tab-title top_tab" id="top_tabs">-->
                <#--<li class="layui-this" lay-id=""><i class="layui-icon layui-icon-home"></i> <cite>首页</cite></li>-->
            <#--</ul>-->
            <#--<ul class="layui-nav closeBox">-->
                <#--<li class="layui-nav-item">-->
                    <#--<a href="javascript:"><i class="iconfont icon-caozuo"></i> 页面操作</a>-->
                    <#--<dl class="layui-nav-child">-->
                        <#--<dd><a href="javascript:" class="refresh refreshThis"><i class="layui-icon">&#xe669;-->
                        <#--</i> 刷新当前</a></dd>-->
                        <#--<dd><a href="javascript:" class="closePageOther"><i class="iconfont icon-prohibit"></i> 关闭其他</a></dd>-->
                        <#--<dd><a href="javascript:" class="closePageAll"><i class="iconfont icon-guanbi"></i> 关闭全部</a></dd>-->
                    <#--</dl>-->
                <#--</li>-->
            <#--</ul>-->
            <div class="layui-tab-content clildFrame" id="frameID">
                <div class="layui-tab-item layui-show">
                    <iframe id="bodyContent"></iframe>
                </div>
            </div>
        </div>
        <#--<div class="layui-tab-content clildFrame" id="frameID">-->
            <#--<div class="layui-tab-item layui-show">-->
                <#--<iframe src="toMainPage"></iframe>-->
            <#--</div>-->
        <#--</div>-->
    </div>

</div>

<!-- 移动导航 -->
<div class="site-tree-mobile layui-hide"><i class="layui-icon">&#xe602;</i></div>
<div class="site-mobile-shade"></div>

<script type="text/javascript" src="static/layui/layui.js"></script>
<script type="text/javascript" src="static/js/leftNav.js"></script>
<script type="text/javascript" src="static/js/index.js"></script>
<script type="text/javascript" src="static/js/common.js"></script>
<script>
    var msg_totle = '<@spring.message  code="mess.layui.Total"/>';
    var msg_item = '<@spring.message  code="mess.layui.item"/>';
    var msg_go = '<@spring.message  code="mess.layui.Go"/>';
    var msg_page = '<@spring.message  code="mess.layui.page"/>';
    var msg_to ='<@spring.message  code="mess.layui.to"/>';
    var msg_first = '<@spring.message  code="mess.layui.First"/>';
    var msg_last ='<@spring.message  code="mess.layui.Last"/>';

    var msg_req = '<@spring.message  code="mess.layui.req"/>';
    var msg_phone = '<@spring.message  code="mess.login.verify.mobile"/>';
    var msg_email = '<@spring.message  code="mess.layui.email"/>';
    var msg_url = '<@spring.message  code="mess.layui.url"/>';
    var msg_number = '<@spring.message  code="mess.layui.number"/>';
    var msg_date = '<@spring.message  code="mess.layui.date"/>';
    var msg_ID = '<@spring.message  code="mess.layui.ID.card"/>';
    var $;
    layui.config({
        base : "static/js/"
    }).use(['element','form','layer','jquery','laypage'],function() {
        var form = layui.form,
            layer = layui.layer,
            laypage = layui.laypage,
            element = layui.element;
            $ = layui.jquery;

        //判断当前页面
        var pageUrl = window.sessionStorage.getItem("menu_url_cs") || "toMainPage";
        $("#bodyContent").attr("src",pageUrl)

        $(document).on("click","li.layui-col-md1",function () {
            $(".grid-demo-bg2.active").removeClass("active")
            $(this).find(".grid-demo-bg2").addClass("active")
        });

        element.on('tab(docDemoTabBrief)', function(data){
            if($(this).has("a").length > 0){
                document.getElementById("layui-body").setAttribute("class", "layui-body layui-form main_top");
                document.getElementsByTagName("iframe")[0].setAttribute("class", "main_padding");
                window.sessionStorage.setItem("menu_cs",data.index);
                window.sessionStorage.setItem("menu_sub_cs","");
                window.sessionStorage.setItem("menu_new_cs","");
                window.sessionStorage.setItem("menu_url_cs",$(this).find("a").data("url"));
            }else{
                document.getElementById("layui-body").setAttribute("class", "layui-body layui-form");
                document.getElementsByTagName("iframe")[0].setAttribute("class", "u_padding");
                window.sessionStorage.setItem("menu_new_cs",data.index)
            }
        });

        $("#showInfo").click(function(){
            $.post("${request.contextPath}/admin/showInfo", {}, function(str){
                if(str.substr(0,15)=="<!DOCTYPE html>"){
                    window.top.location.href = "${request.contextPath}/index";
                    return ;
                }
                ztfile = null;
                layer.open({
                    title: '<@spring.message  code='mess.index.Personal.information'/>',
                    type: 1,
                    shadeClose:true,//点击弹层外区域关闭
                    area:["640px","80%"],
                    content:str,
                    success:function (layero,index) {
                        layero.find(".cancelbtn").click(function () {
                            layer.close(index)
                        })
                        form.render();
                    }
                });
            });
        });

        $("#language_zh_cn").click(function(){
            setCookie("accept-language","zh_CN");
            window.top.location.href = "${request.contextPath}/index";
        });
        $("#language_zh_tw").click(function(){
            setCookie("accept-language","zh_TW");
            window.top.location.href = "${request.contextPath}/index";
        });
        $("#language_en_us").click(function(){
            <#--window.top.location.href = "${request.contextPath}/index?locale=en_US";-->
            setCookie("accept-language","en_US");
            window.top.location.href = "${request.contextPath}/index";
        });

        // var username=document.cookie.split(";")[0].split("=")[1];
        function setCookie(name,value)
        {
            var Days = 30;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days*24*60*60*1000);
            document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
        }

        //验证码
        $('body').on('click','#verify',function(){
            $.ajax({
                url: "${request.contextPath}/wallet/verifyCode?type=9000",
                type: 'POST',
                dataType: "json",
                success: function (r) {
                    if (r.code == 0) {
                        top.layer.msg("<@spring.message  code='mess.common.sms.sent'/>", {icon: 1});
                    } else {
                        layer.msg(r.msg, {icon: 5});
                    }
                }, error: function () {
                    layer.msg(r.msg, {icon: 5});
                }
            });
        });

        form.on('submit(formDemo)',function(data){
            layer.close(layer.index);
            layer.load(0,{shade:[0.5,'#000']});
            var form = new FormData($("#admin_form")[0]);
            form.append('file',ztfile);
            $.ajax({
                url: "${request.contextPath}/admin/saveOrUpdate",
                type: 'POST',
                dataType: "json",
                data: form,
                cache: false,
                processData: false,
                contentType: false,
                success: function (r) {
                    if(r.code==0) {
                        layer.close(layer.index);
                        top.layer.msg("<@spring.message  code='mess.common.operation.success'/>！", {icon: 1});
                        //刷新父页面
                        // location.reload();
                    }else {
                        r.msg = r.msg || "<@spring.message  code='mess.common.operation.failed'/>！"
                        top.layer.msg(r.msg, {icon: 5});
                    }
                },
                complete:function () {
                    layer.closeAll('loading');
                }
            });
            return false;
        });


        $("#changePwdPage").click(function(){
            $.post("${request.contextPath}/admin/changePwdPage", {}, function(str){
                if(str.substr(0,15)=="<!DOCTYPE html>"){
                    window.top.location.href = "${request.contextPath}/index";
                    return ;
                }
                layer.open({
                    title: '<@spring.message  code='mess.index.change.Password'/>',
                    type: 1,
                    shadeClose:true,//点击弹层外区域关闭
                    area:["640px","70%"],
                    content:str,
                    success:function (layero,index) {
                        layero.find(".cancelbtn").click(function () {
                            layer.close(index)
                        })
                        form.render();
                    }
                });
            });
        });

        form.on('submit(changePwd)',function(data){
            if(data.field.newPassword1 != data.field.newPassword){
                top.layer.msg("<@spring.message  code='mess.login.verify.pwd2'/>");
                return false;
            }
            var form = new FormData($("#pwd_form")[0]);
            $.ajax({
                url: "${request.contextPath}/admin/changePwd",
                type: 'POST',
                dataType: "json",
                data: form,
                cache: false,
                processData: false,
                contentType: false,
                success: function (r) {
                    if(r.code==0) {
                        layer.close(layer.index);
                        top.layer.msg("<@spring.message  code='mess.common.operation.success'/>！", {icon: 1});
                        layer.closeAll("iframe");
                        //刷新父页面
                        // parent.location.reload();
                    }else {
                        layer.msg(r.msg, {icon: 5});
                    }
                }
            });
            return false;
        });

    })
</script>
</body>
</html>
