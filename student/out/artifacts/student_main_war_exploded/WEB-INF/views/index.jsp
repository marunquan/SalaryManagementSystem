<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/11/2
  Time: 10:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <div class="login">
        <h1><spring:message code="title"/> </h1>
        <form action="test.do" method="post">
            <input type="text" name="name" placeholder=<spring:message code="username"/> required="required" value=""/>
        </form>
    </div>
</body>
</html>
