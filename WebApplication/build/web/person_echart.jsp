<%-- 
    Document   : echarts
    Created on : 2020-6-23, 0:29:15
    Author     : Legion
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <!-- 引入 ECharts 文件 -->
        <script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>
        <script type="text/javascript" src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
        <title>Fatty delivery！</title>
    </head>
    <body style="text-align: center; min-height: 100%;">
        <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
        <div id="d1" style="width: 800px;height:400px; margin: 0 auto;"></div>
        <div id="d2" style="width: 800px;height:400px; margin: 0 auto;"></div>
        <div id="d3" style="width: 800px;height:50px; margin: 0 auto;"></div>
        <div style="width: 800px;height:400px; margin: 0 auto;">
            <div id="item0" style="width: 30%;height:200px; float:left;margin: 0 auto;"></div>
            <div id="item1" style="width: 30%;height:200px; float:left;margin: 0 auto;"></div>
            <div id="item2" style="width: 30%;height:200px; float:left;margin: 0 auto;"></div>
            <div id="item3" style="width: 30%;height:200px; float:left;margin: 0 auto;"></div>
            <div id="item4" style="width: 30%;height:200px; float:left;margin: 0 auto;"></div>
        </div>
        <div id="d4" style="width: 800px;height:400px; margin: 0 auto;"></div>
        <script type="text/javascript">
            var myChart1 = echarts.init(document.getElementById('d1'));
            var myChart2 = echarts.init(document.getElementById('d2'));
            var myChart3 = echarts.init(document.getElementById('d3'));
            var myChart4 = echarts.init(document.getElementById('d4'));

            myChart1.setOption({
                title: {
                    text: 'Personal log hits',
                    subtext: 'Real-time data',
                    left: 'center'
                },
                xAxis: {
                    data: []
                },
                yAxis: {
                },
                series: [{
                        name: 'Personal log hits',
                        type: 'bar',
                        data: [],
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(180, 220, 200, 0.8)'
                        }
                    }]
            });

            myChart2.setOption({
                title: {
                    text: 'Personal log sales',
                    subtext: 'Real-time data',
                    left: 'center'
                },
                xAxis: {
                    data: []
                },
                yAxis: {
                },
                series: [{
                        name: 'Personal log sales',
                        type: 'bar',
                        data: [],
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(180, 220, 200, 0.8)'
                        }
                    }]
            });

            myChart3.setOption(option = {
                title: {
                    text: 'Personal log purchase rate',
                    subtext: 'Real-time data',
                    left: 'center'
                }});

            myChart4.setOption({
                title: {
                    text: 'Personal log combine sales',
                    subtext: 'Real-time data',
                    left: 'center'
                },
                xAxis: {
                    data: []
                },
                yAxis: {
                },
                series: [{
                        name: 'Personal log combine sales',
                        type: 'bar',
                        data: [],
                        showBackground: true,
                        backgroundStyle: {
                            color: 'rgba(180, 220, 200, 0.8)'
                        }
                    }]
            });

            var names1 = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var nums1 = []; //建立一个数量数组（实际用来盛放Y坐标值）
            var names2 = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var nums2 = []; //建立一个数量数组（实际用来盛放Y坐标值）
            var names3 = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var nums3 = []; //建立一个数量数组（实际用来盛放Y坐标值）
            var names4 = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var nums4 = []; //建立一个数量数组（实际用来盛放Y坐标值）
            $.ajax({
                type: "post",
                async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                url: "TestServlet", //请求发送到TestServlet
                data: {
                    "table": "Person" // Person
                },
                dataType: "json", //返回数据形式为json

                //请求成功后接收数据name+num两组数据
                success: function (result) {
                    //result为服务器返回的json对象
                    console.log(result);
                    if (result) {
                        console.log(result);
                        //取出数据存入数组
                        for (var i = 0; i < 5; i++) {
                            names1.push(result[i].name); //迭代取出类别数据并填入类别数组
                        }
                        for (var i = 0; i < 5; i++) {
                            nums1.push(result[i].num); //迭代取出销量并填入销量数组
                        }
                        myChart1.setOption({
                            xAxis: {
                                data: names1
                            },
                            series: [{
                                    // 根据名字对应到相应的数据
                                    data: nums1
                                }]
                        });

                        for (var i = 5; i < 10; i++) {
                            names2.push(result[i].name); //迭代取出类别数据并填入类别数组
                        }
                        for (var i = 5; i < 10; i++) {
                            nums2.push(result[i].num); //迭代取出销量并填入销量数组
                        }
                        myChart2.setOption({
                            xAxis: {
                                data: names2
                            },
                            series: [{
                                    // 根据名字对应到相应的数据
                                    data: nums2
                                }]
                        });
                        for (var i = 10; i < 15; i++) {
                            names3.push(result[i].name); //迭代取出类别数据并填入类别数组
                        }
                        for (var i = 10; i < 15; i++) {
                            nums3.push(result[i].num); //迭代取出销量并填入销量数组
                        }
                        function drawPie(a, tit) {
                            var option = {
                                title: {
                                    text: tit,
                                    x: 'center',
                                    y: 'bottom'
                                },
                                series: [{
                                        name: 'haha',
                                        type: 'pie',
                                        radius: '55%',
                                        roseType: 'angle',
                                        data: [
                                            {value: a, name: 'Buy'},
                                            {value: 100 - a, name: 'Just click'}
                                        ]
                                    }]};
                            return option;
                        }
                        console.log(names3, nums3);
                        for (var i = 0; i < 5; i++) {
                            console.log('item' + i.toString());
                            var eid = 'item' + i.toString();
                            myChart = echarts.init(document.getElementById(eid));
                            console.log(nums3[i], names3[i]);
                            myChart.setOption(drawPie(nums3[i] * 100, names3[i]));
                        }
                        /*
                         for (var i = 0; i < result.length; i++) {
                         names.push(result[i].name); //迭代取出类别数据并填入类别数组
                         }
                         for (var i = 0; i < result.length; i++) {
                         nums.push(result[i].num); //迭代取出销量并填入销量数组
                         }
                         */

                        // myChart.hideLoading(); //隐藏加载动画

                        //覆盖操作-根据数据加载数据图表
                        for (var i = 15; i < 20; i++) {
                            names4.push(result[i].name); //迭代取出类别数据并填入类别数组
                        }
                        for (var i = 15; i < 20; i++) {
                            nums4.push(result[i].num); //迭代取出销量并填入销量数组
                        }
                        myChart4.setOption({
                            xAxis: {
                                data: names4
                            },
                            series: [{
                                    // 根据名字对应到相应的数据
                                    data: nums4
                                }]
                        });

                    }


                }
                ,
                error: function (errorMsg) {
                    //请求失败时执行该函数
                    alert("图表请求数据失败!");
                    // myChart.hideLoading();
                }
            }
            );
        </script>
    </body>
</html>


