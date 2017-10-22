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
    <script type="application/javascript" src="${APP_PATH}/static/bootstrap-3.3.7/js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="${APP_PATH}/static/bootstrap-3.3.7/css/bootstrap.css"/>
    <script type="application/javascript">

    </script>
</head>
<body>
<!-- 员工编辑窗体 -->
<div class="modal fade" id="myModal_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="input_no"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input name="name" type="text" class="form-control" id="inputName_update" placeholder="录入姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select name="departmentId" class="form-control">
                                <c:forEach var="dept" items="${depts}">
                                    <option value="${dept.id}">${dept.departmentName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input id="inputNote_update" name="note" type="text" class="form-control" placeholder="录入备注">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update_emp">更新</button>
            </div>
        </div>
    </div>
</div>

<!-- 员工添加窗体 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工信息</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">编号</label>
                        <div class="col-sm-10">
                            <input name="no" type="text" class="form-control" id="inputNo" placeholder="录入编号">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input name="name" type="text" class="form-control" id="inputName" placeholder="录入姓名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-4">
                            <select name="departmentId" class="form-control">
                                <c:forEach var="dept" items="${depts}">
                                <option value="${dept.id}">${dept.departmentName}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">备注</label>
                        <div class="col-sm-10">
                            <input name="note" type="text" class="form-control" id="inputNote" placeholder="录入备注">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save_emp">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <h4 class="col-md-12">所有员工</h4>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-success" id="btnAdd">新增</button>
            <button class="btn btn-danger" id="btnDeleteAll">删除</button>
        </div>
    </div>
    <div class="row">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>
                    <input type="checkbox" id="checkAll">
                </th>
                <th>ID</th>
                <th>编号</th>
                <th>姓名</th>
                <th>部门</th>
                <th>备注</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageInfo.list}" var="emp">
                <tr>
                    <td><input type="checkbox" class="checkItem"></td>
                    <td>${emp.id}</td>
                    <td>${emp.no}</td>
                    <td>${emp.name}</td>
                    <td>${emp.department.departmentName}</td>
                    <td>${emp.note}</td>
                    <td>
                        <button class="btn btn-primary btn-xs edit_btn" curId="${emp.id}">
                            <span class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger btn-xs delete_btn" curId="${emp.id}">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                            删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="row">
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页，共${pageInfo.pages}页，总共有${pageInfo.total}条记录
        </div>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <c:forEach var="pageNum" items="${pageInfo.navigatepageNums}">
                        <c:if test="${pageNum == pageInfo.pageNum}">
                            <li class="active"><a href="#">${pageNum}</a></li>
                        </c:if>
                        <c:if test="${pageNum != pageInfo.pageNum}">
                            <li><a href="${APP_PATH}/emps?pn=${pageNum}">${pageNum}</a></li>
                        </c:if>
                    </c:forEach>
                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${APP_PATH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${APP_PATH}/emps?pn=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
<script type="application/javascript">
    function reset_form(elm) {
        $(elm)[0].reset();
        $(elm).find("*").removeClass("has-success has-error");
        $(elm).find(".help-block").text("");
    }
    
    $("#btnAdd").click(function () {
        reset_form("#myModal form");
        getDepartments();

        $('#myModal').modal({
            backdrop:'static'
        });
    });

    function getDepartments() {
        <%--$.get("${APP_PATH}/depts",function (result) {--%>
            <%--//console.log(result);--%>
            <%--//{"code":"1","msg":"成功","extend":--%>
            <%--// {"depts":--%>
            <%--// [{"id":1,"departmentName":"研发部","note":null}]--%>
            <%--// }--%>
            <%--//}--%>
            <%--var depts = result.extend.depts;--%>
        <%--});--%>
    }

    function validate_form() {
        var empNo=$("#inputNo").val();
        var regNo=/^[a-zA-Z0-9_-]{6,16}$/;
        //alert(regNo.test(empNo));
        if(!regNo.test(empNo)){
            show_validate_info("#inputNo",false,'编号非法');
            return false;
        }else {
            show_validate_info("#inputNo",true,"");
        }
        return false;
    }
    function show_validate_info(elm,status,msg) {
        $(elm).parent().removeClass('has-success has-error');
        $(elm).next('span').text('');
        if(status){
            $(elm).parent().addClass('has-success');
        }else {
            $(elm).parent().addClass('has-error');
        }
        $(elm).next('span').text(msg);

    }

    $("#inputNo").change(function () {
        var empNo=this.value;

        $.post("${APP_PATH}/checkUser","empNo="+empNo,function (result) {
            if(result.code==1){
                show_validate_info("#inputNo",true,result.code);
                $("#save_emp").attr("check","ture");
            }else {
                show_validate_info("#inputNo",false,result.code);
                $("#save_emp").attr("check","false");
            }
        });
    });

    $("#save_emp").click(function () {
        //alert($("#myModal form").serialize());
        if($(this).attr("check")=="false"){
            return false;
        }
        if(!validate_form()){
            return false;
        }
        $.post("/emp",$("#myModal form").serialize(),function (result) {
            if(result.code=1){
                $('#myModal').modal('hide');
                <%--$.get('/emps?pn=${pageInfo.total}');--%>
                location.replace('${APP_PATH}/emps?pn=${pageInfo.total}');
            }else {
                if(undefined==result.extend.errors.no){

                }
                console.log(result.extend.errors.no);
            }
        });
    });
    //编辑按钮单击事件
    $(document).on("click",".edit_btn",function () {
        var id = $(this).attr("curId");
        editEmp(id);
        $("#update_emp").attr("edit-id",id);
        $("#myModal_update").modal({
            backdrop:'static'
        });
    })

    //单击事件
    function editEmp(id){
        $.get("${APP_PATH}/emp/"+id,function (result) {
            var emp = result.extend.emp;
            $("#input_no").text(emp.no);
            $("#inputName_update").val(emp.name);
            $("#myModal_update select").val([emp.departmentId]);
            $("#inputNote_update").val(emp.note);
        })

    }
    $("#update_emp").click(function () {
        $.ajax({
            url:"${APP_PATH}/emp/"+$(this).attr("edit-id"),
            type:"PUT",
            data:$("#myModal_update form").serialize(),
            success:function (result) {
                $('#myModal_update').modal('hide');
                location.replace('${APP_PATH}/emps?pn=${pageInfo.pageNum}');
            }
        });
    });

    //每次隐藏时，清除数据。确保点击时，重新加载
    $("#myModal_update").on("hidden.bs.modal", function() {
        $(this).removeData("bs.modal");
    });
    //单个删除按钮单击事件
    $(document).on("click",".delete_btn",function () {
        var id = $(this).attr("curId");
        var empName = $(this).parents("tr").find("td:eq(3)").text();
        if(confirm("delete["+empName+"]?")){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"DELETE",
                success:function (result) {
                    location.replace('${APP_PATH}/emps?pn=${pageInfo.pageNum}');
                }
            });
        }
    });

    $("#checkAll").click(function () {
        //使用attr()获取 checked 属性，未定义时返回undefined，应使用dom原生属性prop获取
        //alert($("#checkAll").prop("checked"));
        $(".checkItem").prop("checked",$("#checkAll").prop("checked"));
    });
    $(document).on("click",".checkItem",function () {
        var flag = $(".checkItem:checked").length===$(".checkItem").length;
        $("#checkAll").prop("checked",flag);

    });
    $("#btnDeleteAll").click(function () {
        var names="";
        var del_ids="";
        $.each($(".checkItem:checked"),function () {
            names += $(this).parents("tr").find("td:eq(3)").text()+",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
        })
        if(confirm("delete["+names.substring(0,names.length-1)+"]?")){
            $.ajax({
                url:"${APP_PATH}/emp/"+del_ids.substring(0,del_ids.length-1),
                type:"DELETE",
                success:function (result) {
                    location.replace('${APP_PATH}/emps?pn=${pageInfo.pageNum}');
                }
            });
        }
    });
</script>
</html>
