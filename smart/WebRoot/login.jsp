<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>

  <% String path = request.getContextPath();%>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>枣阳市规划建设联动平台</title>
	<link rel="stylesheet" href="css/reset.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<link rel="stylesheet" href="css/skins/idialog.css"/>
<script src="<%=path%>/jquery/jquery-1.6.2.js"></script>
 <script src="<%=path%>/jquery/artDialog.js"></script>
	<script type="text/javascript" src="<%=path%>/js/clouds.js"></script>
	<script>
		var liWidth;
		var flag=true;
		var delay=5000;
		function init(){
			$('.sliderOuter ul').attr('style','');
			$('.sliderOuter li').attr('style','');
			$('.sliderOuter .target a').removeClass().eq(0).addClass('cur');
		    liWidth=$(window).width();
			var liHeight=$(window).height();
			var $li=$('.sliderOuter').find('li');
			$('.sliderOuter').css('height',liHeight-88);
			$li.css('width',liWidth);
			$li.css('height',liHeight);
			$alink=$('.target').find('a');
			$alink.click(function(){
				$alink.removeClass();
				$(this).attr('class','cur');
				var page=$(this).index();
				$('.sliderOuter').find('ul').stop().animate({marginLeft:-liWidth*page},600);
			})
			$alink.hover(function(){ flag=false },function(){ flag=true })	
			timerun=setInterval('autorun('+$li.size()+')',delay);
		}
		function autorun(num){
			if(!flag) return false;
			var $alink=$('.target').find('a');
			var $ul=$('.sliderOuter').find('ul');
			$alink.each(function(i){ if( $(this).attr('class')=='cur' ){ page=i }  });					
			page=page+1;
			if(page==num){ page=0 }	
			$ul.animate({marginLeft:-liWidth*page},500);
			$alink.removeClass().eq(page).addClass('cur') 
		}
		$(function(){	
			init();
			$(window).resize(function(){
				clearInterval(timerun);
				init();
			})
		})
		
		function getErrMessage(){
			var value=document.getElementById("errMessage").value;
			if(value!=""){
			
				 var dialog=artDialog({title:"系统提示", content: "<img src='css/skins/icons/error.png' width='48' height='48' /><font>"+value+"</font>",   width: '150',
	height: '100',   icon: 'succeed', style:'alert', lock:true}, function(){});
				 dialog.lock().time(2);
			}
			
		}
	</script>

</head>
<body onload="getErrMessage()"> 
<input type="hidden" id="errMessage" value="${errMessage}">
<form  action="<%=path %>/j_spring_security_check" id="loginFrom" name="loginFrom" method="post">
	<div class="head"><span></span></div>
	<div class="content">
		 <div class="sliderOuter" style="">
			<ul>
			    <li><img src="image/adv1.jpg" alt="" /></li>
			    <li><img src="image/adv2.jpg" alt="" /></li>
				<li><img src="image/adv3.jpg" alt="" /></li>
				<li><img src="image/adv4.jpg" alt="" /></li>
			<!-- <li><img src="images/loginbg.jpg" alt="" /></li> -->
			</ul>
			<div class="target">
				<a class="cur" href="javascript:void(0)"></a>
				<a href="javascript:void(0)"></a>
				<a href="javascript:void(0)"></a>
				<a href="javascript:void(0)"></a>
			</div>
        </div>
		<div class="loginBox">
			<h2>欢迎使用枣阳市规划建设联动平台</h2>
			
			<ul>
				<li><input class="text" type="text" id="j_username" name="j_username" value=" 手机号/用户名/邮箱"/></li>
				<li><input class="text" type="password" id="j_password" name="j_password"/><span id="passtip">请输入您的密码</span></li>
				<!--  <li class="clearfix"><label class="fl"><input type="checkbox"/>&nbsp;下次自动登录</label><a class="fr" href="">忘记密码?</a></li>-->
				</br>
				<li><input class="btn_login" type="button" onclick="butSumbit()"/></li>
			</ul>
		</div>
	</div> 
	   </form>
</body>
 <script>
 
 $("#loginFrom").keydown(function(e){
	 var e = e || event,
	 keycode = e.which || e.keyCode;
	 if (keycode==13) {
	  $(".btn_login").trigger("click");
	 }
	});
    function butSumbit(){
    		document.loginFrom.submit();
    	}
    
    function LoginTimeOut(){
    	
    }
    
    </script>
</html>
