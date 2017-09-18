<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#changeposition").sortable();
	});
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				testAPI();
			} else {
				// The person is not logged into your app or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		function checkLoginState() {
			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
			});
		}

		window.fbAsyncInit = function() {
			FB.init({
				appId : '1422718804473239',
				cookie : true, // enable cookies to allow the server to access 
				// the session
				xfbml : true, // parse social plugins on this page
				version : 'v2.8' // use graph api version 2.8
			});

			FB.getLoginStatus(function(response) {
				statusChangeCallback(response);
				if (response.status === 'connected') {
					console.log(response.authResponse.accessToken);
				}
			});

		};

		// Load the SDK asynchronously
		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

		 function testAPI() {
			FB.api("me/albums?fields=count, id, name", function(response) {
				var jj = JSON.stringify(response);
				var data = response["data"];
				console.log("data : "+JSON.stringify(data));

				var idList = new Array();
				var nameList = new Array();
				var countList = new Array();
				
				for (var i = 0; i < data.length; i++) {
					var obj = data[i];

					idList.push(obj.id);
					
					nameList.push(obj.name);
					console.log("name : "+obj.name);
					
					countList.push(obj.count);
					console.log("count : "+obj.count);
					
				}
					
					//화면에 앨범리스트 출력
					var html = "";
					for (var i = 0; i < idList.length; i++) {
						html += '<a href="albumList?albumName='+idList[i]+'&count='+countList[i]+'">'+ nameList[i]+'</a><br>';
					}
					document.getElementById("albumlist").innerHTML=html;
			});
		} 
	
</script>
<head>

<!-- =================================== -->
<!-- 		  COMPATIBILITY 			 -->
<!-- =================================== -->

<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- =================================== -->
<!-- 			  TITLE 			 	 -->
<!-- =================================== -->

<title>Donari - Dougani Narimashita</title>

<!-- =================================== -->
<!-- 			MORDERNIZR 			 	 -->
<!-- =================================== -->

<script src="resources/assets/js/modernizr.js"></script>

<!-- =================================== -->
<!-- 			  STYLES 				 -->
<!-- =================================== -->

<!-- BOOTSTRAP MIN -->
<link href="./resources/assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- MEDIA ELEMENT -->
<link href="./resources/assets/css/mediaelementplayer.min.css"
	rel="stylesheet" />

<!-- MAGNIFIC POPUP CSS -->
<link href="./resources/assets/css/magnific-popup.css" rel="stylesheet" />

<!-- THEME CSS -->
<link href="./resources/assets/css/style.css" rel="stylesheet" />

<!-- GOOGLE FONTS -->
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700'
	rel='stylesheet' type='text/css'>
<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300'
	rel='stylesheet' type='text/css'>

<!-- FONT AWESOME -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"
	rel="stylesheet" />

<!-- =================================== -->
<!-- 		 	THEME COLOR 			 -->
<!-- =================================== -->

<meta name="theme-color" content="#fff" />


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
<!-- 			 FACEBOOK 				 -->
<!-- =================================== -->

<meta property="og:locale" content="en" />
<meta property="og:type" content="website" />
<meta property="og:title" content="Soundcast" />
<meta property="og:description" content="Podcast Responsive Theme" />
<meta property="og:url" content="http://www.reidark.com.br/soundcast" />
<meta property="og:site_name" content="Soundcast" />
<meta property="og:image"
	content="http://www.reidark.com.br/soundcast/assets/img/facebook-og.jpg" />

<!-- =================================== -->
<!-- 			  TWITTER 				 -->
<!-- =================================== -->

<meta name="twitter:card" content="summary" />
<meta name="twitter:site" content="http://www.reidark.com.br/soundcast" />
<meta name="twitter:creator" content="@reidarking" />
<meta name="twitter:title" content="Soundcast" />
<meta name="twitter:description" content="Podcast Responsive Theme" />
<meta name="twitter:domain" content="reidark" />
<meta name="twitter:image"
	content="http://www.reidark.com.br/soundcast/assets/img/twitter-og.jpg" />

<!-- =================================== -->
<!-- 			  FAVICON 				 -->
<!-- =================================== -->

<link rel="icon" href="resources/assets/img/favicon.png" />
<link rel="shortcut icon" href="resources/assets/img/favicon.png" />
<style type="text/css">
#btn1 {
	border: none;
	background-color: #f1f1f1;
}

#btn2 {
	border: none;
	background-color: #f1f1f1;
}
</style>
</head>
<script type="text/javascript">


</script>

<body itemscope itemtype="http://schema.org/WebSite">

	<!-- ===== HEADER ===== -->
	<header class="header absolute" itemscope
		itemtype="http://schema.org/Organization">
		<div class="container">

			<!-- ===== LOGO ===== -->
			<h1 class="logo">
				<a href="index.html"><img itemprop="logo"
					src="resources/assets/img/logo.png"
					alt="Soundcast - Podcast Responsive Theme"
					title="Soundcast - Podcast Responsive Theme" /></a>
			</h1>

			<!-- ===== NAVIGATION ===== -->
			<nav class="navigation">
				<!-- ===== MENU ===== -->
				<ul class="menu">
					<li class="menuitem"><a href="index">Home</a></li>
					<li class="menuitem"><a href="podcasts.html">Contact</a></li>
					<li class="menuitem dropdown"><a href="making">Making
							Video</a>
					<li class="menuitem active"><a href="savevideo">My Page</a></li>
				</ul>
				<!-- ===== HAMBURGUER ICON ===== -->
				<a href="#" class="btn-hamburguer-menu"><i class="fa fa-bars"></i></a>
			</nav>
		</div>
	</header>

	<!-- ===== PAGE HEADER ===== -->
	<header class="page-header"
		style="background-image: url(resources/assets/img/single-background.jpg)">
		<div class="page-header-inner">
			<div class="container">

				<!-- ===== PAGE HEADER CONTENT ===== -->
				<div class="page-header-content text-center">
					<h2>Basic Making Video</h2>
				</div>

			</div>
		</div>
	</header>
	<!-- ===== ABOUT US ===== -->
	<section id="about-us" class="section-negative">
		<div class="container">

			<!-- ===== SECTION TITLE ===== -->
			<h2 class="title-default text-center">Insert Photo</h2>
			<fieldset class="row" style="margin-left: 410px;">
				<div class="col-md-9 nopadding" style="margin-bottom: 30px;">
					<input type="text" name="filepath" id=filepath
						class="form-control form-negative" id="email-newsletter"
						placeholder="file path" required
						style="width: 800px; float: right;" />
				</div>
				<input id=multiFile type="file" multiple style="display: none;">
				<img src='resources/assets/img/photos.png'
					onclick='document.all.multiFile.click(); document.all.filepath.value=document.all.multiFile.value'
					style="width: 43px; margin-bottom: 30px;"> <input
					type="image" src="resources/assets/img/facebook.png"
					onclick="facebook()" style="width: 43px;">
			</fieldset>
			<div
				style="white-space: nowrap; overflow: auto; width: 1200px; height: 500px;">
				<div class="row mb-30" style="margin-left: 85px; width: 1000px">

					<!-- ===== TEAM CARD ===== -->
					<div class="changeposition" id="changeposition">
						<div class="allteamcard">
							<!-- <div class="col-lg-4 col-lg-offset-0 "> -->
							<div class="team-cards" >
								<figure class="team-card-image" id="imageViewer">
									<img src="resources/assets/img/team/team-1.jpg" alt="John Doe"
										title="John Doe" style="float: left;" width="100px;"
										height="100px;" />
								</figure>

							</div>
						</div>


					<div class="allteamcard">
							<!-- <div class="col-lg-4 col-lg-offset-0 "> -->
							<div class="team-cards">
								<figure class="team-card-image">
									<img src="resources/assets/img/team/team-2.jpg" alt="John Doe"
										title="John Doe" style="float: left;" width="100px;"
										height="100px;" />
								</figure>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- 		<div class="arrownext">
			<center><img src="resources/assets/img/up-arrow.png" style="width: 3%"></center>
		</div>
 -->
	</section>

	<!-- ===== NEWSLETTER ===== -->
	<section class="section-positive text-center">
		<div class="container"></div>
	</section>

	<!-- ===== DONATE ===== -->
	<section id="donate" class="section-highlight text-center">
		<div class="container"></div>
	</section>

	<!-- ===== FOOTER ===== -->
	<footer class="footer">



		<!-- ===== FOOTER INFORMATION ===== -->
		<section class="footer-credits">
			<div class="container">

				<div class="row">

					<!-- ===== CREDIT LOGO ===== -->


					<!-- ===== CREDIT LOGO ===== -->
					<div class="col-sm-6 text-right">Donari - 2017. All rights
						reserved.</div>

				</div>

			</div>
		</section>

	</footer>

	<!-- =================================== -->
	<!-- 			  SCRIPTS 				 -->
	<!-- =================================== -->

	<script type="text/javascript"
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
	<script type="text/javascript"
		src="resources/assets/js/jquery.tablednd.js"></script>



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

	<!-- Drag and Drop -->
	<script src="resources/assets/js/jquery-sortable-min.js"></script>
	<script src="resources/assets/js/jquery-ui.min.js"></script>
	<script src="resources/assets/js/jquery.tablednd.js"></script>

</body>

</html>