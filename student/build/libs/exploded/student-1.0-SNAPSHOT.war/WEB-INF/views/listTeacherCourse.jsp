<%@page pageEncoding="UTF-8"%>
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
        <td>course name</td>
    </tr>
    <c:forEach items="${teacher.courses}" var="course">
        <tr>
            <td>${course.id}</td>
            <td>${course.name}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>