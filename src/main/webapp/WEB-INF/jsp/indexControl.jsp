<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/24
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>前台首页管理</title>
    <!-- Bootstrap Styles-->
    <link href="static/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="static/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="static/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <link href="static/css/style.css"rel="stylesheet"/>
    <!-- jQuery Js -->
    <script src="static/assets/js/jquery-1.10.2.js"></script>

    <%--模态框传值--%>
    <script>
        $("document").ready(function () {
            $('#change').modal('hide');
            $('#delete').click(function () {
                var str="确认删除"+$('#movie_name').val()+"?";
                var id = $('#id').val();
                console.log($('#movie_name'));
                if (confirm(str)) {
                    $.ajax({
                        type:"get",
                        url:"${ctx}/removeIndexphoto",
                        data:"id="+id,
                        success:function (data) {
                            if (data == "success") {
                                $("#" + id).remove();
                                alert("删除成功");
                                $('#change').modal('hide');
                            } else {
                                alert("删除出错");
                            }
                        }
                    })
                }
            })
        })
        function Values(movie_name,year,star,id,movie_id) {
            $('#movie_name').val(movie_name);
            $('#year').val(year);
            $('#star').val(star);
            $('#id').val(id);
            $('#movie_id').val(movie_id);
        }
    </script>
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
                    <a href="#" class="active-menu"><i class="fa fa-desktop"></i>主页显示管理</a>
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
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        设置首页推荐电影
                        <small>Setting index page.</small>
                    </h1>
                </div>
            </div>
            <h3 class="agile_w3_title"> 热映中<span>Movies</span></h3>
            <div class="wthree_agile-requested-movies">
                <c:forEach var="movie" items="${photos}">
                    <c:if test="${movie.type==1}">
                        <div class="col-md-2 w3l-movie-gride-agile requested-movies" id="${movie.id}">
                            <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#change"
                               onclick="Values('${movie.name}','${movie.year}','${movie.stars}','${movie.id}','${movie.movie_id}')"><img
                                    src="${ctx}/${movie.src}" title="Movies Pro" class="img-responsive" alt=" ">
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                </div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="#">${movie.name}</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>${movie.year}</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <c:choose>
                                                <c:when test="${movie.stars==1}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==2}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==3}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==4}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==5}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </ul>

                                    </div>
                                </div>
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>

                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#insert" onclick="searchtype(1)"><img
                            src="${ctx}/static/images/timg.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                        </div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="#">添加新的模块</a></h6>
                        </div>

                    </div>

                </div>


                </div>

            <div class="clearfix"></div>
            <h3 class="agile_w3_title"> 即将上映<span>Movies</span></h3>
            <div class="wthree_agile-requested-movies">
                <c:forEach var="movie" items="${photos}">
                    <c:if test="${movie.type==2}">
                        <div class="col-md-2 w3l-movie-gride-agile requested-movies" id="${movie.id}">
                            <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#change"
                               onclick="Values('${movie.name}','${movie.year}','${movie.stars}','${movie.id}','${movie.movie_id}')"><img
                                    src="${ctx}/${movie.src}" title="Movies Pro" class="img-responsive" alt=" ">
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                </div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="#">${movie.name}</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>${movie.year}</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <c:choose>
                                                <c:when test="${movie.stars==1}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==2}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==3}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==4}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==5}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </ul>

                                    </div>
                                </div>
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>

                <div class="col-md-2 w3l-movie-gride-agile requested-movies" >
                    <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#insert" onclick="searchtype(2)"><img
                            src="${ctx}/static/images/timg.jpg" title="Movies Pro" class="img-responsive" alt=" " height="252px" width="127px">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                        </div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="#" >添加新的模块</a></h6>
                        </div>

                    </div>

                </div>

            </div>

                <div class="clearfix"></div>

                <h3 class="agile_w3_title"> 老片推荐<span>Movies</span></h3>
            <div class="wthree_agile-requested-movies">
                <c:forEach var="movie" items="${photos}">
                    <c:if test="${movie.type==3}">
                        <div class="col-md-2 w3l-movie-gride-agile requested-movies" id="${movie.id}">
                            <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#change"
                               onclick="Values('${movie.name}','${movie.year}','${movie.stars}','${movie.id}','${movie.movie_id}')"><img
                                    src="${ctx}/${movie.src}" title="Movies Pro" class="img-responsive" alt=" ">
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                                </div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="#">${movie.name}</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>${movie.year}</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <c:choose>
                                                <c:when test="${movie.stars==1}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==2}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==3}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==4}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:when test="${movie.stars==5}">
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                    </li>
                                                </c:when>
                                                <c:otherwise></c:otherwise>
                                            </c:choose>
                                        </ul>

                                    </div>
                                </div>
                                <div class="clearfix"></div>

                            </div>
                        </div>
                    </c:if>
                </c:forEach>


                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="#" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#insert" onclick="searchtype(3)"><img
                            src="${ctx}/static/images/timg.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i>
                        </div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="#">添加新的模块</a></h6>
                        </div>

                    </div>

                </div>

            </div>

                    <div class="clearfix"></div>

            <h3 class="agile_w3_title"> 老片推荐<span>附加介绍栏</span></h3>

            <div class="player-text two" >
                <form action="${ctx}/updateold" id="form" method="post">
                <p style="color: #02a388;">片名</p><input type="text" value="${indexphoto.name}" id="name" name="name">
                <p style="color: #02a388;">剧情简介</p>:<input type="text" value="${indexphoto.story_line}" id="story_line" name="story_line">
                <p style="color: #02a388;">上映时间</p>:<input type="text" value="${indexphoto.release_time}" id="release_time" name="release_time">
                <p style="color: #02a388;">体裁</p>:<input type="text" value="${indexphoto.genre}" id="genre" name="genre">
                <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                <input type="text" value="${indexphoto.stars}" id="stars" name="stars">
                </p>
                    <button class="btn btn-primary" type="submit">提交编辑</button>
                </form>
            </div>

        </div>








                </div>
                    <!-- /. PAGE INNER  -->
                </div>
                <!-- /. PAGE WRAPPER  -->
            </div>
            <!-- /. WRAPPER  -->
            <!-- 模态框 -->
            <div class="modal fade" id="change">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content" >

                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <h4 class="modal-title">编辑</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- 模态框主体 -->
                            <div class="modal-body">

                                <div class="form-group row">
                                    <label for="movie_name" class="col-4 col-form-label">电影名</label>
                                    <div class="col-8">
                                        <input id="movie_name" name="movie_name" type="text" required="required"
                                               class="form-control">
                                    </div>
                                    <br>
                                    <label for="year" class="col-4 col-form-label">年份</label>
                                    <div class="col-8">
                                        <input id="year" name="year" type="text" required="required"
                                               class="form-control">
                                    </div>
                                    <br>
                                    <label for="star" class="col-4 col-form-label">评分(1-5星)</label>
                                    <div class="col-8">
                                        <input id="star" name="star" type="text" required="required"
                                               class="form-control">
                                    </div>
                                    <label for="photo" class="col-4 col-form-label">图片</label>
                                    <div class="col-8">
                                        <input id="photo" name="photo" type="file" required="required"
                                               class="form-control">
                                    </div>
                                    <input type="hidden" id="id" name="id" value="">
                                    <input type="hidden" id="movie_id" name="movie_id" value="">
                                </div>

                            </div>

                            <!-- 模态框底部 -->
                            <div class="modal-footer">
                                <a href="javascript:void(0)" onclick="getUrl()" class="btn btn-primary btn-lg">前往修改</a>
                                <button class="btn btn-danger btn-lg" id="delete">删除</button>
                                <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">关闭</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>





<!-- 模态框2 新增 -->
<div class="modal fade" id="insert">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="height: 1000px;width: 1000px">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">新增</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <form action="" method="post">
                <div class="modal-body">

                    <div class="form-group row">
                        <label for="searchname" class="col-4 col-form-label">检索电影库中的电影名(已筛选掉与当前状态相同的电影)</label>
                        <input type="hidden" id="stype" value="">
                        <div class="col-8">
                            <input id="searchname" name="search" type="text" required="required"
                                   class="form-control">
                            <button type="button" id="search">搜索</button>
                        </div>
                        <div>
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>电影id</th>
                                        <th>电影名</th>
                                        <th>上映时间</th>
                                        <th>电影评分</th>
                                        <th>电影海报src</th>
                                        <th>电影状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>

                                <tbody id="content">

                                </tbody>


                            </table>
                        </div>
                    </div>

                </div>

                <!-- 模态框底部 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-lg" data-dismiss="modal">关闭</button>
                </div>
            </form>

        </div>
    </div>
</div>


<script type="text/javascript" src="static/js/jquery.validate.min.js" charset="UTF-8"></script>
<script type="text/javascript" src="static/js/validate-methods.js" charset="UTF-8"></script>

<script>
    $('#form').validate(
        {
            rules:{
                name:{
                    required:true,
                },
                story_line:{
                    required:true,
                },
                release_time:{
                    required:true,
                },
                genre:{
                    required:true,
                },
                stars:{
                    required:true,
                    range:[1,5]
                }
            },
            submitHandler:function (form) {
                form.submit();
            }
        }
    )

</script>

<script>
    //给等append完再绑定href
    function aClick() {
        var id = $(event.target).closest('tr').children('td').eq(0).text();
        var stype = $('#stype').val();
        window.location.href = '${ctx}/insertIndex.do?stype=' + stype + '&id=' + id;
    }

    function getUrl() {
        var id = $("#movie_id").val();
        window.location.href = '${ctx}/moviechange?id='+ id;
    }

    function searchtype(stype) {
        $('#stype').val(stype);
    }

    $(document).ready(function () {
        //监听模态框隐藏把数据消除
        $("#insert").on('show.bs.modal',function () {
            $('#searchname').val("");
            $('#content').empty();
        });


        $('#search').click(function () {
            $('#content').empty();
            console.log($(event.target).closest('tr').children('td').eq(0));
            var searchname=$("#searchname").val();
                if (searchname != '') {
                    $.ajax({
                        type:'get',
                        url:'${ctx}/searchmovie.do',
                        data:'search_name='+searchname+"&stype="+$('#stype').val(),
                        success:function (data) {
                            console.log(data);
                            if (data.length > 0) {
                                var str = '';
                                for (var i = 0, l = data.length; i < l; i++) {
                                    str += '<tr>';
                                    for (var key in data[i]) {
                                        if (data[i][key] != null) {
                                            str += '<td>'+data[i][key]+'</td>';
                                        }
                                    }
                                    str += "<td><a href='javascript:void(0)' onclick=\"aClick()\">选择"+"</td>";
                                    str += '</tr>';
                                }
                                $('#content').append(str);

                            } else {
                                $('#content').append("<b>没有找到符合条件的电影，请确认是否已经上映或电影名有误</b>");
                            }

                            // $.each(data,function (n,value) {
                            //     console.log(n + " " + value);
                            //     str += "<tr><td>" + value.name + "</td> <td>" + value.password + "</td></tr>";
                            // })
                        }
                    })
                }else alert("检索关键词不可以为空！");
        })

    })
</script>
            <!-- JS Scripts-->
            <!-- Bootstrap Js -->
            <script src="static/assets/js/bootstrap.min.js"></script>
            <!-- Metis Menu Js -->
            <script src="static/assets/js/jquery.metisMenu.js"></script>
            <!-- Custom Js -->
            <script src="static/assets/js/custom-scripts.js"></script>

        </body>
</html>
