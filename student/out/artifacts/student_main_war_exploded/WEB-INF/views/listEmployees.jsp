<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/10/12
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <div style="width:15%;height:100%;float: left;background-color: #dee2e6">
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
                        <ul id="system" class="nav nav-list collapse secondmenu" style="font-size:12px">
                            <li><a href="list.do" target="main" style="font-size:12px"><i class="glyphicon glyphicon-zoom-in"></i>查看工资</a></li>
                            <li><a href="update.do" target="main" style="font-size:12px"><i class="glyphicon glyphicon-edit"></i>修改工资</a></li>
                            <li><a href="listUserEmployee.do" target="main" style="font-size:12px"><i class="glyphicon glyphicon-plus-sign"></i>添加工资</a></li>
                        </ul>

                    </li>
                    <li>
                        <a href="listSl.do" target="main">
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
    <div style="margin-left:2%;width: 81%;margin-right:2%;heigth:100%;float: left;">
        <div class="col-sm-10" style="width:100%;">
            <div class="panel panel-default">
                <div class="panel-heading" style="height:40px;padding:5px" >
                    <ol class="breadcrumb">
                        <li class="active">菜单
                        </li>
                        <li class="active">员工工资信息
                        </li>
                    </ol>
                </div>
                <div class="panel-body" style="height:50px;padding:9px;line-height: 10px;">
                    <form role="form" class="form-inline" action="listOne.do">
                        <div class="form-group">
                            工号
                            <input type="text" class="form-control" id="name" placeholder="请输入工号" name="id" style="height:28px;width:180px">
                        </div>&nbsp;
                        年份
                        <div class="form-group">
                        <div class="input-group date form_date col-md-5"  data-date="" data-date-format="yyyy" data-link-field="dtp_input2" data-link-format="yyyy" style="width: 150px;">
                            <input class="form-control" size="38" type="text" name="year" readonly style="background-color:#fff;height:28px">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                    </div>&nbsp;
                        月份
                        <div class="form-group">
                            <select name="mon" class="form-control" style="height:28px;padding-left: 10px;padding-top: 4px;width: 80px;">
                                <option value=""></option>
                                <option value="01">01</option>
                                <option value="02">02</option>
                                <option value="03">03</option>
                                <option value="04">04</option>
                                <option value="05">05</option>
                                <option value="06">06</option>
                                <option value="07">07</option>
                                <option value="08">08</option>
                                <option value="09">09</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <button type="submit" style="float:left;width:68px;height:28px;padding:6px;padding-top: 3px;color:white;background:#00bbee;border-radius: 6px;font-size:15px;border:0;margin-left: 20%;text-align: center"><span class="glyphicon glyphicon-search">查询</span></button>
                        </div>
                        <div class="form-group">
                            <a href="listUserEmployee.do"><div  style="margin-left:5px;float:left;width:70px;height:30px;padding:6px;color:white;background:orange;border-radius: 6px;font-size:15px;border:0;margin-left: 320px;text-align: center"><span class="glyphicon glyphicon-plus-sign">添加</span></div></a>
                        </div>
                    </form>
                </div>
            </div>
            <table class="table table-striped" style="border: 1px solid #dee2e6">
                <tr style="border: 1px solid #dee2e6">
                    <th>工号</th>
                    <th>姓名</th>
                    <th>岗位工资</th>
                    <th>薪级工资</th>
                    <th>职务津贴</th>
                    <th>绩效工资</th>
                    <th>应发工资</th>
                    <th>个人所得税</th>
                    <th>实发工资</th>
                    <th>工资日期</th>
                    <th style="text-align: center">操作</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="employee">
                    <tr style="border: 1px solid #dee2e6">
                        <td>${employee.id}</td>
                        <td>${employee.name}</td>
                        <td>${employee.gwsalary}元</td>
                        <td>${employee.xjsalary}元</td>
                        <td>${employee.zwsalary}元</td>
                        <td>${employee.jxsalary}元</td>
                        <td>${employee.yfsalary}元</td>
                        <td>${employee.grsds}元</td>
                        <td>${employee.sfsalary}元</td>
                        <td>${employee.date}</td>
                        <td style="text-align:center">
                            <a <%--href=""--%> onclick="f('${employee.id}','${employee.date}')"><div  style="float:left;width:58px;height:30px;padding-top: 5px;color:white;background:red;border-radius: 10%;font-size:15px;border:0;margin-left: 6%"><span class="glyphicon glyphicon-minus">删除</span></div></a>
                            &nbsp;&nbsp;&nbsp;<a href="toUpdate.do?id=${employee.id}&date=${employee.date}"><div  style="float:left;width:58px;height:30px;padding-top:5px;color:white;background:limegreen;border-radius: 10%;font-size:15px;border:0;margin-left: 6%"><span class="glyphicon glyphicon-edit">修改</span></div></a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="row">
                <div class="col-md-6">
                    第${pageInfo.pageNum}页，共${pageInfo.pages}页，共${pageInfo.total}条记录
                </div>
                <div class="col-md-6 offset-md-4">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination pagination-sm">
                            <li class="page-item"><a class="page-link" href="list.do?page=1">首页</a></li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="list.do?page=${pageInfo.pageNum-1}">上一页</a></li>
                            </c:if>
                            <c:forEach items="${pageInfo.navigatepageNums}" var="page">
                                <c:if test="${page==pageInfo.pageNum}">
                                    <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                </c:if>
                                <c:if test="${page!=pageInfo.pageNum}">
                                    <li class="page-item"><a class="page-link"
                                                             href="list.do?page=${page}">${page}</a></li>
                                </c:if>
                            </c:forEach>
                            <c:if test="${pageInfo.hasNextPage}">
                                <li class="page-item"><a class="page-link"
                                                         href="list.do?page=${pageInfo.pageNum+1}">下一页</a></li>
                            </c:if>
                            <li class="page-item"><a class="page-link" href="list.do?page=${pageInfo.pages}">末页</a>
                            </li>
                        </ul>
                    </nav>
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
        todayBtn:  1,
        autoclose: 1,
        todayHighlight: 1,
        startView: 4,
        minView: 4,
        forceParse: 0
    });
    function f(id,date){
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
                setTimeout(function (){window.open("delete.do?id="+id+"&date="+date,"_self")},1000);
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

