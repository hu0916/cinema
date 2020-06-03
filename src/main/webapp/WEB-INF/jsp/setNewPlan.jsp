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

    <link href="static/seats/jquery.seat-charts.css">
    <link rel="stylesheet" type="text/css" href="static/seats/style.css">
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

                <form id="form" action="${ctx}/planInsert">
                    <label style="font-size: 25px">上映的电影名：</label><font>（从数据库中查询上映中）</font><select id="movie_id" name="movie_id"  Onchange="getPrice()">
                    <c:forEach items="${displays}" var="movie">
                        <option value="${movie.movie_id}">${movie.movie_name}</option>
                    </c:forEach>
                </select><br>
                    <label>放映日期：</label><input type="date" id="date" name="play_time" readonly> <br>
                    <label>开始时间：</label><input type="text" id="start_time" name="start_time" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss',onpicked:function(){verify();}})" autocomplete="off"> <span id="warn"></span><br>
                    <label>结束时间：</label><input type="text"  id="end_time" name="end_time" readonly> <br>
                    <label>展映厅名：</label><input type="text" id="hall_place" name="hall_place"><br>
                    <label>展映厅类型：</label><input type="text"  id="hall_type" name="hall_type"><br>
                    <label>放映状态：(1未反映2已放映3取消)</label><input type="text" value="1" name="plan_status" readonly><br>
                    <label>电影票价：</label><input type="text" id="price" name="movie_price" value="${displays[0].movie_price}" readonly><br>
                    <input type="hidden" value="${displays[0].movie_name}" id="movie_name" name="movie_name">
                    <input type="hidden" value="${displays[0].movie_showtime}" id="show_time">

                    <button type="submit" class="btn btn-success btn-lg">提交</button>
                </form>

            </div>


            <div class="row">


            </div>
        <!-- /. PAGE INNER  -->
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>




</div>

</body>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="static/js/jquery-1.11.1.min.js"></script>
<!-- Metis Menu Js -->
<script src="static/assets/js/jquery.metisMenu.js"></script>
<script type="text/javascript" src="static/js/jquery.validate.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="static/js/validate-methods.js" charset="UTF-8"></script>
<!-- Bootstrap Js -->
<script src="static/assets/js/bootstrap.min.js"></script>

<!-- Morris Chart Js -->
<script src="static/assets/js/morris/raphael-2.1.0.min.js"></script>
<script src="static/assets/js/morris/morris.js"></script>


<link rel="stylesheet" type="text/css" href="static/css/jquery-ui.css" />
<script type="text/javascript" src="static/js/jquery-ui-1.10.4.custom.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="static/js/jquery-ui-timepicker-addon.js" charset="UTF-8"></script>

<!-- Custom Js -->
<script src="static/assets/js/custom-scripts.js"></script>

<script src="static/My97DatePicker/WdatePicker.js"></script>



<script>
    var flag=true;
    function getPrice() {
        $.ajax({
            url:'${ctx}/getprice',
            data:"id="+$('#movie_id').val(),
            success:function (data) {
                console.log(data);
                $("#price").val(data[0]);
                $("#movie_name").val($("#movie_id option:selected").text());
                $("#show_time").val(data[1]);
            }
        })
    }

    $('#form').validate(
        {
            rules:{
                play_time:{
                    required:true,
                },
                start_time:{
                    required:true,
                },
                end_time: {
                    required:true,
                },
                hall_place:{
                    required:true,
                },
                hall_type:{
                    required:true,
                },
                movie_price:{
                    required:true
                }
            },
            submitHandler:function (form) {
                if (flag) {
                    form.submit();
                } else {
                    alert("时间段不可用！");
                }
            }
        }
    )

    // $( "input[name='start_time']" ).datetimepicker({
    //     language: 'zh-CN',dateFormat: "yy-mm-dd"});

    function verify() {
        $("#warn").empty();
        var time = $('#start_time');
        var date = {
            "start_time": $("#start_time").val(),
            "show_time": $("#show_time").val()
        }
        // var startDate= startDate.replace(new RegExp("-","gm"),"/");
        // var startDateM = (new Date(startDate)).getTime();
        // alert(startDateM);
        $.ajax({
            url: "${ctx}/verify",
            data: JSON.stringify(date),
            type: "post",
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                flag = true;
                if (data[0] == "false") {
                    console.log("不符合的时间！！！！！");
                    $('#warn').text("不合适的时间");
                    $('#end_time').val('');
                    flag=false;
                }
                if (data[0] == "true") {
                    console.log(data);
                    $("#end_time").val(data[1]);
                    $("#date").val(data[2]);
                }
            }
        })
    }

</script>




</html>