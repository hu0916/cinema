<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/28
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>电影详情</title>
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
                            <li class="active"><a href="index.jsp">主页</a></li>
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
                            <li><a href="${ctx}/mycenter?method=1">会员中心</a></li>
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
                <c:choose>
                    <c:when test="${empty user}">
                        <li><a href="#" class="login"  data-toggle="modal" data-target="#myModal4">登录</a></li>
                        <li><a href="#" class="login reg"  data-toggle="modal" data-target="#myModal5">注册</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="#" class="login">您好,会员{${user.nickname}}</a> </li>
                        <li><a href="${ctx}/quit" class="login reg">退出登录</a> </li>
                    </c:otherwise>
                </c:choose>

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
<!-- Modal1 -->
<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" >

    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>用户登录</h4>
                <div class="login-form">
                    <input type="text" name="username" placeholder="用户名" required="required" id="username">
                    <input type="password" name="password" placeholder="密码" required="required" id="password">
                    <div class="tp">
                        <center><input type="submit" value="登录" id="login" ></center>
                    </div>
                    <div class="forgot-grid">
                        <div class="forgot">
                            <a href="#">忘记密码请联系管理员</a>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Modal1 -->
<!-- Modal1 -->
<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" >

    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4>注册</h4>
                <div class="login-form">
                    <input type="text" name="username" placeholder="账户(6位)" required="" onblur="registerCheck()" id="regusername"><span id="warn"></span>
                    <input type="email" name="email" placeholder="E-mail" required="" id="email">
                    <input type="password" name="password" placeholder="密码(6位)" required="" id="regpassword">
                    <input type="password" name="conform password" placeholder="确认密码" required="" id="confirm">
                    <input type="text" name="nickname" value="" placeholder="昵称" required="" id="nickname">
                    <input type="text" name="phone" value="" placeholder="手机号码" required="" id="phone">
                    <div class="signin-rit">
													<span class="agree-checkbox">
														<label class="checkbox"><input type="checkbox" name="checkbox">I agree to your <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a> and <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
													</span>
                    </div>
                    <div class="tp">
                        <input type="submit" value="马上注册" onclick="register()">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //Modal1 -->
<!--/content-inner-section-->
<div class="w3_content_agilleinfo_inner">
    <div class="agile_featured_movies">
        <div class="inner-agile-w3l-part-head">
            <h3 class="w3l-inner-h-title">电影：${single.movie_name}</h3>
            <p class="w3ls_head_para">介绍：${single.movie_introduce}</p>
        </div>
        <div class="latest-news-agile-info">
            <div class="col-md-8 latest-news-agile-left-content">
                <div class="single video_agile_player">

                    <div class="video-grid-single-page-agileits">
                        <div data-video="f2Z65fobH2I" id="video"> <img src="${ctx}/${single.movie_src}" alt="" class="img-responsive"> </div>
                    </div>
                    <h4>电影评分：${single.movie_stars}</h4>
                </div>
                <div class="response">
                    <h4>放映计划Plan</h4>
                    <div class="media response-info">
                        <c:forEach var="plan" items="${singleplan}">
                            <c:if test="${not empty plan.seat}">
                        <div class="media-left response-text-left">
                            <h5>${plan.play_time}</h5>
                        </div>
                        <div class="media-body response-text-right">
                            <p>${plan.movie_name}||${plan.hall_type}||${plan.hall_place}||${plan.movie_price}</p>
                            <ul>
                                <li>影片开始时间:${plan.start_time}</li>
                                <li><a href="#" onclick="select('${plan.seat}','${plan.movie_price}','${plan.hall_place}','${plan.plan_id}','${plan.hall_type}')" data-toggle="modal" data-target="#select"><i class="fa fa-reply" aria-hidden="true"></i> 购票</a></li>
                            </ul>

                        </div>
                        <div class="clearfix"> </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-md-4 latest-news-agile-right-content">
                <div class="side-bar-form">

                </div>
                <div class="clearfix"> </div>
                <div class="agile-info-recent">
                    <div class="w3ls-recent-grids">
                        <div class="w3l-recent-grid">
                            <div class="wom">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="w3l-recent-grid">
                            <div class="wom">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                        <div class="w3l-recent-grid">
                            <div class="wom">
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>

    </div>
</div><!--//content-inner-section-->

<!--/footer-bottom-->
<div class="contact-w3ls" id="contact">
    <div class="footer-w3lagile-inner">
        <h2>订阅我们的<span>活动通知</span></h2>
        <p class="para">输入你的邮箱地址并点击订阅键完成注册后可以接受我们的最新活动与电影资讯的通知。</p>
        <div class="footer-contact">
            <input type="email" name="Email" placeholder="输入你的Email...." required=" " id="sendemail">
            <input type="submit" value="订阅" data-toggle="modal" data-target="#myModal5">
        </div>
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

</div>
<div class="w3agile_footer_copy">
    <p>Copyright &copy; 2020.毕业设计1702343310.</p>
</div>
<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>


<!-- 模态框 选票 -->
<div class="modal fade" id="select">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="height: 800px;width: 800px">

            <!-- 模态框头部 -->
            <div class="modal-header">
                <h4 class="modal-title">选座</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- 模态框主体 -->
            <form action="" method="post">
                <div class="modal-body">

                    <div class="front-indicator">座位选择</div>
                    <input type="hidden" value="" id="plan_id">
                    <input type="hidden" value="" id="hall_type">
                    <input type="hidden" value="" id="verifyseat">
                    <div id="seat-map">

                    </div>
                    <div class="booking-details">
                        <h3>已选中的座位 (<span id="counter">0</span>):</h3>
                        <ul id="selected-seats">
                        </ul>
                        <p>总价: <b>$<span id="total">0</span></b></p>
                        <button type="button" onclick="createOrder()">结算</button>



                    </div>
                    <div id="legend">

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


<script src="static/seats/jquery.seat-charts.js"></script>
<%--控制模态框的座位生成--%>
<script>
    var map = new Array();//全局变量
    function select(str,price,place,plan_id,hall_type) {
        map = str.split(',');
        $("#verifyseat").val(map);
        console.log(map);
        var firstSeatLabel = 1;
        var cart = $('#selected-seats');
        var counter = $('#counter');
        var total = $('#total');
        $('#plan_id').val(plan_id);
        $('#hall_type').val(hall_type);
        $('#seat-map').empty();
        cart.empty();
        counter.text(0);
        total.text(0);
        var sc = $('#seat-map').seatCharts({
            map: map,
            seats: {
            //     f: {
            //         price   : 100,
            //         classes : 'first-class', //your custom CSS class
            //         category: '头等舱'
            //     },
                e: {//取得信息
                    price   : price,
                    classes : 'economy-class', //your custom CSS class
                    category: place
                }

            },
            naming : {//座位名
                top : false,
                getLabel : function (character, row, column) {
                    return firstSeatLabel++;
                },
            },
            legend : {
                node : $('#legend'),
                items : [//图例
                    [ 'e', 'available',   '位置' ],
                    [ 'e', 'none', '选中'],
                    [ 'f', 'unavailable', '已预定']
                ]
            },
            click: function() {
                if (this.status() == 'available') { //若为可选座状态，添加座位
                    map[this.settings.row] = map[this.settings.row].substring(0, this.settings.column) + "f" + map[this.settings.row].substring(this.settings.column + 1);
                    console.log(map);
                    //购物车
                    $('<li>'+this.data().category+this.settings.label+'号座位'+'：<br/>价格：<b>$'+this.data().price+'</b> <a href="#" class="cancel-cart-item">[删除]</a></li>')
                        .attr('id','cart-item-'+this.settings.id)
                        .data('seatId', this.settings.id)
                        .appendTo(cart);
                    console.log(sc.find('none').length + 1);
                    counter.text(sc.find('none').length+1);
                    total.text(accAdd(recalculateTotal(sc),this.data().price));
                    return 'none';
                }else if (this.status() == 'unavailable') {
                    return 'unavailable';
                } else {
                    map[this.settings.row]=map[this.settings.row].substring(0,this.settings.column)+"e"+map[this.settings.row].substring(this.settings.column+1);
                    counter.text(sc.find('none').length-1);
                    total.text(accSub(recalculateTotal(sc),this.data().price));
                    //remove the item from our cart
                    $('#cart-item-'+this.settings.id).remove();
                    console.log(map);
                    return "available";
                }
            }
        });
        $('#selected-seats').on('click', '.cancel-cart-item', function () {
            //let's just trigger Click event on the appropriate seat, so we don't have to repeat the logic here
            sc.get($(this).parents('li:first').data('seatId')).click();
        });
        sc.find('f.available').status('unavailable');
    }

    function recalculateTotal(sc) {
        var total = 0;

        //basically find every selected seat and sum its price
        sc.find('none').each(function () {
            total = accAdd(this.data().price, total);
        });
        return total;
    }


    <%--留坑操作 session周期过后为空--%>
    function createOrder() {
        var seats=$("#selected-seats");
        var order_product='';
        seats.find("li").each(function () {
            order_product += $(this).text().substring(0, $(this).text().indexOf('：')) + "|";
        });
        console.log(order_product);
        var order_number = $('#counter').text();
        var order_price = $('#total').text();
        var movie_name='${single.movie_name}';
        var hall_type=$("#hall_type").val();
        var user='${user}';
        console.log(user);
        if (movie_name == '' || hall_type == null) {
            alert("数据已过期");
            window.location.reload();
        } else {
            if (user != '') {
                var order={
                    order_product:order_product,
                    order_number:order_number,
                    order_price:order_price,
                    movie_name:movie_name,
                    hall_type:hall_type
                };
                if (order_price == 0) {
                    alert("请选座位");
                } else {
                    $.ajax({
                        type:"post",
                        url:"${ctx}/order.do",
                        data: JSON.stringify({order:order,seats:map,display_id:$('#plan_id').val(),verifymap:$('#verifyseat').val()}),
                        datatype:"json",
                        contentType:"application/json;charset=UTF-8",
                        success:function (data) {
                            if (data == "success") {
                                alert("购买成功");
                                window.location.href = "${ctx}/mycenter?method=2";
                            }else if (data == "changed") {
                                alert("座位信息变动 请刷新");
                                window.location.reload();
                            }else if ("usernull" == data) {
                                alert("用户无效，请登录");
                            }else alert("操作失败");
                            console.log(data);
                        }
                    });
                }
            }else alert("请先登录");
        }
    }

</script>

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


<script>
    function accAdd(arg1, arg2) {
        var r1, r2, m, c;
        try {
            r1 = arg1.toString().split(".")[1].length;
        }
        catch (e) {
            r1 = 0;
        }
        try {
            r2 = arg2.toString().split(".")[1].length;
        }
        catch (e) {
            r2 = 0;
        }
        c = Math.abs(r1 - r2);
        m = Math.pow(10, Math.max(r1, r2));
        if (c > 0) {
            var cm = Math.pow(10, c);
            if (r1 > r2) {
                arg1 = Number(arg1.toString().replace(".", ""));
                arg2 = Number(arg2.toString().replace(".", "")) * cm;
            } else {
                arg1 = Number(arg1.toString().replace(".", "")) * cm;
                arg2 = Number(arg2.toString().replace(".", ""));
            }
        } else {
            arg1 = Number(arg1.toString().replace(".", ""));
            arg2 = Number(arg2.toString().replace(".", ""));
        }
        return (arg1 + arg2) / m;
    }

    function accSub(arg1,arg2){
        var r1,r2,m,n;
        try{r1=arg1.toString().split(".")[1].length}catch(e){r1=0}
        try{r2=arg2.toString().split(".")[1].length}catch(e){r2=0}
        m=Math.pow(10,Math.max(r1,r2));
        //last modify by deeka
        //动态控制精度长度
        n=(r1>=r2)?r1:r2;
        return ((arg1*m-arg2*m)/m).toFixed(n);
    }
</script>

<%--登录--%>
<script>
    $(document).ready(function () {
        $("#login").click(
            function () {
                var username=$("#username").val().trim();
                var password=$("#password").val().trim();
                var user={
                    username:username,
                    password: password,
                    status:2
                };

                if (username == null || username == "") {
                    alert("用户名不能为空");
                }
                if (password == null || password == "") {
                    alert("密码不能为空");
                }
                if (username.length >= 6 && password.length >= 6) {
                    $.ajax({
                        type: "post",
                        url:"${ctx}/login.do",
                        data:JSON.stringify(user),
                        datatype:"json",
                        contentType:"application/json;charset=UTF-8",
                        success:function (data) {
                            console.log(data);
                            if (data == "success") {
                                alert("成功登录");
                                window.location.reload();
                            }
                            if (data == "nopermission") {
                                alert("请使用用户账号登录")
                            }
                            if (data == "banned") {
                                alert("封禁账号")
                            }
                            if (data == "false") {
                                alert("账号不存在或密码错误")
                            }
                        },
                        error:function () {
                            alert("网络错误");
                        }
                    })
                }
            }
        )

    })
</script>

<script>
    var flag = false;
    function registerCheck() {
        flag = false;
        $('#warn').text("");
        var username = $("#regusername").val().trim();
        if (username.length < 6) {
            $('#warn').text("长度不对");
        } else {
            $.ajax({
                url:"${ctx}/checkuser",
                data: "username=" + username,
                type:"get",
                success:function (data) {
                    if (data == "exist") {
                        alert("账号已存在");
                        $("#warn").text("账号已存在");
                    }else if (data == "available") {
                        flag = true;
                        $("#warn").text("✔");
                    }
                }
            });
        }
    }

    function register() {
        if (flag) {
            var password = $("#regpassword").val();
            var confirm = $("#confirm").val();
            var user={
                username: $("#regusername").val(),
                password:password,
                email:$("#email").val(),
                nickname:$("#nickname").val(),
                phone:$("#phone").val()
            }
            if (password == confirm) {
                $.ajax({
                    url: '${ctx}/register.do',
                    type:'post',
                    data:JSON.stringify(user),
                    datatype:"json",
                    contentType:"application/json;charset=UTF-8",
                    success:function (data) {
                        console.log(data);
                    }
                })
            }else alert("两次密码不一致");
        }
    }
</script>
</body>
</html>