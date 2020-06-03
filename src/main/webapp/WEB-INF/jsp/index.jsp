<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Movie Pro主页</title>
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
<!--/web-fonts-->
<link href='http://fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
<link href="http://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<!--//web-fonts-->
	<c:if test="${!empty alert}">
		<script>
			alert("${alert}");
		</script>
	</c:if>
</head>
<body>
<!--/main-header-->
  <!--/banner-section-->
	<div id="demo-1" data-zs-src='["static/images/2.jpg", "images/1.jpg", "images/3.jpg","images/4.jpg"]' data-zs-overlay="dots">
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
			<!--/banner-info-->
			   <div class="baner-info">
			      <h3>Latest <span>On</span>Line <span>Mo</span>vies(最新的电影)</h3>
				  <h4>无惧一切的光怪陆离空间</h4>
				  <a class="login reg" href="#" data-toggle="modal" data-target="#myModal5">
											加入我们
										</a>
			   </div>
			<!--/banner-ingo-->		
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
						<!--/agileinfo_tabs-->
					   <div class="agileinfo_tabs">

					</div>
				<!--//tab-section-->	
				  <h3 class="agile_w3_title"> 热映中 <span>Movies</span></h3>
			<!--/movies-->				
			<div class="w3_agile_latest_movies">
			
				<div id="owl-demo" class="owl-carousel owl-theme">
					<c:forEach var="movie" items="${photos}">
						<c:if test="${movie.type==1}">
						<div class="item">
						<div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
							<a href="${ctx}/single?id=${movie.movie_id}" class="hvr-sweep-to-bottom"><img src="${ctx}/${movie.src}" title="Movies Pro" class="img-responsive" alt=" " />
								<div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
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
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="ribben one">
								<p>NEW</p>
							</div>
						</div>
					</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
				<!--//movies-->
				 <h3 class="agile_w3_title">即将上映 <span>Movies</span> </h3>
				<!--/requested-movies-->
				     <div class="wthree_agile-requested-movies">
						 <c:forEach var="movie" items="${photos}">
							 <c:if test="${movie.type==2}">
								 <div class="col-md-2 w3l-movie-gride-agile requested-movies" id="${movie.id}">
									 <a href="${ctx}/single?id=${movie.movie_id}" class="hvr-sweep-to-bottom" data-toggle="modal" data-target="#change"
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

												<div class="clearfix"></div>
						</div>
				<!--//requested-movies-->
				<!--/top-movies-->
					<h3 class="agile_w3_title">老片推荐 <span>Movies</span> </h3>
							<div class="top_movies">
								<div class="tab_movies_agileinfo">
										<div class="w3_agile_featured_movies two">
										
										     <div class="col-md-7 wthree_agile-movies_list second-top">
												 <c:forEach var="movie" items="${photos}">
												 <c:if test="${movie.type==3}">
												 <div class="w3l-movie-gride-agile">
															<a href="${ctx}/single?id=${movie.movie_id}" class="hvr-sweep-to-bottom"><img src="${ctx}/${movie.src}" title="Movies Pro" class="img-responsive" alt=" ">
																<div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
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
																		<div class="clearfix"></div>
																	</div>
																</div>

													</div>
												 </c:if>
												 </c:forEach>
											 </div>

											 	<div class="col-md-5 video_agile_player second-top">
										            <div class="video-grid-single-page-agileits">
														<div data-video="BXEZFd0RT5Y" id="video3"> <img src="images/44.jpg" alt="" class="img-responsive" /> </div>
													</div>

        <div class="player-text two">
												<p class="fexi_header">${indexphoto.name} </p>
												<p class="fexi_header_para"><span class="conjuring_w3">简介<label>:</label></span>${indexphoto.story_line}
													....... </p>
									<p class="fexi_header_para"><span>上映时间<label>:</label></span>${indexphoto.release_time}</p>
												
												<p class="fexi_header_para">
													<span>题材<label>:</label> </span>
													${indexphoto.genre}
												</p>
												<p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
													<c:choose>
													<c:when test="${indexphoto.stars==1}">
			<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			</c:when>
			<c:when test="${indexphoto.stars==2}">
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			</c:when>
			<c:when test="${indexphoto.stars==3}">
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			</c:when>
			<c:when test="${indexphoto.stars==4}">
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
			</c:when>
			<c:when test="${indexphoto.stars==5}">
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
				<a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
			</c:when>
			<c:otherwise></c:otherwise>
			</c:choose>
												</p>
											</div>

										    </div>
											<div class="clearfix"> </div>
										  </div>
										  <div class="cleafix"></div>
									</div>	
								</div>
					
				<!--//top-movies-->
			</div>
		</div>
			<!--//content-inner-section-->
		
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
								</ul>


						</div>
								<div class="col-md-2 footer-grid">

								<div class="clearfix"> </div>
							</div>
							<div class="footer-grid1">
								<div class="clearfix"> </div>
							</div>
							<div class="footer-grid1">
							
								<div class="footer-grid1-left">
								</div>
								<div class="footer-grid1-right">
								</div>
								<div class="clearfix"> </div>
							</div>
							<div class="footer-grid1">
								<div class="footer-grid1-left">
								</div>
								<div class="footer-grid1-right">

								</div>
								<div class="clearfix"> </div>
							</div>


						</div>
						<div class="col-md-2 footer-grid">
							<div class="footer-grid-instagram">
							</div>
							<div class="footer-grid-instagram">
							</div>
							<div class="footer-grid-instagram">
							</div>
							<div class="footer-grid-instagram">
							</div>
							<div class="footer-grid-instagram">
							</div>
							<div class="footer-grid-instagram">
							</div>
								
						</div>
						<ul class="bottom-links-agile">


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
									 window.location.href = '${ctx}/mycenter?method=1';
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

<%--注册--%>
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
                        if (data == "success") {
                            window.location.href="${ctx}/mycenter?method=1"
                        }
					}
				})
			}else alert("两次密码不一致");
		}
	}
</script>
</body>
</html>