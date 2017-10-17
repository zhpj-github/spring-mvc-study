<%--
  Created by IntelliJ IDEA.
  User: zpj-pc
  Date: 2017-10-17
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表</title>
    <script type="application/javascript" src="/status/js/jquery-3.1.1.js"></script>
    <script type="application/javascript" src="/status/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="/status/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="/status/css/bootstrap-theme.css"/>
    <script>
        $(function () {
            /*
            * 这种方式把a标签做post提交不好使，仍然会触发get请求
            * */
//            $(".delete").click(function () {
//                var href=$(this).attr("href");
//                $("form").attr("action",href).submit();
//            })

            return false;
        })

        function submit(href) {
            $("form").attr("action",href).submit();
        }
    </script>
</head>
<body>
<form action="" method="post">
    <input type="hidden" name="_method" value="DELETE">
</form>
<div class="table-responsive">
    <table class="table table-striped">
        <thead>
        <th>
            <tr>
                <td>ID</td>
                <td>编号</td>
                <td>姓名</td>
                <td>部门</td>
                <td>备注</td>
                <td>操作</td>
            </tr>
        </th>
        </thead>
        <tbody>
        <c:forEach var="employee" items="${persons}">
            <tr>
                <td>${employee.id}</td>
                <td>${employee.no}</td>
                <td>${employee.name}</td>
                <td>${employee.department.departmentName}</td>
                <td>${employee.note}</td>
                <td>
                    <a href="employee/${employee.id}">编辑</a>
                    <a class="delete" href="#" onclick="submit('employee/${employee.id}')">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a href="employee">添加员工</a>
</div>
</body>
</html>
