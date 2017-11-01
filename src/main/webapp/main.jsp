<%--
  Created by IntelliJ IDEA.
  User: zpj-pc
  Date: 2017-11-01
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <title>main</title>
    <script type="application/javascript" src="${APP_PATH}/static/js/jquery-3.1.1.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/js/vue.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/js/vue-resource.js"></script>
    <script type="application/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7/css/bootstrap.css"/>
    <script type="application/javascript">

    </script>
</head>
<body>
<%--<div class="container">--%>
    <%--<div class="page-header">--%>
        <%--<h4>大标题</h4>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
        <%--<ol class="breadcrumb">--%>
            <%--<li><a href="#">Home</a></li>--%>
            <%--<li><a href="#">Library</a></li>--%>
            <%--<li class="active">Data</li>--%>
        <%--</ol>--%>
    <%--</div>--%>
    <%--<div class="row">--%>
    <%--<div class="col-md-3">--%>
        <%--<ul class="nav nav-pills nav-stacked">--%>
            <%--<li role="presentation" class="active"><a href="#">Home</a></li>--%>
            <%--<li role="presentation"><a href="#">Profile</a></li>--%>
            <%--<li role="presentation"><a href="#">Messages</a></li>--%>
        <%--</ul>--%>
    <%--</div>--%>
    <%--<div class="col-md-9">--%>
        <%--<div class="row">--%>
            <%--<div class="jumbotron">--%>
                <%--<h1>Hello, world!</h1>--%>
                <%--<p>...</p>--%>
                <%--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="jumbotron">--%>
                <%--<h1>Hello, world!</h1>--%>
                <%--<p>...</p>--%>
                <%--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="row">--%>
            <%--<div class="jumbotron">--%>
                <%--<h1>Hello, world!</h1>--%>
                <%--<p>...</p>--%>
                <%--<p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="row"></div>--%>
<%--</div>--%>


<div class="container-fluid">
    <div class="row-fluid">
        <div class="col-md-12">
            <h3>
                h3. 这是一套可视化布局系统.
            </h3>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-12">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#">首页</a>
                </li>
                <li>
                    <a href="#">资料</a>
                </li>
                <li class="disabled">
                    <a href="#">信息</a>
                </li>
                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">操作</a>
                        </li>
                        <li>
                            <a href="#">设置栏目</a>
                        </li>
                        <li>
                            <a href="#">更多设置</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">分割线</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-12">
            <div class="row-fluid">
                <div class="col-md-3">
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" class="active"><a href="#">Home</a></li>
                        <li role="presentation"><a href="#">Profile</a></li>
                        <li role="presentation"><a href="#">Messages</a></li>
                    </ul>
                </div>
                <div class="col-md-9">
                    <div class="row-fluid">
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                    </div>
                    <div class="row-fluid">
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                        <div class="col-md-4">
                            <img alt="140x140" src="img/a.jpg" />
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row-fluid">
        <div class="col-md-12">
        </div>
    </div>
</div>

</body>
</html>
