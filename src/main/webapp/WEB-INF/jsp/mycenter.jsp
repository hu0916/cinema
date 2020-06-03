<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/5/6
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>会员中心</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="UTF-8"/>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="static/css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- pop-up -->
    <link href="static/css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //pop-up -->
    <link href="static/css/easy-responsive-tabs.css" rel='stylesheet' type='text/css'/>
    <link rel="stylesheet" type="text/css" href="static/css/zoomslider.css" />
    <link rel="stylesheet" type="text/css" href="static/css/style.css" />
    <link href="static/css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="static/js/modernizr-2.6.2.min.js"></script>
    <link rel="stylesheet" type="text/css" href="static/seats/jquery.seat-charts.css">
    <link rel="stylesheet" type="text/css" href="static/seats/style.css">
    <!--/web-fonts-->
    <link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!--//web-fonts-->
    <style>
        span {
            color: #02a388;
            font-size: 1.5em;
        }
    </style>
</head>
<body>
<!--/main-header-->
<!--/banner-section-->
<div id="demo-1" class="banner-inner">
    <div class="demo-inner-content">
        <!--/header-w3l-->
        <div class="header-w3-agileits" id="home">
            <div class="inner-header-agile">
                <nav class="navbar navbar-default">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <h1><a  href="index.jsp"><span>M</span>ovies <span>P</span>ro</a></h1>
                    </div>
                    <!-- navbar-header -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="index.jsp">主页</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">题材 <b class="caret"></b></a>
                                <ul class="dropdown-menu multi-column columns-3">
                                    <li>
                                        <div class="col-sm-4">
                                            <ul class="multi-column-dropdown">
                                                <li><a href="${ctx}/type?movie_type=1">1喜剧</a></li>
                                                <li><a href="${ctx}/type?movie_type=2">2文艺片</a></li>
                                                <li><a href="${ctx}/type?movie_type=3">3动作片</a></li>
                                                <li><a href="${ctx}/type?movie_type=4">4动画片</a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </li>
                                </ul>
                            </li>
                            <li><a href="#"  class="active">会员中心</a></li>
                            <li><a href="#">联系我们</a></li>
                        </ul>

                    </div>
                    <div class="clearfix"> </div>
                </nav>
                <div class="w3ls_search">
                    <div class="cd-main-header">
                        <ul class="cd-header-buttons">
                            <li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
                        </ul> <!-- cd-header-buttons -->
                    </div>
                    <div id="cd-search" class="cd-search">
                        <form action="${ctx}/query" method="get">
                            <input name="movie_name" type="search" placeholder="搜索电影名...">
                        </form>
                    </div>
                </div>

            </div>

        </div>
        <!--//header-w3l-->
    </div>
</div>
<!--/banner-section-->
<!--//main-header-->
<!--/banner-bottom-->
<div class="w3_agilits_banner_bootm">
    <div class="w3_agilits_inner_bottom">
        <div class="col-md-6 wthree_agile_login">
            <ul>
                <li><i class="fa fa-phone" aria-hidden="true"></i> (+86) 123 456 789</li>
                <li><a href="#" class="login">您好,会员{${user.nickname}}</a> </li>
                <li><a href="${ctx}/quit" class="login reg">退出登录</a> </li>
            </ul>
        </div>
        <div class="col-md-6 wthree_share_agile">

            <div class="single-agile-shar-buttons">
                <ul>
                    <li>
                        <div class="fb-like" data-href="" data-layout="button_count" data-action="like" data-size="small" data-show-faces="false" data-share="false"></div>

                    </li>
                    <li>
                    </li>

                </ul>
            </div>
        </div>
    </div>
</div>
<!--//banner-bottom-->

<!--/content-inner-section-->
<div class="w3_content_agilleinfo_inner">
    <div class="agile_featured_movies">
        <div class="collapse navbar-collapse" >
            <ul class="nav navbar-nav">
                <li style="background: Gainsboro"><a href="${ctx}/mycenter?method=1"><span>个人信息</span></a></li>
                <li style="background: Gainsboro"><a href="${ctx}/mycenter?method=2"><span>订单查询</span></a></li>
            </ul>

        </div>

    </div>
    <c:choose>
        <c:when test="${method==1}">
            <form action="${ctx}/updateuser">
            <center>用户：<input type="text" disabled="disabled" value="${user.username}"></center><br>
                <center>昵称：<input type="text" value="${user.nickname}" id="fnickname" name="nickname" required="required"></center><br>
                <center>电话：<input type="text" value="${user.phone}" id="fphone" name="phone" required="required"></center><br>
                <center>邮箱：<input type="email" value="${user.email}" id="femail" name="email" required="required"></center><br>
                <input type="hidden" value="${user.uid}" name="uid">
                <center><input type="submit" value="确认修改" onclick="doSubmit()"></center>
            </form>
        </c:when>
        <c:when test="${method==2}">


            <div class="panel-body">

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
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="order" items="${myorder}">
                        <c:if test="${order.order_status!=6}">
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
                                    <c:otherwise>
                                <td>完成</td>
                            </c:otherwise>
                            </c:choose>
                            <td>${order.order_price}</td>

                            <td>
                                <a href="${ctx}/delorder?id=${order.id}" class="btn btn-default">删除</a>
                            </td>
                        </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
                <%--<center>--%>
                    <%--<c:if test="${currentPage == 1}">--%>
                        <%--<span class="disabled"><< 前一页</span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${currentPage != 1}">--%>
                        <%--<a href="${ctx}/setplan?page=${currentPage-1}"><< 前一页</a>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${currentPage == 1}">--%>
                        <%--<span class="current">1</span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${currentPage != 1}">--%>
                        <%--<a href="${ctx}/setplan?page=1">1</a>--%>
                    <%--</c:if>--%>

                    <%--<%--%>
                        <%--int pageTimes = (Integer)session.getAttribute("pageTimes");--%>
                        <%--for(int i=1;i<pageTimes;i++)--%>
                        <%--{--%>
                            <%--request.setAttribute("page", i+1);--%>
                    <%--%>--%>
                    <%--<c:if test="${currentPage == page}">--%>
                        <%--<span class="current"><%=i+1%></span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${currentPage != page}">--%>
                        <%--<a href="${ctx}/setplan?page=<%=i+1%>"><%=i+1%></a>--%>
                    <%--</c:if>--%>
                    <%--<%} %>--%>

                    <%--<c:if test="${currentPage == pageTimes}">--%>
                        <%--<span class="disabled">后一页 >></span>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${currentPage != pageTimes}">--%>
                        <%--<a href="${ctx}/setplan?page=${currentPage+1}">后一页 >></a>--%>
                    <%--</c:if>--%>
                <%--</center>--%>
            </div>




        </c:when>
    </c:choose>
</div><!--//content-inner-section-->

<!--/footer-bottom-->
<div class="contact-w3ls" id="contact">
    <div class="footer-w3lagile-inner">
        <div class="footer-grids w3-agileits">
            <div class="col-md-2 footer-grid">
            </div>
            <div class="col-md-2 footer-grid">
            </div>


            <div class="col-md-2 footer-grid">

            </div>

            <div class="footer-grid1">

                <div class="footer-grid1-left">
                    <%--<a href="single.html"><img src="images/4.jpg" alt=" " class="img-responsive"></a>--%>
                </div>
                <div class="footer-grid1-right">
                    <%--<a href="single.html">eveniet ut molesti</a>--%>

                </div>
                <div class="clearfix"> </div>
            </div>
            <div class="footer-grid1">
                <div class="footer-grid1-left">
                    <%--<a href="single.html"><img src="images/3.jpg" alt=" " class="img-responsive"></a>--%>
                </div>
                <div class="footer-grid1-right">
                    <%--<a href="single.html">earum rerum tenet</a>--%>

                </div>
                <div class="clearfix"> </div>
            </div>


        </div>
        <div class="col-md-2 footer-grid">
            <%--<h4 class="b-log"><a href="index.jsp"><span>M</span>ovies <span>P</span>ro</a></h4>--%>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m1.jpg" alt=" " class="img-responsive"></a>--%>
            </div>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m2.jpg" alt=" " class="img-responsive"></a>--%>
            </div>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m3.jpg" alt=" " class="img-responsive"></a>--%>
            </div>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m4.jpg" alt=" " class="img-responsive"></a>--%>
            </div>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m5.jpg" alt=" " class="img-responsive"></a>--%>
            </div>
            <div class="footer-grid-instagram">
                <%--<a href="single.html"><img src="images/m6.jpg" alt=" " class="img-responsive"></a>--%>
            </div>

            <%--<div class="clearfix"> </div>--%>
        </div>
        <ul class="bottom-links-agile">
            <%--<div class="clearfix"> </div>--%>


        </ul>
    </div>
    <h3 class="text-center follow">Connect <span>Us</span></h3>
    <ul class="social-icons1 agileinfo">
        info@example.com
    </ul>

</div>

<div class="w3agile_footer_copy">
    <p>Copyright &copy; 2020.毕业设计1702343310.</p>
</div>
<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>




<script src="static/js/jquery-1.11.1.min.js"></script>
<!-- Dropdown-Menu-JavaScript -->
<script>
    $(document).ready(function(){
        $(".dropdown").hover(
            function() {
                $('.dropdown-menu', this).stop( true, true ).slideDown("fast");
                $(this).toggleClass('open');
            },
            function() {
                $('.dropdown-menu', this).stop( true, true ).slideUp("fast");
                $(this).toggleClass('open');
            }
        );
    });

    $("#myModal4").on("show.bs.modal", function() {
        $("#username").val("");
        $("#password").val("");
    });

    $("#myModal5").on("show.bs.modal", function() {
        $("#warn").text("");
        $("#regpassword").val("");
        $("#regusername").val("");
        $("#phone").val("");
        $("#email").val("");
        $("#confirm").val("");
        $("#nickname").val("");
        if ($("#sendemail").val() !='') {
            $("#email").val($("#sendemail").val());
        }
    });
</script>
<!-- //Dropdown-Menu-JavaScript -->


<script type="text/javascript" src="static/js/jquery.zoomslider.min.js"></script>
<!-- search-jQuery -->
<script src="static/js/main.js"></script>
<script src="static/js/simplePlayer.js"></script>
<script>
    $("document").ready(function() {
        $("#video").simplePlayer();
    });
</script>
<script>
    $("document").ready(function() {
        $("#video1").simplePlayer();
    });
</script>
<script>
    $("document").ready(function() {
        $("#video2").simplePlayer();
    });
</script>
<script>
    $("document").ready(function() {
        $("#video3").simplePlayer();
    });
</script>

<!-- pop-up-box -->
<script src="static/js/jquery.magnific-popup.js" type="text/javascript"></script>
<!--//pop-up-box -->

<div id="small-dialog1" class="mfp-hide">
    <iframe src=""></iframe>
</div>
<div id="small-dialog2" class="mfp-hide">
    <iframe src=""></iframe>
</div>
<script>
    $(document).ready(function() {
        $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
            type: 'inline',
            fixedContentPos: false,
            fixedBgPos: true,
            overflowY: 'auto',
            closeBtnInside: true,
            preloader: false,
            midClick: true,
            removalDelay: 300,
            mainClass: 'my-mfp-zoom-in'
        });

    });
</script>
<script src="static/js/easy-responsive-tabs.js"></script>
<script>
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true,   // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function(event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
        $('#verticalTab').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true
        });
    });
</script>
<link href="static/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
<script src="static/js/owl.carousel.js"></script>
<script>
    $(document).ready(function() {
        $("#owl-demo").owlCarousel({

            autoPlay: 3000, //Set AutoPlay to 3 seconds
            autoPlay : true,
            navigation :true,

            items : 5,
            itemsDesktop : [640,4],
            itemsDesktopSmall : [414,3]

        });

    });
</script>

<!--/script-->
<script type="text/javascript" src="static/js/move-top.js"></script>
<script type="text/javascript" src="static/js/easing.js"></script>


<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},900);
        });
    });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        /*
        var defaults = {
              containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
         };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<!--end-smooth-scrolling-->
<script src="static/js/bootstrap.js"></script>

<c:if test="${not empty alert}">
    <script>
        alert("${alert}");
        <c:remove var="alert" scope="session"></c:remove>
        window.location.reload();
    </script>
</c:if>


<script>
    function doSubmit() {
        flag = true;
        var fnickname = $("#fnickname").val();
        var femail = $("#femail").val();
        var fphone = $("#fphone").val();
        // if (fnickname == '') {
        //     alert("用户名不能为空");
        //     flag = false;
        // }else if (femail == '') {
        //     alert("email不能为空");
        //     flag = false;
        // }else if (fphone == '') {
        //     alert("电话不能为空");
        //     flag = false;
        // }
        if (flag) {
            $('#form').submit();
        }
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/vue@2.6.11"></script>
</body>
</html>