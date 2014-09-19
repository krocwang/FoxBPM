<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="org.foxbpm.engine.impl.entity.UserEntity" %>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
	UserEntity user = (UserEntity)request.getSession().getAttribute("user");
%>
<base href="<%=basePath%>">
<meta charset="utf-8">
<title>FoxBPM流程门户</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- #CSS Links -->
<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css">
<!-- Basic Styles -->
<link rel="stylesheet" type="text/css" media="screen" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/font-awesome.min.css">
<!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-production.css">
<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-skins.min.css">
<!-- SmartAdmin RTL Support is under construction
	 This RTL CSS will be released in version 1.5
<link rel="stylesheet" type="text/css" media="screen" href="css/smartadmin-rtl.min.css"> -->
<!-- We recommend you use "your_style.css" to override SmartAdmin
     specific styles this will also ensure you retrain your customization with each SmartAdmin update.
<link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->
<!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
<link rel="stylesheet" type="text/css" media="screen" href="css/demo.min.css">
<!-- #FAVICONS -->
<link rel="shortcut icon" href="img/favicon/favicon.ico" type="image/x-icon">
<link rel="icon" href="img/favicon/favicon.ico" type="image/x-icon">
<!-- #GOOGLE FONT -->
<!-- <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700"> -->
<!-- #APP SCREEN / ICONS -->
<!-- Specifying a Webpage Icon for Web Clip 
	 Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
<link rel="apple-touch-icon" href="img/splash/sptouch-icon-iphone.png">
<link rel="apple-touch-icon" sizes="76x76" href="img/splash/touch-icon-ipad.png">
<link rel="apple-touch-icon" sizes="120x120" href="img/splash/touch-icon-iphone-retina.png">
<link rel="apple-touch-icon" sizes="152x152" href="img/splash/touch-icon-ipad-retina.png">
<!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!-- Startup image for web apps -->
<link rel="apple-touch-startup-image" href="img/splash/ipad-landscape.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
<link rel="apple-touch-startup-image" href="img/splash/ipad-portrait.png" media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
<link rel="apple-touch-startup-image" href="img/splash/iphone.png" media="screen and (max-device-width: 320px)">
<script src="js/libs/jquery-2.0.2.min.js"></script>
<script src="js/plugin/jquery-form/jquery-form.min.js"></script>
<script src="js/libs/jquery-ui-1.10.3.min.js"></script>
<!-- #MAIN CONTENT -->
<!-- #PLUGINS -->
<!-- IMPORTANT: APP CONFIG -->
<script src="js/app.config.js"></script>
<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script> 
<!-- BOOTSTRAP JS -->
<script src="js/bootstrap/bootstrap.min.js"></script>
<!-- CUSTOM NOTIFICATION -->
<script src="js/notification/SmartNotification.min.js"></script>
<!-- JARVIS WIDGETS -->
<script src="js/smartwidgets/jarvis.widget.min.js"></script>
<!-- EASY PIE CHARTS -->
<script src="js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
<!-- SPARKLINES -->
<script src="js/plugin/sparkline/jquery.sparkline.min.js"></script> 
<!-- JQUERY VALIDATE -->
<script src="js/plugin/jquery-validate/jquery.validate.min.js"></script>
<!-- JQUERY MASKED INPUT -->
<script src="js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<!-- JQUERY SELECT2 INPUT -->
<script src="js/plugin/select2/select2.min.js"></script>
<!-- JQUERY UI + Bootstrap Slider -->
<script src="js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>
<!-- browser msie issue fix -->
<script src="js/plugin/msie-fix/jquery.mb.browser.min.js"></script>
<!-- FastClick: For mobile devices: you can disable this in app.js -->
<script src="js/plugin/fastclick/fastclick.min.js"></script>
<!-- MAIN APP JS FILE -->
<script src="js/app.min.js"></script>
<!-- Voice command : plugin -->
<script src="js/speech/voicecommand.min.js"></script>
<!-- Your GOOGLE ANALYTICS CODE Below -->
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-XXXXXXXX-X']);
  _gaq.push(['_trackPageview']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<script type="text/javascript">
	$(document).ready(function(){
		//加载用户图像 
		 $("img[name=uImg]").each(function(){
		  $(this).attr("src","/foxbpm-webapps-common/service/identity/users/<%=user.getUserId()%>/picture");
		 });
		 //添加展现左侧菜单点击显示样式
		 var url = "portal"+location.href.split('portal').splice(1).join("portal");
		 $('nav li:has(a[href="' + url + '"])').addClass("active");
		 $('body').find('> *').filter(':not(' + ignore_key_elms + ')').empty().remove();
		 // draw breadcrumb
		 drawBreadCrumb();
		 // scroll up
		 $("html").animate({
				scrollTop : 0
			}, "fast");
	});
</script>
<!-- 自定义块 -->
<script src="portal/js/foxbpm/common.js"></script>
<!-- #PLUGINS -->
		