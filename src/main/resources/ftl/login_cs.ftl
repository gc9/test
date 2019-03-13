<!DOCTYPE html>
<html style="height: 100%">
<head>
    <#import "spring.ftl" as spring>
    <meta charset="utf-8">
    <title>test</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="icon" href="static/ico/${jys}.ico"/>
    <link rel="stylesheet" href="static/layui/css/layui.css" media="all" >
    <link rel="stylesheet" href="static/css/login_cs.css" media="all">
</head>
<body>
<div class="login">
    <h1>${jys}  test</h1>
    <form class="layui-form" action="loginIn" method="post">
        <div class="layui-form-item">
            <input class="login-input" id="adminName" name="adminName"
                   placeholder="" lay-verify="required"
                   type="text" autocomplete="off">
        </div>
        <div class="layui-form-item">
            <input class="login-input" name="password"
                   placeholder=""
                   lay-verify="required" type="password" autocomplete="off">
        </div>
        <#--<div class="layui-form-item form_code">-->
            <#--<input class="login-input" name="captchaCode" placeholder="图形验证码"-->
                   <#--lay-verify="required" type="text" autocomplete="off">-->
            <#--<div class="code">-->
                <#--<img id="capCode" src="code" width="116" alt="点击更换" title="点击更换" height="36"-->
                     <#--style="margin: 2px 20px;;  border-radius: 20px;" onclick="changeCode()">-->
            <#--</div>-->
        <#--</div>-->
        <#--<div class="layui-form-item form_code">-->
            <#--<input class="login-input" name="verifyCode" placeholder="短信验证码" lay-verify="required"-->
                   <#--type="text" >-->
            <#--<div class="code">-->
                <#--<input type="button" id="verifyBtn" value="获取验证码"-->
                       <#--class="layui-btn verify"  style="margin: 2px 20px;  border-radius: 20px;-->
                       <#--background-color: rgba(52,202,157,1);"/>-->
            <#--</div>-->
        <#--</div>-->
        <div class="layui-form-item form_code" style="text-align: right; margin: -6px 0px 30px;">
            <a id="forgetPwd"  style="color: #1b69b6;cursor: pointer"></a>
        <#--<input class="layui-input" name="verifyCode" placeholder="短信验证码" lay-verify="required"-->
        <#--type="text" >-->
        <#--<div class="code">-->
        <#--<input type="button" id="verifyBtn" value="获取验证码"-->
        <#--class="layui-btn verify"/>-->
        <#--</div>-->
        </div>
        <button class="layui-btn login_btn" lay-submit="" lay-filter="login">
        登录</button>
    </form>
</div>
<div>从数据库查询得到的admin管理员信息：</div>
<div>
    <a>${admin.id}</a>
    <a>${admin.adminName}</a>
    <a>${admin.password}</a>
    <a>${admin.realName}</a>
    <a>${admin.mobile}</a>
    <a>${admin.headPic}</a>
</div>
</body>

<script type="text/javascript" src="static/js/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="static/layui/layui.js"></script>
<script>

    function changeCode() {
        $("#capCode").attr("src","code?t="+ genTimestamp());
    }

    function genTimestamp() {
        var time = new Date();
        return time.getTime();
    }

    function countDown(obj,second){
        // 如果秒数还是大于0，则表示倒计时还没结束
        if(second>=0){
            // 获取默认按钮上的文字
            if(typeof buttonDefaultValue === 'undefined' ){
                buttonDefaultValue =  obj.defaultValue;
            }
            // 按钮置为不可点击状态
            obj.disabled = true;
            // 按钮里的内容呈现倒计时状态
            obj.value = buttonDefaultValue+'('+second+')';
            // 时间减一
            second--;
            // 一秒后重复执行
            setTimeout(function(){countDown(obj,second);},1000);
            // 否则，按钮重置为初始状态
        }else{
            // 按钮置未可点击状态
            obj.disabled = false;
            // 按钮里的内容恢复初始状态
            obj.value = buttonDefaultValue;
        }
    }

    layui.config({
        base : "/static/js/"
    }).use(['form','layer'],function(){
        var form = layui.form,
                layer = layui.layer,
                $ = layui.jquery;

        //登录按钮事件
        form.on("submit(login)",function(data){
            $.ajax({
                type: "POST",
                url: "loginIn",
                data: { "adminName":data.field.adminName,
                    "password":data.field.password},
                success: function(r){
                    if(r.code == 0){
                        window.top.location.href = "${request.contextPath}/index";
                    }else{
                        layer.msg(r.msg, {icon: 5});
                        // changeCode();
                    }
                },error: function (e) {
                    layer.msg("aa", {icon: 5});
                    // changeCode();
                }
            });
            return false;
        });


        $(".verify").bind("click",function (){
            var obj = this;
            var adminName = $('#adminName')[0].value;
            var reg = /^\s*$/g;
            if(reg.test(adminName)){
                layer.msg("aa", {icon: 5});
                return;
            }
            $.ajax({
                url: "loginVerifyCode.json?type=8002&adminName="+adminName,
                type: 'POST',
                dataType: "json",
                success: function (r) {
                    if (r.code == 0) {
                        top.layer.msg("aa", {icon: 1});
                        countDown(obj,60)
                    } else {
                        layer.msg(r.msg, {icon: 5});
                    }
                }, error: function () {
                    layer.msg(r.msg, {icon: 5});
                }
            });
        });

        $(document).on("click","#forgetPwd",function () {
            $.post("${request.contextPath}/rememberPwd", {}, function(str){
                if(str.substr(0,15)=="<!DOCTYPE html>"){
                    window.top.location.href = "${request.contextPath}/index";
                    return ;
                }
                layer.open({
                    title: "aa",
                    type: 1,
                    shadeClose:true,//点击弹层外区域关闭
                    area:["540px","520px"],
                    content:str,
                    success:function (layero,index) {
                        layero.find(".cancelbtn").click(function () {
                            layer.close(index)
                        })
                        form.render();
                    }
                });
            });
        }).on("click","#getCode",function () {
            var obj= this;
            var mobile = $(".forget_wrap input[name='mobile']").val().trim();
            if(/^1\d{10}$/.test(mobile)){
                $.get("${request.contextPath}/loginVerifyCode.json?type=8003&adminName="+mobile, function(res){
                    if(res && res.code == 0){
                        layer.msg("aa")
                    }else{
                        layer.msg(res.msg)
                    }
                });
            }else{
                layer.msg("aa")
            }
        })


        form.verify({
            confirmPwd: function(value, item) {
                var newPwd = $(".forget_wrap input[name='password']").val();
                if(newPwd !== value){
                    return "aa"
                }
            }
        })

        form.on('submit(formForget)',function(data){
            var form = new FormData($("#rememberPwd_form")[0]);
            $.ajax({
                url: "${request.contextPath}/rememberPwdSave ",
                type: 'POST',
                dataType: "json",
                data: form,
                cache: false,
                processData: false,
                contentType: false,
                success: function (r) {
                    if(r.code==0) {
                        top.layer.msg("aa", {icon: 1});
                        layer.closeAll('page');
                    }else {
                        r.msg = r.msg || "aa"
                        layer.msg(r.msg, {icon: 5});
                    }
                }
            });
            return false;
        });
    })
</script>
</html>
