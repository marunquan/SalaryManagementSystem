<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>职工工资管理系统</title>
    <link rel="stylesheet" type="text/css" href="/bootstrap/css/style.css" rel="stylesheet"/>
</head>
<script type="text/javascript">
    function checkUname() {
        var username = document.getElementById("username").value;
        var unameSpan = document.getElementById("unameSpan");
        var reg = /^[\u4e00-\u9fa5]{2,20}$/;
        if (username == "" || username == null) {
            unameSpan.innerHTML = "*用户名不能为空";
            unameSpan.style.color = "red";
            return false;
        } else if (reg.test(username)) {
            unameSpan.innerHTML = "*用户名通过";
            unameSpan.style.color = "green";
            return true;
        } else {
            //输入校验结果
            unameSpan.innerHTML = "*用户名格式不符"
            unameSpan.style.color = "red";
            return false;
        }
    }
    function checkPwd(){
        //获取用户获得用户名信息
        var upwd=document.getElementById("password").value;
        //创建校验规则,密码要求6-8位，首位为字母，后面5-7位是数字
        var reg=/^\w{4,7}$/;
        //获取span对象
        var span=document.getElementById("pwdSpan");
        //开始交验
        if(upwd==""||upwd==null){
            //输入校验结果
            span.innerHTML="*密码不能为空";
            span.style.color="red";
            return false;
        }else if(reg.test(upwd)){
            //输入校验结果
            span.innerHTML="*密码通过";
            span.style.color="green";
            return true;
        }else{
            //输入校验结果
            span.innerHTML="*密码格式不符"
            span.style.color="red";
            return false;
        }
    }
    function checkId() {
        //获取用户获得用户名信息
        var type = document.getElementById("type").value;
        //创建校验规则,密码要求6-8位，首位为字母，后面5-7位是数字
        //获取span对象
        var typeSpan = document.getElementById("typeSpan");
        //开始交验
        if (type == "-1") {
            //输入校验结果
            typeSpan.innerHTML = " *请选择登陆身份";
            typeSpan.style.color = "red";
            return false;
        } else {
            typeSpan.innerHTML = "*已选择";
            typeSpan.style.color = "green";
            return true;
        }
    }
    function check() {
        var a=checkUname();
        var b=checkPwd();
        var c=checkId();
        if(a&&b&&c)
            return true;
        else{
            return false;
        }
    }
</script>
<body>
<div id="contain">
    <div id=header style="font-family: 楷体;font-size: 32px;float:left;font-weight: bold">
        员 工 工 资 管 理 系 统
    </div>
    <div id="time" style="float:left;text-align:right;font-family: 楷体;padding-left: 10px">
        <SCRIPT>document.getElementById('time').innerHTML='当前时间: '+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());setInterval("document.getElementById('time').innerHTML='当前时间： '+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000);</SCRIPT>
    </div>
</div>
<div id=aside>
    <form action="/check.do" role="form" method="post" id="f"><br>
        <div id="lh3"><font color=gray face="楷体" size=5>账号登录</font></div><br>
        <font color=gray face="楷体">账号 </font><input name="username"  id="username" type="text" style="width: 160px;height: 18px;border-radius: 10px;text-indent: 10px; " onblur="checkUname()">
        <br><span id="unameSpan"></span><br>
        <font color=gray face="楷体">密码 </font><input name="password" id="password" type="password" style="width: 160px;height: 18px;border-radius: 10px;text-indent: 10px;" onblur="checkPwd()">
        <br><span id="pwdSpan"></span><br>
        <label style=" color:white;">
            <font color=gray face="楷体">登录身份:</font>
        </label>
        <select id="type" name="type" type="border-radius: 10px;" onchange="checkId()">
            <option value="-1">
                --请选择--
            </option>
            <option value="0">
                员工
            </option>
            <option value="1">
                财务部工作人员
            </option>
            <option value="2">
                人事部工作人员
            </option>
        </select><span id="typeSpan"></span><br><br>
        <button type="submit" value="登录" style="width:85px;height:40px;color:white;background:#00BFFF;border-radius: 10px;font-size:15px;border:0;" onclick="return check()">登录</button>&emsp;&emsp;
        <button type="reset" value="重置"  style="width:85px;height:40px;color:white;background:#00BFFF;border-radius: 10px;font-size:15px;border:0">重置</button>
    </form>
</div>
<footer id="foot"></footer>
</body>
</html>