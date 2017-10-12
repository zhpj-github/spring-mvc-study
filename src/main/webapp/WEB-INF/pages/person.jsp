<%--
  Created by IntelliJ IDEA.
  User: zpj-pc
  Date: 2017-09-14
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Person</title>
</head>
<body>
<h1>K</h1>
<div class="table-responsive">
    <table  class="table table-striped">
        <thead>
        <tr>
            <td>ID</td>
            <td>编号</td>
            <td>姓名</td>
            <td>备注</td>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${persons}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.no}</td>
                <td>${employee.name}</td>
                <td>${employee.note}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
