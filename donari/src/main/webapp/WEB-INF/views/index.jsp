<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	
	<head>

		<!-- =================================== -->
		<!-- 		  COMPATIBILITY 			 -->
		<!-- =================================== -->
		
		<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	

		<!-- =================================== -->
		<!-- 			  TITLE 			 	 -->
		<!-- =================================== -->

		<title>Soundcast - Podcast Responsive Theme</title>

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

		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />

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

		<meta name="keywords" content="soundcast, html5 template, creative template, themeforest, podcast template, podcast theme" />
		<meta name="description" content="A clean, lightweight and responsive podcast theme." />

		<!-- =================================== -->
		<!-- 			 ROBOTS 				 -->
		<!-- =================================== -->

		<meta name="GOOGLEBOT" content="INDEX, FOLLOW" />
		<meta name="robots" content="index, follow">
		<meta name="msnbot" content="NOODP" />

		<!-- =================================== -->
		<!-- 			 FACEBOOK 				 -->
		<!-- =================================== -->

		<meta property="og:locale" content="en" />
		<meta property="og:type" content="website" />
		<meta property="og:title" content="Soundcast" />
		<meta property="og:description" content="Podcast Responsive Theme" />
		<meta property="og:url" content="http://www.reidark.com.br/soundcast" />
		<meta property="og:site_name" content="Soundcast" />
		<meta property="og:image" content="http://www.reidark.com.br/soundcast/assets/img/facebook-og.jpg" />

		<!-- =================================== -->
		<!-- 			  TWITTER 				 -->
		<!-- =================================== -->

		<meta name="twitter:card" content="summary" />
		<meta name="twitter:site" content="http://www.reidark.com.br/soundcast" />
		<meta name="twitter:creator" content="@reidarking" />
		<meta name="twitter:title" content="Soundcast" />
		<meta name="twitter:description" content="Podcast Responsive Theme" />
		<meta name="twitter:domain" content="reidark" />
		<meta name="twitter:image" content="http://www.reidark.com.br/soundcast/assets/img/twitter-og.jpg" />

		<!-- =================================== -->
		<!-- 			  FAVICON 				 -->
		<!-- =================================== -->
		
		<link rel="icon" href="resources/assets/img/favicon.png" />
		<link rel="shortcut icon" href="resources/assets/img/favicon.png" />

	</head>

	<body itemscope itemtype="http://schema.org/WebSite">
		
		<!-- ===== HEADER ===== -->
		<header class="header absolute" itemscope itemtype="http://schema.org/Organization">
			<div class="container">
			
				<!-- ===== LOGO ===== -->
				<h1 class="logo"><a href="index.html"><img itemprop="logo" src="resources/assets/img/logo.png" alt="Soundcast - Podcast Responsive Theme" title="Soundcast - Podcast Responsive Theme" /></a></h1>
				
				<!-- ===== NAVIGATION ===== -->
				<nav class="navigation">
					<!-- ===== MENU ===== -->
					<ul class="menu">
						<li class="menuitem"><a href="login">Login</a></li>
						<li class="menuitem active"><a href="index">Home</a></li>
						<li class="menuitem"><a href="making">Contact</a></li>
						<li class="menuitem"><a href="making">Making Video</a></li>
						<li class="menuitem"><a href="savevideo">My Page</a></li>
					</ul>
					<!-- ===== HAMBURGUER ICON ===== -->
					<a href="#" class="btn-hamburguer-menu"><i class="fa fa-bars"></i></a>
				</nav>
				
			</div>
		</header>
		
		<!-- ===== LASTEST PODCAST (HERO) ===== -->
		<section class="podcast-hero" style="background-image: url(resources/assets/img/podcast-hero.jpg)">
			<div class="podcast-hero-inner">
			
				<!-- ===== PODCAST INFO ===== -->
				<div class="container">
						<div class="podcast-hero-content">
						<h2 class="podcast-hero-title"><a href="podcast.html"></a></h2>
					</div>
				</div>
				
				<!-- ===== PODCAST PLAYER ===== -->
				<div class="podcast-hero-player-content">
					<div class="container">
						<!-- ===== CUSTOM PLAYER ===== -->
						<audio src="resources/assets/audio/emotional.mp3"></audio>
					</div>
				</div>
				
			</div>
		</section>
		
		<!-- ===== MAIN ===== -->
		<main id="main" class="main">
			
			<!-- ===== PODCAST LIST ===== -->
			<section id="#episodes" class="section-positive">
				<div class="container">
					
					<!-- ===== SECTION TITLE ===== -->
					<h2 class="title-default">Template Introduce</h2>
					
					<div class="row">
					
						<!-- ===== PODCAST CARD FULL ===== -->
						<div class="col-sm-12 mb-40">
							<div class="podcast-card full">
								<figure class="podcast-image"><a href="podcast-soundcloud.html"><img src="resources/assets/img/cards/podcast-full-thumb.jpg" alt="Seattle" title="Seattle" /></a></figure>
								<div class="podcast-content">
									<span class="podcast-date">December 21, 2015</span>
									<h2 class="podcast-title"><a href="podcast-soundcloud.html">Episode #07 - Podcast embed from SoundCloud</a></h2>
									<p class="podcast-excerpt"><a href="podcast-soundcloud.html">This is a full card example, porro culpa minus ipsam a accusantium, cupiditate expedita accusamus, perspiciatis magni aliquid cumque facilis rerum eius. Ipsum facilis iste repudiandae ducimus accusamus...</a></p>
									<ul class="podcast-meta">
										<li class="item"><a href="#" class="podcast-tag" rel="tag">Lifestyle</a></li>
										<li class="item"><i class="fa fa-clock-o"></i> 37 mins.</li>
										<li class="item"><a href="podcast-soundcloud.html" class="podcast-play"><i class="fa fa-play"></i> Play Episode</a></li>
									</ul>
								</div>
							</div>
						</div>
						
						<div class="col-sm-12 mb-40">
							<div class="podcast-card full">
								<figure class="podcast-image"><a href="podcast-soundcloud.html"><img src="resources/assets/img/cards/podcast-full-thumb.jpg" alt="Seattle" title="Seattle" /></a></figure>
								<div class="podcast-content">
									<span class="podcast-date">December 21, 2015</span>
									<h2 class="podcast-title"><a href="podcast-soundcloud.html">Episode #07 - Podcast embed from SoundCloud</a></h2>
									<p class="podcast-excerpt"><a href="podcast-soundcloud.html">This is a full card example, porro culpa minus ipsam a accusantium, cupiditate expedita accusamus, perspiciatis magni aliquid cumque facilis rerum eius. Ipsum facilis iste repudiandae ducimus accusamus...</a></p>
									<ul class="podcast-meta">
										<li class="item"><a href="#" class="podcast-tag" rel="tag">Lifestyle</a></li>
										<li class="item"><i class="fa fa-clock-o"></i> 37 mins.</li>
										<li class="item"><a href="podcast-soundcloud.html" class="podcast-play"><i class="fa fa-play"></i> Play Episode</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-sm-12 mb-40">
							<div class="podcast-card full">
								<figure class="podcast-image"><a href="podcast-soundcloud.html"><img src="resources/assets/img/cards/podcast-full-thumb.jpg" alt="Seattle" title="Seattle" /></a></figure>
								<div class="podcast-content">
									<span class="podcast-date">December 21, 2015</span>
									<h2 class="podcast-title"><a href="podcast-soundcloud.html">Episode #07 - Podcast embed from SoundCloud</a></h2>
									<p class="podcast-excerpt"><a href="podcast-soundcloud.html">This is a full card example, porro culpa minus ipsam a accusantium, cupiditate expedita accusamus, perspiciatis magni aliquid cumque facilis rerum eius. Ipsum facilis iste repudiandae ducimus accusamus...</a></p>
									<ul class="podcast-meta">
										<li class="item"><a href="#" class="podcast-tag" rel="tag">Lifestyle</a></li>
										<li class="item"><i class="fa fa-clock-o"></i> 37 mins.</li>
										<li class="item"><a href="podcast-soundcloud.html" class="podcast-play"><i class="fa fa-play"></i> Play Episode</a></li>
									</ul>
								</div>
							</div>
						</div>
						
						<!-- ===== CHECK MORE ===== -->
						<div class="col-sm-12 mb-50">
							<a href="podcasts.html" class="btn btn-primary btn-block btn-lg">View more Template</a>
						</div>
						
					</div>
					
				</div>
			</section>
			
			
						
					
		<!-- ===== FOOTER ===== -->
		<footer class="footer">
			
			<!-- ===== FOOTER CONTENT INFORMATION ===== -->
			<section class="section-positive">
				<div class="container">
					
					<div class="row mt-70 mb-30">
						
			
			<!-- ===== FOOTER INFORMATION ===== -->
			<section class="footer-credits">
				<div class="container">
					
					<div class="row">
						
						<!-- ===== CREDIT LOGO ===== -->
						<div class="col-sm-6 footer-logo">
							<h2><a href="index.html"><img src="resources/assets/img/logo.png" alt="Soudcast - Podcast Responsive Theme" title="Soundcast - Podcast Responsive Theme" /></a></h2>
						</div>
						
						<!-- ===== CREDIT LOGO ===== -->
						<div class="col-sm-6 text-right">
							Donari - 2017. All rights reserved.
						</div>
						
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

	</body>

</html>