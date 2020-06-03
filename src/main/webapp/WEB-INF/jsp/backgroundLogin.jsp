<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2020/4/16
  Time: 20:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>影院后台管理登录</title>
    <script src="static/js/jquery-1.11.1.min.js"></script>
    <%--<script src="static/js/bootstrap.min.js"></script>--%>
    <script src="static/js/scripts.js"></script>

    <c:if test="${!empty alert}">
        <script>
            alert("${alert}");
        </script>
    </c:if>
    <script>
        $(document).ready(function () {
            $("#login").click(
                function () {
                    var username=$("#username").val().trim();
                    var password=$("#password").val().trim();
                    var user={
                        username:username,
                        password: password,
                        status:1
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
                                    window.location.href = '${ctx}/center';
                                }
                                if (data == "nopermission") {
                                    alert("权限不足")
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
    <link href="https://fonts.googleapis.com/css?family=Raleway:400,700|Roboto:600" rel="stylesheet">
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <link rel="stylesheet" href="static/css/font-awesome.min.css">
    <link rel="stylesheet" href="static/css/loginstyle.css">
    <link rel="stylesheet" href="static/css/responsive.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="top-bar">
    <div class="container">
        <div class="row">
            <div class="col-md-3 col-sm-3">

            </div>
            <div class="col-md-9 col-sm-9 text-right">
                <ul>
                    <li><i class="fa fa-phone"></i><span>123456789技术支持电话</span></li>
                    <li><i class="fa fa-envelope-o"></i><span>info@example.com</span></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="slider jumbotron" style="background: blue">
    <div class="container">
        <div class="col-md-6">
            <div class="slider-left">
                <h2>新的影院管理方法Cinema Pro</h2>
            </div>
        </div>
        <div class="col-md-offset-2 col-md-4">
            <div class="slider-right">
                <form class="join-now">
                    <h2 class="text-center">后台权限验证</h2>
                    <div class="input-group"><input type="text" class="form-control" placeholder="用户名" name="username" id="username"></div>
                    <div class="input-group"><input type="password" class="form-control" placeholder="密码" name="password" id="password"></div>
                    <small class="text-center">请确认您是否管理员权限</small>
                    <div class="text-center">
                        <button class="btn btn-join-now" type="button" id="login">Login Now</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="footer" style="background: white">
    <div class="container text-center">
        <div class="row">
            <p class="copyright" style="color:black">Copyright &copy; 2020.毕业设计1702343310.</p>
        </div>
    </div>
</div>
</body>
</html>