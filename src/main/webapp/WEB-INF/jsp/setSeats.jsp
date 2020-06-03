<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>电影座位设置</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="static/seats/jquery.seat-charts.css">
    <link rel="stylesheet" type="text/css" href="static/seats/style.css">
</head>
<style>
    body {
        background: url('${ctx}/static/images/info.png') no-repeat;

    }
</style>
<body>
<div class="wrapper">
    <div class="container">
        <div class="front-indicator">座位设置</div>
        ${seatError}
        <div id="seat-map">
        </div>
        <div class="booking-details">
            <p><button class="checkout-button" id="save">保存座位</button></p>
            <p> <button type="button" onclick="change()">绘制座位</button></p>
            <input type='text' value='' id='x'>X
            <input type='text' value='' id='y'>
            <div id="legend"></div>
        </div>

    </div>

</div>
<script src="static/js/jquery-1.11.1.min.js"></script>
<script src="static/seats/jquery.seat-charts.js"></script>
<script>
    <%--改了插件的源码 使支持动态加载--%>
    var map = new Array();//全局变量
    function change(){
        var firstSeatLabel = 1;
        $('#seat-map').empty();
        var x = parseInt($("#x").val());
        var y = parseInt($("#y").val());
        map = [];
        for(var i=0;i<x;i++){
            map[i]="";
            for(var j=0;j<y;j++){
                map[i]+="e";
            }
        }
        var sc = $('#seat-map').seatCharts({
            map: map,
            // seats: {
            //     f: {
            //         price   : 100,
            //         classes : 'first-class', //your custom CSS class
            //         category: '头等舱'
            //     },
            //     e: {
            //         price   : 40,
            //         classes : 'economy-class', //your custom CSS class
            //         category: '经济舱'
            //     }
            //
            // },
            naming : {
                top : false,
                getLabel : function (character, row, column) {
                    return firstSeatLabel++;
                },
            },
            legend : {
                node : $('#legend'),
                items : [
                    [ 'e', 'available',   '位置' ],
                    [ 'e', 'none', '过道']
                ]
            },
            click: function() {
                if (this.status() == 'available') { //若为可选座状态，添加座位
                    map[this.settings.row]=map[this.settings.row].substring(0,this.settings.column)+"_"+map[this.settings.row].substring(this.settings.column+1);
                    return 'none';
                }else {
                    map[this.settings.row]=map[this.settings.row].substring(0,this.settings.column)+"e"+map[this.settings.row].substring(this.settings.column+1);
                    return "available";
                }
            }
        });
    }

    $(document).ready(
        $("#save").on("click",function(){
            $.get("${ctx}/getseat?seats="+map).success(function(data){
                if (data == "success") {
                    console.log(data);
                    alert("保存成功");
                    <%--<jsp:forward page="/setplan"></jsp:forward>--%>
                    window.location.href = '${ctx}/setplan';
                }
            });
        })
    )
</script>
</body>
</html>
