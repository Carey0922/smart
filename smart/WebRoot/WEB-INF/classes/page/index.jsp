<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <meta charset="utf-8">
    <title>无标题文档</title>
    <link href="style/public.css" rel="stylesheet" type="text/css">
    <link href="style/main.css" rel="stylesheet" type="text/css">
    <link href="style/button.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="<%=path%>/script/plugin/skins/twitter.css"/>
</head>
<body>
<div class="contain">
<!--header-->
<div class="header clearfix">
    <!--logo-->
    <h1 class="logo">
        <a href="#" class="siteLogo">中国移动</a>
        <a href="#" class="managerLogo">移动终端管理系统</a>
    </h1>
    <!--//logo-->
    <!--info-->
    <div class="info clearfix">
        <!--搜索-->
        <div class="search clearfix">
            <div class="search-area">
                <input type="text" placeholder="搜索" class="sprices" />
            </div>
            <div class="search-btn">
                <input type="button" value="" class="sprices" />
            </div>
        </div>
        <!--//搜索-->
        <!--nav-->
        <div class="nav">
            <ul class="clearfix">
                <li><a href="#"><em class="icon-upload sprices"></em>上传到云服务器</a></li>
                <li><a href="#"><em class="icon-synchro sprices"></em>同步到服务器</a></li>
            </ul>
        </div>
        <!--//nav-->
    </div>
    <!--//info-->
</div>
<!--//header-->
<!--工作台-->
<div class="bench clearfix" >
    <!--user-->
    <div class="user clearfix">
        <div class="user-img">
            <div class="user-img-con">
                <img src="pictures/user_img100x100.jpg" />
            </div>
        </div>
        <div class="user-main clearfix">
            <div class="user-info">
                <div class="user-name">
                    <span class="name">Admin</span>
                    <a href="#" class="exit">退出</a>
                </div>
                <div class="user-g">用户级别：<em>超级管理员</em></div>
            </div>
            <ul class="user-nav clearfix">
                <li><a href="#" rel="popbox"><em class="icon-email sprices"></em>收件箱</a></li>
                <li><a href="#"><em class="icon-notes sprices"></em>系统消息</a></li>
                <li><a href="#"><em class="icon-fb sprices"></em>反馈信息</a></li>
            </ul>
            <!--notice-->
            <div class="notice clearfix">
                <h3>
                    <em class="icon-notice sprices"></em>
                    内部通知<br />
                    Internal notice
                </h3>
                <ul class="notice-list">
                    <li><em class="icon-ls sprices"></em><a href="#">公司智能终端最新版本上线通知</a><span class="time">2014-06-30</span></li>
                    <li><em class="icon-ls sprices"></em><a href="#">全体视频会议06月25日下午三点准时召开</a><span class="time">2014-06-21</span></li>
                    <li><em class="icon-ls sprices"></em><a href="#">终端操作系统培训时间上午10点进行</a><span class="time">2014-06-25</span></li>
                </ul>
            </div>
            <!--//notice-->
        </div>
    </div>
    <!--//user-->
</div>
<!--//工作台-->
<!--content-->
<div class="content clearfix" >
<!--sidebar-->
<div class="sidebar">
    <!--menu-->
    <div class="menu">
        <ul>
            <li><a href="#">首页</a></li>
            <li>
                <a href="#">系统管理</a>
                <dl class="sub-menu fid2">
                    <dt>用户管理<em class="arr arr-down"></em></dt>
                    <dd>
                        <ul class="three-directory">
                            <li><a href="#" onclick="gotoAddPage('<%=path%>/user/oldUserListView.do')">已删除用户</a></li>
                            <li><a href="#" onclick="gotoAddPage('<%=path%>/user/userPageView.do')">用户记录</a></li>
                        </ul>
                    </dd>
                    <dt>角色管理<em class="arr"></em></dt>
                    <dd>
                        <ul class="three-directory">
                            <li><a href="#"  onclick="gotoAddPage('<%=path%>/role/roleListView.do')">角色查询</a></li>
                            <li><a href="#">角色管理</a></li>
                            <li><a href="#" onclick="gotoAddPage('<%=path%>/role/oldRoleListView.do')">已经删除角色</a></li>
                        </ul>
                    </dd>
                    <dt>资源管理<em class="arr"></em></dt>
                    <dd>
                        <ul class="three-directory">
                            <li><a href="#" onclick="gotoAddPage('<%=path%>/resource/resourceListView.do')">资源列表</a></li>
                            <li><a href="#">资源访问日志</a></li>
                            <li><a href="#">角色资源关联</a></li>
                        </ul>
                    </dd>

                </dl>
            </li>


            <li>
                <a href="#">消息管理</a>
                <dl class="sub-menu fid2">
                    <dt>IM消息<em class="arr arr-down"></em></dt>
                    <dd>
                        <ul class="three-directory">
                            <li><a href="#">消息列表</a></li>
                            <li><a href="#">历史消息</a></li>
                        </ul>
                    </dd>
                    <dt>微信平台<em class="arr"></em></dt>
                    <dd>
                        <ul class="three-directory">
                            <li><a href="#">连接管理</a></li>
                            <li><a href="#">消息收取</a></li>
                            <li><a href="#">消息推送</a></li>
                        </ul>
                    </dd>

                </dl>
            </li>
        </ul>
    </div>
    <!--//menu-->
    <!--foot-nav-->
    <div class="foot-nav">
        <ul>
            <li><a href="#">关于我们</a></li>|
            <li><a href="#">意见反馈</a></li>
        </ul>
    </div>
    <!--//foot-nav-->
</div>
<!--//sidebar-->
<!--main-->
<div class="main">
    <!--收缩侧边-->
    <div class="toggle-side"></div>
    <!--//收缩侧边-->
    <!--面包屑-->
    <div class="breadcrumb">
        <span>您当前位置：</span>首页
    </div>
    <!--//面包屑-->
    <!--工作台-->
    <div class="platform clearfix" id="mainFrame">
        <!--24小时访问统计-->
        <div class="box">
            <div class="box-head">
                <h2>24小时访问统计</h2>
                <div class="baracts">
                    <a href="javascript:;" class="toggle-btn"></a>
                    <a href="javascript:;" class="close-btn"></a>
                </div>
            </div>
            <div class="box-body">
                <div class="trend-chart">
                    <img src="pictures/flat01.gif" width="100%" />
                </div>
            </div>
        </div>
        <!--//24小时访问统计-->
        <!--服务器监控-->
        <div class="box-list">
            <ul class="clearfix">
                <li class="w40">
                    <div class="p10-r">
                        <div class="box">
                            <div class="box-head">
                                <h2>服务器监控</h2>
                                <div class="baracts">
                                    <a href="javascript:;" class="toggle-btn"></a>
                                    <a href="javascript:;" class="close-btn"></a>
                                </div>
                            </div>
                            <div class="box-body">
                                <div class="pie-chart">
                                    <img src="pictures/flat02.gif" width="100%" />
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="w60">
                    <div class="box">
                        <div class="box-head">
                            <h2>服务器监控</h2>
                            <div class="baracts">
                                <a href="javascript:;" class="toggle-btn"></a>
                                <a href="javascript:;" class="close-btn"></a>
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="data-table">
                                <table width="100%" class="table">
                                    <tr class="odd">
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                    <tr class="odd">
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                    <tr class="odd">
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>1</td>
                                        <td>2</td>
                                        <td>3</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <!--//服务器监控-->
        <!--数据查询-->
        <div class="box">
            <div class="box-head">
                <h2>数据查询</h2>
                <div class="baracts">
                    <a href="javascript:;" class="toggle-btn"></a>
                    <a href="javascript:;" class="close-btn"></a>
                </div>
            </div>
            <div class="box-body">
                <!--查询条件-->

                <!--//查询条件-->
                <!--查询结果-->
                <div class="query-result-table m10-b">
                    <table width="100%" class="table">
                        <tr>
                            <th>数据类别</th>
                            <th>子数据1</th>
                            <th>子数据1</th>
                            <th>子数据1</th>
                            <th>子数据1</th>
                            <th>子数据1</th>
                            <th>子数据1</th>
                        </tr>
                        <tr>
                            <td>分类合</td>
                            <td>234</td>
                            <td>234</td>
                            <td>234</td>
                            <td>234</td>
                            <td>234</td>
                            <td>234</td>
                        </tr>
                        <tr>
                            <td>分类合</td>
                            <td>334</td>
                            <td>334</td>
                            <td>334</td>
                            <td>334</td>
                            <td>334</td>
                            <td>334</td>
                        </tr>
                        <tr>
                            <td>分类合</td>
                            <td>23</td>
                            <td>23</td>
                            <td>23</td>
                            <td>23</td>
                            <td>23</td>
                            <td>23</td>
                        </tr>
                        <tr>
                            <td>分类合</td>
                            <td>456</td>
                            <td>456</td>
                            <td>456</td>
                            <td>456</td>
                            <td>456</td>
                            <td>456</td>
                        </tr>
                        <tr>
                            <td>分类合</td>
                            <td>2467</td>
                            <td>2467</td>
                            <td>2467</td>
                            <td>2467</td>
                            <td>2467</td>
                            <td>2467</td>
                        </tr>
                    </table>
                </div>
                <!--//查询结果-->
                <!--翻页-->
                <div class="pages clearfix">
                    <div class="pages-l">共<span class="f-red1">30</span>条记录　每页显示<span class="f-red1">5</span>条记录　当前第<span class="f-red1">1/6</span>页</div>
                    <div class="pages-r">
                        <a href="#" class="first">首页</a>
                        <a href="#" class="p">上一页</a>
                        <a href="#" class="n">下一页</a>
                        <a href="#" class="last">尾页</a>
                        <em>跳转</em>
                        <input type="text" class="page-num" />
                        <em>页</em>
                        <input type="button" value="确定" class="sub-btn" />
                    </div>
                </div>
                <!--//翻页-->
            </div>
        </div>
        <!--//数据查询-->
    </div>
    <!--//工作台-->
</div>
<!--//main-->
</div>
<!--//content-->
<!--mark&pop-->
<div class='loading' style="display:none;height:25px;" id='loadingSubProduct'><em class='icon-loading'></em></div>
<div class="mark" style="display:none;"></div>
<div class="popbox" style="display:none;">
    <div class="popbox-head">
        <h2>信息提示</h2>
        <a class="pop-close" title="关闭"></a>
    </div>
    <div class="popbox-body" id="popboxBody" >
        信息提示内容。
    </div>
    <div class="popbox-foot">

        <a href="#" class="btn btn-gray popbox-close">确认</a><a href="#" class="btn btn-gray popbox-close">取消</a>
    </div>
</div>
<!--//mark&pop-->
</div>
<script type="text/javascript" src="script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="script/smart/smart.js"></script>
<script type="text/javascript" src="script/common.js"></script>
<script type="text/javascript" src="script/popbox.js"></script>
<script type="text/javascript" src="script/plugin/artDialog.js"></script>

<script>
    //hover延迟
    $(document).ready(function(){
        (function($){
            $.fn.hoverDelay = function(options){
                var defaults = {
                    hoverDuring: 300,
                    outDuring: 300,
                    hoverEvent: function(){
                        $.noop();
                    },
                    outEvent: function(){
                        $.noop();
                    }
                };
                var sets = $.extend(defaults,options || {});
                var hoverTimer, outTimer, that = this;
                return $(this).each(function(){
                    $(this).hover(function(){
                        clearTimeout(outTimer);
                        hoverTimer = setTimeout(function(){sets.hoverEvent.apply(that)}, sets.hoverDuring);
                    },function(){
                        clearTimeout(hoverTimer);
                        outTimer = setTimeout(function(){sets.outEvent.apply(that)}, sets.outDuring);
                    });
                });
            }
        })(jQuery);

        //menu
        $(".menu ul li").each(function(){
            that = $(this);
            that.hoverDelay({
                hoverEvent: function(){
                    $(this).find(".sub-menu").stop().animate({width:188},0);
                },
                outEvent: function(){
                    $(this).find(".sub-menu").stop().animate({width:0},0);
                }
            });
        });
        $(".menu ul li").each(function(e){
            $(".menu ul li").eq(e).find(".sub-menu").find("dd").eq(0).show();
        });
        $(".menu ul li").find(".sub-menu").find("dt").click(function(){
            $(this).find(".arr").toggleClass("arr-down").parent().next("dd").eq(0).slideToggle(200);
        });

        //收缩侧边
        $(".toggle-side").click(function(){
            $(this).toggleClass("toggle-side-on");
            $(".sidebar").toggle();
            $(".main").toggleClass("full");
        });

        //工作台
        $(".box .toggle-btn").click(function(){
            $(this).toggleClass("toggle-btn-down").parents(".box").find(".box-body").toggle();
        });
        $(".box .close-btn").click(function(){
            $(this).parents(".box").remove();
        });

        //popbox
        $("[rel='popbox']").click(function(){
            popPosition(".popbox");
        });
    });
</script>
</body>
</html>