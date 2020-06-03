<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/26
  Time: 14:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>电影管理界面</title>
    <!-- Bootstrap Styles-->
    <link href="static/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="static/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="static/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="static/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
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
                    <a href="${ctx}/setindex"><i class="fa fa-desktop"></i>主页显示管理</a>
                </li>
                <li>
                    <a href="#" class="active-menu"><i class="fa fa-table"></i>电影管理</a>
                </li>
                <li>
                    <a href="${ctx}/setplan"><i class="fa fa-qrcode"></i> 排片管理</a>
                </li>
                <li>
                    <a href="${ctx}/orderControl"><i class="fa fa-table"></i>订单管理</a>
                </li>

                <li>
                    <a href="#"><i class="fa fa-sitemap"></i> 用户管理<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
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
    <div id="page-wrapper" >
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        电影管理<small>Movie Pro</small><br>
                        (删除首页上映电影会影响首页,也会影响放映计划)
                    </h1>

                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <a href="${ctx}/insertmovie" class="btn btn-success btn-lg">添加新电影</a>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        电影列表  共${movieSize}条记录
                    </div>

                    <div class="panel-body">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>电影id</th>
                                <th>电影名</th>
                                <th>上映时间</th>
                                <th>电影时长</th>
                                <th>电影票价</th>
                                <th>电影评分</th>
                                <th>电影状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="movie" items="${movies}">
                            <tr>
                                <td>${movie.movie_id}</td>
                                <td>${movie.movie_name}</td>
                                <td>${movie.movie_time}</td>
                                <td>${movie.movie_showtime}</td>
                                <td>${movie.movie_price}</td>
                                <td>${movie.movie_stars}</td>
                                <c:choose>
                                    <c:when test="${movie.movie_status==1}">
                                        <td>上映中</td>
                                    </c:when>
                                    <c:when test="${movie.movie_status==2}">
                                        <td>待上映</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>库中</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>
                                    <a href="${ctx}/moviechange?id=${movie.movie_id}" class="btn btn-default">修改</a><a href="${ctx}/delete.do?id=${movie.movie_id}" class="btn btn-danger">删除</a>
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
                            <a href="${ctx}/setmovie?page=${currentPage-1}"><< 前一页</a>
                        </c:if>
                        <c:if test="${currentPage == 1}">
                            <span class="current">1</span>
                        </c:if>
                        <c:if test="${currentPage != 1}">
                            <a href="${ctx}/setmovie?page=1">1</a>
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
                            <a href="${ctx}/setmovie?page=<%=i+1%>"><%=i+1%></a>
                        </c:if>
                        <%} %>

                        <c:if test="${currentPage == pageTimes}">
                            <span class="disabled">后一页 >></span>
                        </c:if>
                        <c:if test="${currentPage != pageTimes}">
                            <a href="${ctx}/setmovie?page=${currentPage+1}">后一页 >></a>
                        </c:if>
</center>
                    </div>

                    </div>
            </div>



        </div>
        </div>
    </div>
    <!-- /. PAGE INNER  -->
</div>
<!-- /. PAGE WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="static/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="static/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="static/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="static/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="static/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="static/assets/js/custom-scripts.js"></script>


</body>
</html>
