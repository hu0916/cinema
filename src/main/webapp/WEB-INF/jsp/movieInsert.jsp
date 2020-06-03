<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/26
  Time: 18:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/26
  Time: 15:51
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
                    <a href="${ctx}/setmovie" class="active-menu"><i class="fa fa-table"></i>电影管理</a>
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
                        电影管理<small>Movie Pro</small>
                    </h1>
                </div>
            </div>
            <!-- /. ROW  -->

            <div class="row">
                <form action="${ctx}/insertmovie.do" method="post" enctype="multipart/form-data" id="form">
                    <label>电影名</label><input type="text" value="" name="movie_name" id="name"><br>
                    <label>上映时间</label><input type="text"  name="movie_time" id="time" readonly><br>
                    <label>电影时长(分钟,整数)</label><input type="text" value="" name="movie_showtime" id="showtime"><br>
                    <label>电影票价</label><input type="text" value="" name="movie_price" id="price"><br>
                    <label>电影评分</label><input type="text" value="" name="movie_stars" id="stars"><br>
                    <label>电影类型</label><select id="type" name="movie_type">
                        <option value="1">喜剧</option>
                        <option value="2">文艺片</option>
                        <option value="3">动作片</option>
                        <option value="4">动画片</option>
                </select><br>
                    <label>电影状态1上映2待上映3库中（下映）4待选</label><input type="text" value="4" name="movie_status" id="status" readonly><br>
                    <label>电影介绍</label><input type="text" value="" name="movie_introduce" id="introduce"><br>
                    <label>海报</label><input type="file" name="upload"> 20M以下<br>
                    <button type="submit" class="btn btn-default">提交</button>
                    <input type="reset" class="btn btn-default" value="重置"/>
                </form>
                ${uploadFileError}

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
<script type="text/javascript" src="static/js/jquery.validate.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="static/js/validate-methods.js" charset="UTF-8"></script>
<%--<script type="text/javascript" src="static/js/messages_zh.min.js" type="text/javascript" charset="UTF-8"></script>--%>
<!-- Bootstrap Js -->
<script src="static/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="static/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="static/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="static/assets/js/dataTables/dataTables.bootstrap.js"></script>
<%--<script>--%>
<%--$(document).ready(function () {--%>
<%--$('#dataTables-example').dataTable();--%>
<%--});--%>
<%--</script>--%>
<!-- Custom Js -->
<script src="static/assets/js/custom-scripts.js"></script>
<%--时间插件--%>
<link rel="stylesheet" type="text/css" href="static/css/jquery-ui.css" />
<script type="text/javascript" src="static/js/jquery-ui-1.10.4.custom.min.js" charset="UTF-8"></script>
<%--<script type="text/javascript" src="static/js/jquery.ui.datepicker-zh-CN.js" charset="UTF-8"></script>--%>
<script type="text/javascript" src="static/js/jquery-ui-timepicker-addon.js" charset="UTF-8"></script>
<%--<script type="text/javascript" src="static/js/jquery-ui-timepicker-zh-CN.js" charset="UTF-8"></script>--%>

<%--<script>--%>
    <%--$(document).ready(function () {--%>
        <%--$('#dataTables-example').dataTable();--%>
    <%--});--%>
<%--</script>--%>
<!-- Custom Js -->
<script src="static/assets/js/custom-scripts.js"></script>


<script>
    $( "input[name='movie_time']" ).datetimepicker({
        language: 'zh-CN',dateFormat: "yy-mm-dd"});


    var time=$('#time');
    time.change(function () {
        newtime=time.val()+':00';
        time.val(newtime);
    })

</script>
<script>

    $('#form').validate(
        {
            rules:{
                movie_showtime:{
                    required:true,
                    digits:true
                },
                movie_stars:{
                    required:true,
                    range:[1,5]
                },
                movie_price:{
                    required:true,
                    number:true
                },
                movie_name:{
                    required:true
                },
                movie_introduce:{
                    required:true
                },
                upload:{
                    required:true
                },
                movie_time:{
                    required:true
                }
            },
            submitHandler:function (form) {
                form.submit();
            }
        }
    )
</script>

</body>
</html>


