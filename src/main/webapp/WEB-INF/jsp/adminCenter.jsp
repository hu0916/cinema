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
                    <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> 首页</a>
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
                        Cinema Pro <small>后台管理</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder bg-color-green">
                        <div class="panel-body">
                            <i class="fa fa-bar-chart-o fa-5x"></i>
                            <h3>${countOrder}</h3>
                        </div>
                        <div class="panel-footer back-footer-green">
                            订单总数

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder bg-color-blue">
                        <div class="panel-body">
                            <i class="fa fa-shopping-cart fa-5x"></i>
                            <h3>${countPrice}</h3>
                        </div>
                        <div class="panel-footer back-footer-blue">
                            今日营业额

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder bg-color-red">
                        <div class="panel-body">
                            <i class="fa fa-camera-retro fa-5x"></i>
                            <h3>${countMovie} </h3>
                        </div>
                        <div class="panel-footer back-footer-red">
                            上映电影数

                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel panel-primary text-center no-boder bg-color-brown">
                        <div class="panel-body">
                            <i class="fa fa-users fa-5x"></i>
                            <h3>${count}</h3>
                        </div>
                        <div class="panel-footer back-footer-brown">
                            注册会员数

                        </div>
                    </div>
                </div>
            </div>


            <div class="row">


                <%--<div class="col-md-9 col-sm-12 col-xs-12">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--Bar Chart Example--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                            <%--<div id="morris-bar-chart"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <%--<div class="col-md-3 col-sm-12 col-xs-12">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--Donut Chart Example--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                            <%--<div id="morris-donut-chart"></div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

            </div>
            <!-- /. ROW  -->

            <div class="row">
                <%--<div class="col-md-4 col-sm-12 col-xs-12">--%>
                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--Tasks Panel--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                            <%--<div class="list-group">--%>

                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">7 minutes ago</span>--%>
                                    <%--<i class="fa fa-fw fa-comment"></i> Commented on a post--%>
                                <%--</a>--%>
                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">16 minutes ago</span>--%>
                                    <%--<i class="fa fa-fw fa-truck"></i> Order 392 shipped--%>
                                <%--</a>--%>
                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">36 minutes ago</span>--%>
                                    <%--<i class="fa fa-fw fa-globe"></i> Invoice 653 has paid--%>
                                <%--</a>--%>
                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">1 hour ago</span>--%>
                                    <%--<i class="fa fa-fw fa-user"></i> A new user has been added--%>
                                <%--</a>--%>
                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">1.23 hour ago</span>--%>
                                    <%--<i class="fa fa-fw fa-user"></i> A new user has added--%>
                                <%--</a>--%>
                                <%--<a href="#" class="list-group-item">--%>
                                    <%--<span class="badge">yesterday</span>--%>
                                    <%--<i class="fa fa-fw fa-globe"></i> Saved the world--%>
                                <%--</a>--%>
                            <%--</div>--%>
                            <%--<div class="text-right">--%>
                                <%--<a href="#">More Tasks <i class="fa fa-arrow-circle-right"></i></a>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>
                <%--<div class="col-md-8 col-sm-12 col-xs-12">--%>

                    <%--<div class="panel panel-default">--%>
                        <%--<div class="panel-heading">--%>
                            <%--Responsive Table Example--%>
                        <%--</div>--%>
                        <%--<div class="panel-body">--%>
                            <%--<div class="table-responsive">--%>
                                <%--<table class="table table-striped table-bordered table-hover">--%>
                                    <%--<thead>--%>
                                    <%--<tr>--%>
                                        <%--<th>S No.</th>--%>
                                        <%--<th>First Name</th>--%>
                                        <%--<th>Last Name</th>--%>
                                        <%--<th>User Name</th>--%>
                                        <%--<th>Email ID.</th>--%>
                                    <%--</tr>--%>
                                    <%--</thead>--%>
                                    <%--<tbody>--%>
                                    <%--<tr>--%>
                                        <%--<td>1</td>--%>
                                        <%--<td>John</td>--%>
                                        <%--<td>Doe</td>--%>
                                        <%--<td>John15482</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>2</td>--%>
                                        <%--<td>Kimsila</td>--%>
                                        <%--<td>Marriye</td>--%>
                                        <%--<td>Kim1425</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>3</td>--%>
                                        <%--<td>Rossye</td>--%>
                                        <%--<td>Nermal</td>--%>
                                        <%--<td>Rossy1245</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>4</td>--%>
                                        <%--<td>Richard</td>--%>
                                        <%--<td>Orieal</td>--%>
                                        <%--<td>Rich5685</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>5</td>--%>
                                        <%--<td>Jacob</td>--%>
                                        <%--<td>Hielsar</td>--%>
                                        <%--<td>Jac4587</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>
                                    <%--<tr>--%>
                                        <%--<td>6</td>--%>
                                        <%--<td>Wrapel</td>--%>
                                        <%--<td>Dere</td>--%>
                                        <%--<td>Wrap4585</td>--%>
                                        <%--<td>name@site.com</td>--%>
                                    <%--</tr>--%>

                                    <%--</tbody>--%>
                                <%--</table>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>
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