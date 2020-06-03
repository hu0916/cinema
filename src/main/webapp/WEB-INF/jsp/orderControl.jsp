<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/7
  Time: 0:52
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
<c:if test="${not empty alert}">
    <script>
        alert('${alert}');
        <c:remove var="alert" scope="session"></c:remove>
        window.location.reload();
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
                    <a href="#" class="active-menu"><i class="fa fa-table"></i>订单管理</a>
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
                        Cinema Pro <small>后台管理</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">

                <form action="${ctx}/queryorder">
                    <label>使用订单号查询订单</label>
                    <input type="text" required="required" name="order_id">
                    <input type="submit" value="查询">
                </form>

                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>订单ID</th>
                        <th>电影名</th>
                        <th>订单详情</th>
                        <th>放映厅类型</th>
                        <th>电影开始时间</th>
                        <th>电影结束时间</th>
                        <th>商品数</th>
                        <th>订单创建时间</th>
                        <th>订单状态</th>
                        <th>订单总价</th>
                        <th>用户id</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${orders}">
                            <tr>
                                <td>${order.order_id}</td>
                                <td>${order.movie_name}</td>
                                <td>${order.order_product}</td>
                                <td>${order.hall_type}</td>
                                <td>${order.start_time}</td>
                                <td>${order.end_time}</td>
                                <td>${order.order_number}</td>
                                <td>${order.create_time}</td>
                                <c:choose>
                                    <c:when test="${order.order_status==1}">
                                        <td>已支付</td>
                                    </c:when>
                                    <c:when test="${order.order_status==0}">
                                        <td>待支付</td>
                                    </c:when>
                                    <c:when test="${order.order_status==2}">
                                        <td>等待处理</td>
                                    </c:when>
                                    <c:when test="${order.order_status==3}">
                                        <td>取消</td>
                                    </c:when>
                                    <c:when test="${order.order_status==4}">
                                        <td>关闭</td>
                                    </c:when>
                                    <c:when test="${order.order_status==6}">
                                        <td>用户删除</td>
                                    </c:when>
                                    <c:otherwise>
                                        <td>完成</td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${order.order_price}</td>
                                <td>${order.user_id}</td>
                                <td>
                                    <a href="${ctx}/delorder.do?id=${order.id}" class="btn btn-default">删除</a>
                                    <a href="${ctx}/orderchange?id=${order.id}&type=4" class="btn-danger">退款</a>
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
            </div>


            <div class="row">



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