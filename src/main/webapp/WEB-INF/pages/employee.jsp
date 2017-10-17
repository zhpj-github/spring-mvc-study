<%--
  Created by IntelliJ IDEA.
  User: zpj-pc
  Date: 2017-10-17
  Time: 21:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户信息</title>
</head>
<body>
<form:form action="${pageContext.request.contextPath}/employee" method="post" modelAttribute="employee">
    <c:if test="${employee.id == null}">
        编号:<form:input path="no"/>
    </c:if>
    <c:if test="${employee.id !=null}">
        编号:<strong>${employee.no}</strong>
        <form:hidden path="id"/>
        <input type="hidden" name="_method" value="PUT">
    </c:if>
    <br>
    姓名:<form:input path="name"/>
    <br>
    部门:<form:select path="departmentId" items="${departments}"
                    itemLabel="departmentName"
                    itemValue="id"/>
    <br>
    备注:<form:input path="note"/>
    <br>
    <input type="submit" value="保存">
</form:form>
</body>
</html>
