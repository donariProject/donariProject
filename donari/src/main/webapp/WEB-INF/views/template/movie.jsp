<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<!-- =================================== -->
<!-- 	        	  MOVIE 			 -->
<!-- =================================== -->
	
<head>

<!-- =================================== -->
<!-- 		  COMPATIBILITY 			 -->
<!-- =================================== -->

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- =================================== -->
<!-- 			  TITLE 			 	 -->
<!-- =================================== -->

<title>Donari</title>

<!-- =================================== -->
<!-- 			MORDERNIZR 			 	 -->
<!-- =================================== -->

<script src="resources/assets/js/modernizr.js"></script>

<!-- =================================== -->
<!-- 			  STYLES 				 -->
<!-- =================================== -->

<!-- BOOTSTRAP MIN -->
<link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- MEDIA ELEMENT -->
<link href="resources/assets/css/mediaelementplayer.min.css" rel="stylesheet" />

<!-- MAGNIFIC POPUP CSS -->
<link href="resources/assets/css/magnific-popup.css" rel="stylesheet" />

<!-- THEME CSS -->
<link href="resources/assets/css/style.css" rel="stylesheet" />

<!-- GOOGLE FONTS -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300' rel='stylesheet' type='text/css'>

<!-- FONT AWESOME -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

<!-- ANIMATE -->
<link href="resources/assets/css/animate.css" rel="stylesheet">

<!-- SLICK -->
<link href="resources/assets/slick/slick.css" rel="stylesheet"/>

<!-- =================================== -->
<!-- 		 	THEME COLOR 			 -->
<!-- =================================== -->

<meta name="theme-color" content="#fff" />

<!-- =================================== -->
<!-- 			CONDITIONAL 			 -->
<!-- =================================== -->

<!--[if lt IE 9]>
			<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
			<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

<!-- =================================== -->
<!-- 			 VIEWPORT 				 -->
<!-- =================================== -->

<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />

<!-- =================================== -->
<!-- 			  AUTHOR 				 -->
<!-- =================================== -->

<meta name="author" content="reidark" />
<meta name="reply-to" content="support@reidark.com.br" />
<meta name="DC.publisher" content="reidark" />
<meta name="generator" content="Brackets" />

<!-- =================================== -->
<!-- 			 CONTENT 				 -->
<!-- =================================== -->

<meta name="keywords"
	content="soundcast, html5 template, creative template, themeforest, podcast template, podcast theme" />
<meta name="description"
	content="A clean, lightweight and responsive podcast theme." />

<!-- =================================== -->
<!-- 			 ROBOTS 				 -->
<!-- =================================== -->

<meta name="GOOGLEBOT" content="INDEX, FOLLOW" />
<meta name="robots" content="index, follow">
<meta name="msnbot" content="NOODP" />

<!-- =================================== -->
<!-- 			  FAVICON 				 -->
<!-- =================================== -->

<link rel="icon" href="resources/assets/img/favicon.png" />
<link rel="shortcut icon" href="resources/assets/img/favicon.png" />


</head>

<body itemscope itemtype="http://schema.org/WebSite">

	<!-- ===== HEADER ===== -->
	<header class="header sticky scrolling" data-offset="60" itemscope itemtype="http://schema.org/Organization">
		<div class="container">
			<!-- ===== LOGO ===== -->
			<h1 class="logo">
				<a href="index"><img itemprop="logo" src="resources/assets/img/logo.png" alt="Donari" title="Donari" /></a>
			</h1>
			<!-- ===== NAVIGATION ===== -->
			<nav class="navigation">
				<!-- ===== MENU ===== -->
				<ul class="menu">
					<li class="menuitem"><a href="index">Home</a></li>
					<li class="menuitem dropdown active"><a href="make">Make</a>
						<ul class="droplist">
							<li class="droplist-item"><a href="mrv" style="fontsize: 20pt;">Music React Video</a></li>
							<li class="droplist-item"><a href="selectTemplate">Template</a></li>
						</ul></li>
					<li class="menuitem"><a href="aboutUs">About Us</a></li>
					<li class="menuitem"><a href="login">Login</a></li>
					<li class="menuitem"><a href="join">Join</a></li>
					<li class="menuitem"><a href="myPage">My Page</a></li>
				</ul>
				<!-- ===== HAMBURGUER ICON ===== -->
				<a href="#" class="btn-hamburguer-menu"><i class="fa fa-bars"></i></a>
			</nav>
		</div>
	</header>

	<!-- ===== MAIN ===== -->
	<main class="main"> 
	<!-- ===== PAGE HEADER ===== --> 
	<header class="page-header" id="vpHeader" >
		<div class="page-header-inner">
			<div class="container" style="position: relative;">

				<!-- ===== PAGE HEADER CONTENT 페이지 타이틀 ===== -->
				<div class="page-header-content text-center" style="position: relative;">
					<h2 style="margin-top: 20px;">Movie</h2>
				</div>
			</div>
		</div>
	</header> 

	<div class="template-container">
		<div class="sliderbtn slick-prev"><p style="text-align: center; vertical-align: middel;"><i class="fa fa-angle-double-left fa-3x"></i></p></div>
			<form action="changeImg" method="post" enctype="multipart/form-data">
		<div class="templates" id="imgBoard">
			<input class="imgsection" id="reimg" name="files" type="file" style="display: none;">
			
			<c:forEach varStatus="s" items="${botari}" var="pic">
				<div style="display: block;">
					<img src="${pic}" id="mvimg${s.index}" class="realimg" onclick="gogo('mvimg${s.index}');" style="z-index vertical-align: middle; text-align: center; margin: auto auto;">
					<input type="hidden" name="s" value="${s.index}">
					<input type=text id="content${s.index}" value='insert subtitles' onchange="eedit(this.value, ${s.index});" contentEditable="true" style="background-color: transparent;  font-size: 40pt;"/>
				
					<c:if test="${s.index}==${s.end}">
					<input type="button" value="make it" id="makeit" onclick="toMakeIt();">
					</c:if>
				</div>
			</c:forEach>
			
		</div>
			</form>
		<div class="sliderbtn slick-next"><p style="text-align: center; vertical-align: middle;"><i class="fa fa-angle-double-right fa-3x"></i></p></div>
	</div>
	
	</main>

	<!-- ===== FOOTER ===== -->
	<footer class="footer">

		<!-- ===== FOOTER CONTENT INFORMATION ===== -->
		<section class="section-positive">
			<div class="container">
				<div class="mt-70 mb-30">
					<!-- ===== SITEMAP ===== -->
					<div class="col-sm-3 mb-40">
						<h2 class="title-separator white">Sitemap</h2>
						<ul class="footer-list">
							<li><a href="index">Home</a></li>
							<li><a href="make">Make</a></li>
							<li><a href="mvr">Music React Video</a></li>
							<li><a href="selectTemplate">Template</a></li>
							<li><a href="aboutUs">About Us</a></li>
						</ul>
					</div>

					<!-- ===== PODCASTS EPISODES ===== -->
					<div class="col-sm-3 mb-40">
						<h2 class="title-separator white">Lastest Episodes</h2>
						<ul class="footer-complement">
							<li><a href="podcast.html">#08 - Our vacations have been so amazing!</a> <span>December 22, 2015</span></li>
							<li><a href="podcast-soundcloud.html">#07 - Podcast embed from SoundCloud</a> <span>December 21, 2015</span></li>
						</ul>
					</div>

					<!-- ===== PODCASTS EPISODES ===== -->
					<div class="col-sm-3 mb-40">
						<h2 class="title-separator white">Who is helping?</h2>
						<ul class="footer-complement">
							<li><a href="#">@reidarking</a> <span>Donation - U$ 10</span></li>
							<li><a href="#">@reidarking</a> <span>Donation - U$ 5</span></li>
							<li><a href="#">@reidarking</a> <span>Donation - U$ 50</span></li>
						</ul>
					</div>

					<!-- ===== SOCIAL CONNECTION ===== -->
					<div class="col-sm-3 mb-40">
						<h2 class="title-separator white">We are social</h2>
						<ul class="social-list">
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-instagram"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-google-plus"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-soundcloud"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-pinterest"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-youtube"></i></a></li>
							<li class="social-item"><a href="#" target="_blank"><i class="fa fa-spotify"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
		</section>

		<!-- ===== FOOTER INFORMATION ===== -->
		<section class="footer-credits">
			<div class="container">
				<div class="row">
					<!-- ===== CREDIT LOGO ===== -->
					<div class="col-sm-6 footer-logo">
						<h2><a href="index"><img src="resources/assets/img/logo.png" alt="Donari" title="Donari" /></a></h2>
					</div>
					<!-- ===== CREDIT LOGO ===== -->
					<div class="col-sm-6 text-right">Donari - 2017. All rights reserved.</div>
				</div>
			</div>
		</section>

	</footer>

	<!-- =================================== -->
	<!-- 			  SCRIPTS 				 -->
	<!-- =================================== -->

	<!-- JQUERY -->
	<script src="resources/assets/js/jquery-1.11.min.js"></script>

	<!-- BOOTSTRAP JS -->
	<script src="resources/assets/js/bootstrap.min.js"></script>

	<!-- MEDIA ELEMENT -->
	<script src="resources/assets/js/mediaelement-and-player.min.js"></script>

	<!-- MAGNIFIC POPUP -->
	<script src="resources/assets/js/magnific-popup.min.js"></script>

	<!-- FORM VALIDATE -->
	<script src="resources/assets/js/validate.min.js"></script>

	<!-- PLACEHOLDER FOR IE -->
	<script src="resources/assets/js/placeholder.min.js"></script>

	<!-- THEME JS -->
	<script src="resources/assets/js/main.js"></script>
	
	<!-- SLICK -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script src="resources/assets/slick/slick.js"></script>
	
	
	<!-- IMAGE CHANGE SCRIPT -->
	<script type="text/javascript">

	var clicked;
	
	function gogo(mvimg){
		document.getElementById('reimg').click();
		clicked=mvimg;
		
	}
	
	$(document).ready(function(){
		
		$('.templates').slick({
			accessibility : true,
			arrows: true,
			autoplay : false,
			speed : 100, 
			infinite: false,
			slidesToShow: 1,
			slidesToScroll: 1,
			fade: false,
			draggable: false,
			prevArrow: '.slick-prev', //prev 버튼
		    nextArrow: '.slick-next' //netx 버튼
		});
		
		
		$("#reimg").change(function () {
			var form = $("#reimg");
			var formData = new FormData(form);
			formData.append('files', $('input[type=file]')[0].files[0]);
			formData.append('index', clicked);
			
			$.ajax({
		        // Your server script to process the upload
		        url: 'reupload',
		        type: 'POST',

		        // Form data
		        data: formData,

		        // Tell jQuery not to process data or worry about content-type
		        // You *must* include these options!
		        cache: false,
		        contentType: false,
		        processData: false,

		        // Custom XMLHttpRequest
		        xhr: function() {
		            var myXhr = $.ajaxSettings.xhr();
		            if (myXhr.upload) {
		                // For handling the progress of the upload
		                myXhr.upload.addEventListener('progress', function(e) {
		                    if (e.lengthComputable) {
		                        $('progress').attr({
		                            value: e.loaded,
		                            max: e.total,
		                        });
		                    }
		                } , false);
		            }
		            return myXhr;
		        },
		        success : function(result){
					//document.getElementById(""+clicked).src=result+ new Date().getTime();
					$("#"+clicked).attr('src', '');
		        	d = new Date();
		        	$("#"+clicked).attr("src", result+"?"+d.getTime());
				}
		    });
		});
		
	  });

	
	function eedit(val, id){
		
		var editables = document.querySelector('#content'+id);
		
		var form = $("#reimg");
		var formData = new FormData(form);
		formData.append('subtitles', val);
		formData.append('index', id);
	    
	      $.ajax({
		        // Your server script to process the upload
		        url: 'subs',
		        type: 'POST',

		        // Form data
		        data: formData,

		        // Tell jQuery not to process data or worry about content-type
		        // You *must* include these options!
		        cache: false,
		        contentType: false,
		        processData: false,

		        // Custom XMLHttpRequest
		        xhr: function() {
		            var myXhr = $.ajaxSettings.xhr();
		            if (myXhr.upload) {
		                // For handling the progress of the upload
		                myXhr.upload.addEventListener('progress', function(e) {
		                    if (e.lengthComputable) {
		                        $('progress').attr({
		                            value: e.loaded,
		                            max: e.total,
		                        });
		                    }
		                } , false);
		            }
		            return myXhr;
		        },
		        success : function(result){
		        	alert(result);
				}
		    });
	}
	
	function toMakeIt(){
		location.herf="makeit";
	}
	
	
</script>
</body>

</html>