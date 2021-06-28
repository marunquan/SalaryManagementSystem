<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/12
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="/bootstrap/css/sweetalert.css" rel="stylesheet">
    <style>
        #main-nav{
            margin-left: 1px;
        }
        #main-nav.nav-tabs.nav-stacked > li > a{
            padding: 10px 8px;
            font-size: 12px;
            font-weight: 600;
            color: #4A515B;
            background: #e9e9e9;
            background: -moz-linear-gradient(top,#FAFAFA 0%,#E9E9E9 100%);
            background: -webkit-gradient(linear, left top,left bottom, color-stop(0%,#FAFAFA),color-stop(100%,#E9E9E9));
            background: -moz-linear-gradient(top,#FAFAFA 0%,#E9E9E9 100%);
            background: -o-linear-gradient(top,#FAFAFA 0%,#F9F9F9 100%);
            background: -ms-linear-gradient(top,#FAFAFA 0%,#F9F9F9 100%);
            background: linear-gradient(top,#FAFAFA 0%,#F9F9F9 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA',endColorstr='#E9E9E9');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FAFAFA',endColorstr='#E9E9E9')";
            border: 1px solid #D5D5D5;
            border-radius: 4px;
        }
        #main-nav.nav-tabs.nav-stacked > li > a > span{
            color: #4A515B;
        }
        #main-nav.nav-tabs.nav-stacked > li > a.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover{
            color: #FFF;
            background: #3C4049;
            background: -moz-linear-gradient(top,#4A515B 0%,#3C4049 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#4A515B),color-stop(100%,#3C4049));
            background: -webkit-linear-gradient(top,#4A515B 0%,#3C4049 100%);
            background: -o-linear-gradient(top,#4A515B 0%,#3C4049 100%);
            background: -ms-linear-gradient(top,#4A515B 0%,#3C4049 100%);
            background: linear-gradient(top,#4A515B 0%,#3C4049 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B',endColorstr='#3C4049');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#4A515B',endColorstr='#3C4049')";
            border-color: #2B2E33;
        }
        #main-nav.nav-tabs.nav-stacked > li > a.active > a, #main-nav.nav-tabs.nav-stacked > li > a:hover > span{
            color: #FFF;
        }
        #main-nav.nav-tabs.nav-stacked > li{
            margin-bottom: 4px;
        }
        .secondmenu a{
            font-size: 10px;
            color: #4A515B;
            text-align: center;
        }
        .navbar-static-top{
            background-color: #212121;
            margin-bottom: 5px;
        }
        .navbar-brand{
            background: url(" ") no-repeat 10px 8px;
            display: inline-block;
            vertical-align: middle;
            padding-left: 50px;
            color: #fff;
        }
        .form-control1 {
            width: 30%;
            height: 34px;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
    </style>
</head>


<%--style="background-color: #dee2e6"--%>
<!-- jQuery文件务必在bootstrap.min.js 之前引入 -->
<script src="/bootstrap/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/bootstrap/js/bootstrap.min.js"></script>
<script src="/bootstrap/js/sweetalert.min.js"></script>
<script src="/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">工资管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <ul class="nav navbar-nav navbar-right navbar-part1-menu">
            <li>
                <a href="javascript:(0);">欢迎您,<span class="glyphicon glyphicon-user"></span>${username}</a>
            </li>
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">账户管理<span class="caret"></span></a>
                <ul class="dropdown-menu">

                    <li><a href="/loginout.do">退出</a></li>
                </ul>
            </li>
        </ul>
    </div><!-- /.container-fluid -->
</nav>
<div style="width: 100%;margin-top: 5px">
    <div style="width:15%;height:800px;float: left;background-color: #dee2e6">
        <div style="margin-left: 10px;margin-right:10px;">
            <div class="rpw">
                <ul id="main-nav" class="nav nav-tabs nav-stacked">
                    <li class="active">
                        <a href="/Employee/list.do" target="main">
                            <i class="glyphicon glyphicon-th-large"></i>
                            首页
                        </a>
                    </li>
                    <li>
                        <a href="#system" class="nav-header collapsed" data-toggle="collapse">
                            <i class="glyphicon glyphicon-credit-card"></i>
                            工资管理
                            <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                        </a>
                        <ul id="system" class="nav nav-list collapse secondmenu " style="height: 0px;font-size:xx-large">
                            <li><a href="list.do" target="main" style="font-size:12px">   <i class="glyphicon glyphicon-zoom-in"></i>查看工资</a></li>
                            <li><a href="list.do" target="main" style="font-size:12px">   <i class="glyphicon glyphicon-edit"></i>修改工资</a></li>
                            <li><a href="listUserEmployee.do" target="main" style="font-size:12px">   <i class="glyphicon glyphicon-plus-sign"></i>添加工资</a></li>
                        </ul>

                    </li>
                    <li>
                        <a href="listUserEmployee.do" target="main">
                            <i class="glyphicon glyphicon-edit"></i>
                            税率修改
                        </a>
                    </li>
                </ul>
                <div class="col-md-10">

                </div>
            </div>
        </div>
    </div>
    <div style="margin-left:2%;width: 81%;margin-right:2%;height:100%;float: left;">
        <div class="col-sm-10" style="width:100%;">
            <div class="panel panel-default" >
                <div class="panel-heading" style="height:40px;padding:5px;">
                    <ol class="breadcrumb" >
                        <li class="active">菜单</li>
                        <li class="active">添加工资记录</li>
                    </ol>
                </div>
                <div class="panel-body" style="padding-top:12px;padding-left:20px;border-top: 1px solid #dee2e6;border-radius: 1px">
                    <form:form action="add.do" method="post"  enctype="multipart/form-data">
                        员工工号 <input name="id"  class="form-control1" type="text" value="${user.id}" readonly="readonly" style="background-color: #f0f0f0;"><br><br>
                        员工姓名 <input name="name"  class="form-control1" type="text" value="${user.name}" readonly="readonly" style="background-color: #f0f0f0;"><br><br>
                        所在部门 <input name="dept"  class="form-control1" type="text" value="${user.dept}" readonly="readonly" style="background-color: #f0f0f0;"><br><br>

                        岗位工资 <input name="gwsalary"  class="form-control1" type="text"><br><br>
                        薪级工资 <input name="xjsalary"  class="form-control1" type="text" ><br><br>
                        职务工资 <input name="zwsalary"  class="form-control1" type="text" ><br><br>
                        绩效工资 <input name="jxsalary"  class="form-control1" type="text" ><br><br>
                        工资日期<%--dd MM yyyy--%><div class="input-group date form_date col-md-5" style="width:370px" data-date="" data-date-format="yyyy-mm" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
                        <input class="form-control" size="16" type="text" name="date" readonly>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                    </div>
                        <input type="hidden" id="dtp_input2" value="" /><br>
                        <div class="form-group" style="float: left;margin-left: 70px">
                            <button type="submit" style="float:left;width:68px;height:35px;color:white;background:limegreen;border-radius: 10%;font-size:15px;border:0;margin-left: 6%;"><span class="glyphicon glyphicon-edit">添加</span></button>
                        </div>
                        <div class="form-group" style="float: left;margin-left: 40px">
                            <a href="listUserEmployee.do" ><button type="button" style="float:left;width:68px;height:35px;color:white;background:#00BFFF;border-radius: 10%;font-size:15px;border:0;margin-left: 6%;"><span class="glyphicon glyphicon-arrow-left">返回</span></button>
                            </a></form><br>
                        </div>
                    </form:form>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
<script src="../bootstrap/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
    $('.form_date').datetimepicker({
        language:  'zh-CN',
        weekStart: 1,
        todayBtn:  0,
        autoclose: 1,
        todayHighlight: 1,
        startView: 3,
        minView: 3,
        forceParse: 0
    });
    function f(id){
        swal({
            title: "操作提示",      //弹出框的title
            text: "确定删除吗？",   //弹出框里面的提示文本
            type: "warning",        //弹出框类型
            showCancelButton: true, //是否显示取消按钮
            confirmButtonColor: "#FF0000",//确定按钮颜色
            cancelButtonText: "取消",//取消按钮文本
            confirmButtonText: "是的，确定删除！",//确定按钮上面的文档
            closeOnConfirm: false
        }, function (isConfirm) {
            if(isConfirm) {
                setTimeout(function (){window.open("delete.do?id="+id,"_self")},1000);
                swal({
                    title: "操作成功",      //弹出框的title
                    text: "已成功删除",   //弹出框里面的提示文本
                    type: "success" ,      //弹出框类型
                    isConfirm:true
                })
                $('button:contains("OK")').click(function () {
                    location.href='login.jsp'
                })
                /*.then (function(){
                    window.location ="delete.do?id="+id+"";
                    });*/

            }
        });
    }
</script>
</html>

