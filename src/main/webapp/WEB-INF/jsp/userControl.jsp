<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/8
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cinema Pro管理</title>
    <!-- Bootstrap Styles-->
    <link href="static/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="static/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <link href="static/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="static/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<c:if test="${not empty alert}">
    <script>
        alert('${alert}');
        <c:remove var="alert" scope="session"></c:remove>
    </script>
</c:if>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${ctx}/center">后台管理</a>
        </div>

        <ul class="nav navbar-top-links navbar-right">
            <!-- /.dropdown -->
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                    hello,{${user.nickname}}<i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> 管理员权限(${user.status})</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> 更改个人信息</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="${ctx}/adminQuit"><i class="fa fa-sign-out fa-fw"></i> 注销</a>
                    </li>
                </ul>
                <!-- /.dropdown-user -->
            </li>
            <!-- /.dropdown -->
        </ul>
    </nav>
    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a href="${ctx}/center"><i class="fa fa-dashboard"></i> 首页</a>
                </li>
                <li>
                    <a href="${ctx}/setindex"><i class="fa fa-desktop"></i> 主页显示管理</a>
                </li>
                <li>
                    <a href="${ctx}/setmovie"><i class="fa fa-table"></i>电影管理</a>
                </li>
                <li>
                    <a href="${ctx}/setplan"><i class="fa fa-qrcode"></i> 排片管理</a>
                </li>

                <li>
                    <a href="${ctx}/orderControl" ><i class="fa fa-table"></i>订单管理</a>
                </li>

                <li>
                    <a href="#" class="active-menu"><i class="fa fa-sitemap"></i> 用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level collapse in">
                        <li>
                            <a href="${ctx}/user?method=1">普通用户</a>
                        </li>
                        <li>
                            <a href="${ctx}/user?method=2">管理员用户</a>
                        </li>
                    </ul>
                </li>
            </ul>

        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">


            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        Cinema Pro <small>用户管理</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <c:if test="${method==1}">
                <form action="${ctx}/getuser">
                    <label>使用用户名查询账号</label>
                    <input type="text" required="required" name="username">
                    <input type="submit" value="查询">
                </form>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>uid</th>
                        <th>用户名</th>
                        <th>昵称</th>
                        <th>电话</th>
                        <th>email</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.uid}</td>
                            <td>${user.username}</td>
                            <td>${user.nickname}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <c:choose>
                                <c:when test="${user.status==-1}">
                                    <td>正常</td>
                                </c:when>
                                <c:otherwise>
                                    <td>封禁</td>
                                </c:otherwise>
                            </c:choose>
                                <td>
                                    <c:choose>
                                    <c:when test="${user.status==-1}">
                                    <a href="${ctx}/ban?username=${user.username}" class="btn btn-default">封禁</a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="${ctx}/unban?username=${user.username}" class="btn-danger">解封</a>
                                    </c:otherwise>
                                    </c:choose>
                                    <a href="${ctx}/reset?username=${user.username}" class="btn-block">重设密码</a>
                                </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <center>
                    <c:if test="${currentPage == 1}">
                        <span class="disabled"><< 前一页</span>
                    </c:if>
                    <c:if test="${currentPage != 1}">
                        <a href="${ctx}/orderControl?page=${currentPage-1}"><< 前一页</a>
                    </c:if>
                    <c:if test="${currentPage == 1}">
                        <span class="current">1</span>
                    </c:if>
                    <c:if test="${currentPage != 1}">
                        <a href="${ctx}/orderControl?page=1">1</a>
                    </c:if>

                    <%
                        int pageTimes = (Integer)session.getAttribute("pageTimes");
                        for(int i=1;i<pageTimes;i++)
                        {
                            request.setAttribute("page", i+1);
                    %>
                    <c:if test="${currentPage == page}">
                        <span class="current"><%=i+1%></span>
                    </c:if>
                    <c:if test="${currentPage != page}">
                        <a href="${ctx}/orderControl?page=<%=i+1%>"><%=i+1%></a>
                    </c:if>
                    <%} %>

                    <c:if test="${currentPage == pageTimes}">
                        <span class="disabled">后一页 >></span>
                    </c:if>
                    <c:if test="${currentPage != pageTimes}">
                        <a href="${ctx}/orderControl?page=${currentPage+1}">后一页 >></a>
                    </c:if>
                </center>
            </c:if>
            </div>
            <div class="row">

                <c:if test="${method==2}">

                    <h4>增加新的管理员</h4>
                    <form action="${ctx}/adminins">
                        username:<input type="text" value="" name="username" placeholder="账户" required="required"><br>
                        password:<input type="password" value="" name="password" placeholder="密码" required="required"><br>
                        nickname:<input type="text" value="" name="nickname" placeholder="昵称" required="required"><br>
                        phone:<input type="text" value="" name="phone" placeholder="电话" required="required"><br>
                        email:<input type="email" value="" name="email" placeholder="邮箱" required="required"><br>
                        <input type="hidden" value="1" name="status">
                        <input type="submit" value="增加">
                    </form>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>uid</th>
                        <th>用户名</th>
                        <th>昵称</th>
                        <th>电话</th>
                        <th>email</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.uid}</td>
                            <td>${user.username}</td>
                            <td>${user.nickname}</td>
                            <td>${user.phone}</td>
                            <td>${user.email}</td>
                            <td>管理员</td>
                            <td>
                                <a href="${ctx}/deladmin?uid=${user.uid}" class="btn-danger">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <center>
                    <c:if test="${currentPage == 1}">
                        <span class="disabled"><< 前一页</span>
                    </c:if>
                    <c:if test="${currentPage != 1}">
                        <a href="${ctx}/orderControl?page=${currentPage-1}"><< 前一页</a>
                    </c:if>
                    <c:if test="${currentPage == 1}">
                        <span class="current">1</span>
                    </c:if>
                    <c:if test="${currentPage != 1}">
                        <a href="${ctx}/orderControl?page=1">1</a>
                    </c:if>

                    <%
                        int pageTimes = (Integer)session.getAttribute("pageTimes");
                        for(int i=1;i<pageTimes;i++)
                        {
                            request.setAttribute("page", i+1);
                    %>
                    <c:if test="${currentPage == page}">
                        <span class="current"><%=i+1%></span>
                    </c:if>
                    <c:if test="${currentPage != page}">
                        <a href="${ctx}/orderControl?page=<%=i+1%>"><%=i+1%></a>
                    </c:if>
                    <%} %>

                    <c:if test="${currentPage == pageTimes}">
                        <span class="disabled">后一页 >></span>
                    </c:if>
                    <c:if test="${currentPage != pageTimes}">
                        <a href="${ctx}/orderControl?page=${currentPage+1}">后一页 >></a>
                    </c:if>
                </center>
            </c:if>


            </div>
            <!-- /. ROW  -->

            <div class="row">
            </div>
            <!-- /. ROW  -->
        </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="static/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="static/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="static/assets/js/jquery.metisMenu.js"></script>
<!-- Morris Chart Js -->
<script src="static/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="static/assets/js/morris/morris.js"></script>
<!-- Custom Js -->
<script src="static/assets/js/custom-scripts.js"></script>


</body>

</html>
