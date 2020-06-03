<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/24
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
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
                    <a href="${ctx}/setplan" class="active-menu"><i class="fa fa-qrcode"></i> 排片管理</a>
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
    <div id="page-wrapper">
        <div id="page-inner">


            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        Cinema Pro <small>排片管理</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">

                <a href="${ctx}/newplan" class="btn btn-success btn-lg">添加新的放映计划</a>



            </div>


            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        放映计划  共${planSize}条记录 (删除即取消计划)
                    </div>

                    <div class="panel-body">

                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>计划ID</th>
                                <th>电影名</th>
                                <th>电影票价</th>
                                <th>放映时间</th>
                                <th>开始时间</th>
                                <th>结束时间</th>
                                <th>放映厅类型</th>
                                <th>放映厅号</th>
                                <th>放映状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="plan" items="${plans}">
                                <tr>
                                    <td>${plan.plan_id}</td>
                                    <td>${plan.movie_name}</td>
                                    <td>${plan.movie_price}</td>
                                    <td>${plan.play_time}</td>
                                    <td>${plan.start_time}</td>
                                    <td>${plan.end_time}</td>
                                    <td>${plan.hall_type}</td>
                                    <td>${plan.hall_place}</td>
                                    <c:choose>
                                        <c:when test="${plan.plan_status==1}">
                                            <td>未放映</td>
                                        </c:when>
                                        <c:when test="${plan.plan_status==2}">
                                            <td>已放映</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>取消</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>
                                        <c:if test="${plan.plan_status==1}"><a href="${ctx}/changeplan?plan_id=${plan.plan_id}" class="btn btn-default">修改</a><a href="${ctx}/deleteplan?plan_id=${plan.plan_id}" class="btn btn-danger">取消</a></c:if>
                                        <c:if test="${empty plan.seat &&plan.plan_status==1}">
                                            <a href="${ctx}/seats?plan_id=${plan.plan_id}" class="btn btn-default">座位设置</a>
                                        </c:if>
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
                                <a href="${ctx}/setplan?page=${currentPage-1}"><< 前一页</a>
                            </c:if>
                            <c:if test="${currentPage == 1}">
                                <span class="current">1</span>
                            </c:if>
                            <c:if test="${currentPage != 1}">
                                <a href="${ctx}/setplan?page=1">1</a>
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
                                <a href="${ctx}/setplan?page=<%=i+1%>"><%=i+1%></a>
                            </c:if>
                            <%} %>

                            <c:if test="${currentPage == pageTimes}">
                                <span class="disabled">后一页 >></span>
                            </c:if>
                            <c:if test="${currentPage != pageTimes}">
                                <a href="${ctx}/setplan?page=${currentPage+1}">后一页 >></a>
                            </c:if>
                        </center>
                    </div>

                </div>
            </div>


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