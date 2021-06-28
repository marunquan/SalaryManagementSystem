<%@page pageEncoding="UTF-8" contentType="text/html; UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <meta charset="utf-8">
    <title> Bootstrap </title>
    <link href="/bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/bootstrap/js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/bootstrap/js/bootstrap.min.js"></script>

<table class="table table-striped">
    <tr>
        <td>id</td>
        <td>名字</td>
        <td>性别</td>
        <td>班级</td>
        <td>生日</td>
        <td>头像</td>
        <td>选课名称 成绩</td>
    </tr>
    <c:forEach items="${pageInfo.list}" var="student">
        <tr>
            <td>${student.id}</td>
            <td>${student.name}</td>
            <td>${student.sex}</td>
            <td>${student.clazz}</td>
            <td>${student.birthday}</td>
            <td>${student.image}</td>
            <td>
                <c:forEach items="${student.scores}" var="sc">
                    <c:out value="${sc.course.name}"/>   <c:out value="${sc.score}"/><br/>
                </c:forEach></td>
            <td><a href="delete.do?id=${student.id}">删除</a>
                <a href="toUpdate.do?id=${student.id}">修改</a>
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
</body>
</html>