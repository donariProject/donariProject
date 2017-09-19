<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<title>Donari - Make your video at once!</title>

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
<meta property="og:title" content="donari" />
<meta property="og:description" content="make your video at once" />
<meta property="og:url" content="http://www.donari.com" />
<meta property="og:site_name" content="Donari" />
<meta property="og:image"
	content="http://www.reidark.com.br/soundcast/assets/img/facebook-og.jpg" />


<style type="text/css">
#btn1 {
	border: none;
	background-color: #f1f1f1;
}

#btn2 {
	border: none;
	background-color: #f1f1f1;
}

input[type="file"] {
	display: block;
}

.imageThumb {
	max-height: 75px;
	border: 2px solid;
	padding: 1px;
	cursor: pointer;
}

.pip {
	display: inline-block;
	margin: 10px 10px 0 0;
}

.remove {
	display: block;
	background: #444;
	border: 1px solid black;
	color: white;
	text-align: center;
	cursor: pointer;
}

.remove:hover {
	background: white;
	color: black;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
		// This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
			console.log('statusChangeCallback');
			console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
				// Logged into your app and Facebook.
				runningAPI();
			} else {
				// The person is not logged into your app or we are unable to tell.
				document.getElementById('status').innerHTML = 'Please log '
						+ 'into this app.';
			}
		}

		// This function is called when someone finishes with the Login
		// Button.  See the onlogin handler attached to it in the sample
		// code below.
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

			// Now that we've initialized the JavaScript SDK, we call 
			// FB.getLoginStatus().  This function gets the state of the
			// person visiting this page and can return one of three states to
			// the callback you provide.  They can be:
			//
			// 1. Logged into your app ('connected')
			// 2. Logged into Facebook, but not your app ('not_authorized')
			// 3. Not logged into Facebook and can't tell if they are logged into
			//    your app or not.
			//
			// These three cases are handled in the callback function.

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

		// Here we run a very simple test of the Graph API after login is
		// successful.  See statusChangeCallback() for when this call is made.
		
		var html = "";
		var urls = new Array();
		
		function runningAPI(urls){
			var path = ${albumAdd}+"/photos?fields=picture,images&limit=1000";
			var size = 600;
			var imgCount = 0;
			callAPI(path, size, imgCount, urls);
			
		}//runningAPI
		
		function callAPI(path, size, imgCount, urls) {
			//선택한 앨범 주소에 있는 사진들 가져오기 : picture(대표사진 작은 사이즈), image(한 사진의 사이즈 배열)
			FB.api(path, function(response){
				//response 응답 확인하기
				var json = JSON.stringify(response);
		
				var data = response["data"]; //=object 배열
				
				//after 코드 가져오기
				var paging = response["paging"]; //=object 배열
				var cursors = paging["cursors"];
				var after = cursors["after"];
				
				//원하는 사이즈의 사진 배열에 담기
				urls = getPic(data, size); 
				//출력용 사진 배열
				var picUrls = urls[0];
				//전송용 사진 배열(사이즈 각각 다름)
				var pushUrls = urls[1];
				
				//이미지 수 카운팅
				imgCount += picUrls.length;
				console.log("imgCount1: "+imgCount);
				
				//화면에 이미지 출력
				drawPics(picUrls, imgCount);
			
				//다음 사진 불러오는 주소
				var path2 =${albumAdd}+"/photos?fields=picture,images&limit=1000&after="+after;
				
				if (imgCount < ${albumCount}) {
				console.log("imgCountings : " + imgCount);
				callAPI(path2, urls, imgCount);
				}
			});
		} //callAPI()
		

function getPic(data, size){
	var picUrls = new Array(); //화면에 띄워줄 사진
	var pushUrls = new Array(); //서버로 전송할 사진
	//사진 url만 추출
	for (var i = 0; i < data.length; i++) {
		var pic = data[i]; //picture 대표사진들의 배열
		var picUrl = pic["picture"]; //picture 한개 주소
		picUrls.push(picUrl);//사진 주소만 배열에 담기
		
		var images = pic["images"]; //images 배열 : 사이즈 별로 있음
	//	console.log("images: "+images);
		for (var t = 0; t < images.length; t++) {
			var img = images[t];
			if (img["height"]===size) {
				pushUrls.push(img["source"]);
				break;
			}else if (img[t] != null) {
				var img0 = images[0]
				pushUrls.push(img0["source"]);
				break;
			}
		}
	}
	return [picUrls, pushUrls];
}

function drawPics(picUrls, imgCount){
	for (var i = 0; i < picUrls.length; i++) {
		html += '<image src="'+picUrls[i]+'">';
	}
	html += "<br>picUrls count : "+imgCount+"<br>";
	document.getElementById("photos").innerHTML=html;
}

</script>
</head>

<body itemscope itemtype="http://schema.org/WebSite">

	<!-- ===== HEADER ===== -->
	<header class="header absolute" itemscope
		itemtype="http://schema.org/Organization">
		<div class="container">

			<!-- ===== LOGO ===== -->
			<h1 class="logo">
				<a href="index.html"> <img itemprop="logo"
					src="resources/assets/img/logo.png"
					alt="Donari - Make Your Video At Once!" title="Dougani Narimashita" /></a>
			</h1>

			<!-- ===== NAVIGATION ===== -->
			<nav class="navigation">
				<!-- ===== MENU ===== -->
				<ul class="menu">
					<li class="menuitem"><a href="index">Home</a></li>
					<li class="menuitem"><a href="podcasts.html">Contact</a></li>
					<li class="menuitem active dropdown"><a href="making">Making
							Video</a>
						<ul class="droplist">
							<li class="droplist-item"><a href="basicVideo">Basic
									Video</a></li>
							<li class="droplist-item"><a href="selectTemplate">Select
									Template</a></li>
						</ul>
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
				<!-- <div class="col-md-9 nopadding" style="margin-bottom: 30px;">
					<input type="text" name="filepath" 
					id=filepath class="form-control form-negative" 
					id="email-newsletter" placeholder="file path" 
					required style="width: 800px; float: right;" />
				</div> -->

				<!-- ===== FILE UPLOAD ===== -->
				<form action="fileUploads" method="post"
					enctype="multipart/form-data">
					<!-- <input id=multiFile type="file" multiple="multiple" style="display: none;"> -->
					<!-- <img src='resources/assets/img/photos.png'
					onclick='document.all.multiFile.click(); document.all.filepath.value=document.all.multiFile.value'
					style="width: 43px; margin-bottom: 30px;">  -->
					<input id="files" name="files" type="file" multiple="multiple"
						style="display: none;"> <img
						src='resources/assets/img/photos.png'
						onclick='document.all.files.click(); document.all.filepath.value=document.all.files.value'
						style="width: 43px; margin-bottom: 30px;">
					<button type="submit">사진 전송</button>
				</form>

				<!-- ===== FACEBOOK ALBUM LIST ===== -->
				<input type="image" src="resources/assets/img/facebook.png"
					onclick="testAPI()" style="width: 43px;">
				<div id="albumlist" style="width:500px;"></div>
				<div id="photos"></div>
				
				<!-- ===== FACEBOOK Login button ===== -->
				<!-- <fb:login-button scope="public_profile,email,user_photos" onlogin="checkLoginState();"></fb:login-button> -->
			</fieldset>
			<div
				style="white-space: nowrap; overflow: auto; width: 1200px; height: 500px;">
				<div class="row mb-30" style="margin-left: 85px; width: 1000px">
					<!-- ===== TEAM CARD ===== -->
					<div class="changeposition" id="changeposition">
						<div class="allteamcard">
							<!-- <div class="col-lg-4 col-lg-offset-0 "> -->
							<div class="team-cards">
								<figure class="team-card-image">
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