<%--
  Created by IntelliJ IDEA.
  User: zpj-pc
  Date: 2017-10-21
  Time: 0:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>员工信息</title>
    <script type="application/javascript" src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/js/vue.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/js/vue-resource.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7/css/bootstrap.css"/>
    <script type="application/javascript">
//        $(function () {
//            var vm = new Vue({
//                el: '#app',
//                data: {
//                    res: '',
//                    extend: '',
//                    pageInfo: ''
//                },
//                created:function(){
//                    var then = this;
//                    $.get("/employees", function (result) {
//                        then.res = result;
//                        then.extend = result.extend;
//                        then.pageInfo = result.extend.pageInfo;
//                    })
//                },
//                mounted: {
//                    showData: function (url) {
//                        var then = this;
//                        $.get(url, function (result) {
//                            then.res = result;
//                            then.extend = result.extend;
//                            then.pageInfo = result.extend.pageInfo;
//                        })
//                    },
//                    select: function (evt) {
//                        var _self = this;
//                        _self.showData(evt);
//                    }
//                }
//            })
//        });
//        function query() {
//            vm.showData("/employees");
//        }

    </script>
</head>
<body>
<div class="container" id="app">
    <div class="row">
        <h4 class="col-md-12">{{res.msg}}</h4>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>编号</th>
                <th>姓名</th>
                <th>部门</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <tr v-for="emp in extend.pageInfo.list">
                <td>{{emp.id}}</td>
                <td>{{emp.no}}</td>
                <td>{{emp.name}}</td>
                <td>{{emp.department.departmentName}}</td>
                <td>{{emp.note}}</td>
                <td>
                    <button class="btn btn-primary btn-xs">
                        <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                        编辑
                    </button>
                    <button class="btn btn-danger btn-xs">
                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        删除
                    </button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前第{{pageInfo.pageNum}}页，共{{pageInfo.pages}}页，总共有{{pageInfo.total}}条记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <li v-if="pageInfo.hasPreviousPage">
                        <a :href="'${APP_PATH}/emps?pn='+pageInfo.pageNum-1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li v-for="pageNum in pageInfo.navigatepageNums"
                        v-if="pageNum === pageInfo.pageNum" class="active" >
                        <a :href="'${APP_PATH}/emps?pn='+pageNum">{{pageNum}}</a>
                    </li>
                    <li v-else @click="select($index)">
                        <a :href="'${APP_PATH}/emps?pn='+pageNum">{{pageNum}}</a>
                    </li>

                    <li v-if="pageInfo.hasNextPage">
                        <a :href="'${APP_PATH}/emps?pn='+pageInfo.pageNum+1" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                    <li><a :href="'${APP_PATH}/emps?pn='+pageInfo.pages">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    new Vue({
        el: '#app',
        data: {
            res: '',
            extend: '',
            pageInfo: ''
        },
        created:function(){
            var then = this;
            $.get("/employees", function (result) {
                then.res = result;
                then.extend = result.extend;
                then.pageInfo = result.extend.pageInfo;
            })
        },
        mounted: {
            showData: function (url) {
                var then = this;
                $.get(url, function (result) {
                    then.res = result;
                    then.extend = result.extend;
                    then.pageInfo = result.extend.pageInfo;
                })
            },
            select: function (evt) {
                var _self = this;
                _self.showData(evt);
            }
        }
    })
</script>
</html>
