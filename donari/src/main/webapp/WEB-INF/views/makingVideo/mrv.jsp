<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Donari - Make your video at once!</title>

<!-- =================================== -->
<!-- 			MORDERNIZR 			 	 -->
<!-- =================================== -->

<script src="resources/assets/js/modernizr.js"></script>

<!-- =================================== -->
<!-- 			  STYLES 				 -->
<!-- =================================== -->

<link rel="stylesheet" type="text/css"
	href="resources/assets/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="resources/assets/slick/slick-theme.css" />

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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="resources/assets/js/jquery-ui.min.js" type="text/javascript"></script>
<script src="resources/assets/js/jquery.bgiframe.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		initSwap();
		//$("#changeposition").sortable();
		$('#nextBtn').attr("disabled", "disabled");
		
		$('.slide').slick({
			dots : false,
			nextArrow : $('#nextBtn'),
			prevArrow : $('#previousBtn'),
			draggable : false
		});
		$("#submitBtn").click(function() {
			$.post("fileUploads", $(".form").serialzie(), function(data) {

			});
		});

		$('#musicUploadBtn').click(function(e) {
			e.preventDefault();
			$('#music').click();
		});
		
		$("#multiFile").change(function () {
		    readURL(this);
		});
		
		$('*[draggable!=true]','.slick-track').unbind('dragstart');
	});
	
	//이미지 파일 가져오는 곳
	function readURL(input) {
		var div = document.getElementById('imageArrayDiv');
		
		for(var i = 0 ; i < input.files.length; i++){
			 var reader = new FileReader();
			 reader.onload = function (e) {
	                var picFile = e.target;
	                div.innerHTML += "<img src='" + picFile.result + "' height='100px'></img>";
	                initSwap();
			 }
		        reader.readAsDataURL(input.files[i]);    
		}
		
		tt(input);
	}
	
	function musicUpload(val){
		document.getElementById('musicFileName').value=val;
		var form = document.forms.namedItem("musicUploadForm");
		var oData = new FormData(form);

		$.ajax({
			url : './musicUpload',
			processData : false,
			contentType : false,
			data : oData,
			type : 'POST',
			success : function(result) {
				$('#nextBtn').attr("disabled", false);
			}
		});
	}
	
	function initDraggable($elements) {
        $elements.draggable({
            appendTo: "body",
            helper: "clone",
            cursor: "move",
            revert: "invalid"
        });
    }
	
    function initDroppable($elements) {
        $elements.droppable({
            activeClass: "ui-state-default",
            hoverClass: "ui-drop-hover",
            accept: ":not(.ui-sortable-helper)",

            over: function(event, ui) {
                var $this = $(this);
            },
            drop: function(event, ui) {
                var $this = $(this);

                var linew1 = $(this).after(ui.draggable.clone());
                var linew2 = $(ui.draggable).after($(this).clone());
                $(ui.draggable).remove();
                $(this).remove();
                initSwap();
            }
        });
    }
    
    function initSwap() {
        initDroppable($("#imageArrayDiv img"));
        initDraggable($("#imageArrayDiv img"));
    }
    
    function tt(input){
    	
    	var form = document.getElementById('tes');

    	for (var i=0; i<input.files.length; i++){
    		form.innerHTML += '<input id="multiFile" name="files" type="file" value="'+input.files[i]+'"';
    	}

    	document.getElementById('tes').submit();
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
					<li class="menuitem active"><a href="index">Home</a></li>
					<li class="menuitem dropdown"><a href="make">Make</a>
						<ul class="droplist">
							<li class="droplist-item"><a href="mrv"
								style="fontsize: 20pt;">Music React Video</a></li>
							<li class="droplist-item"><a href="selectTemplate">Template</a></li>
						</ul></li>
					<li class="menuitem"><a href="aboutUs">About Us</a></li>
					<li class="menuitem"><a href="login">Login</a></li>
					<li class="menuitem"><a href="join">Join</a></li>
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
					<h2>Make a Music Interaction Video</h2>
				</div>

			</div>
		</div>
	</header>
	<!-- ===== ABOUT US ===== -->
	<section id="about-us" class="section-negative">
		<div class="slide">
			<div id="musicUpload">
				<!-- ===== SECTION TITLE ===== -->
				<h1 class="title-default text-center" style='font-size: 30pt'>Step
					1</h1>
				<h2 class="title-default text-center">Insert Music</h2>
				<fieldset class="row" style="margin-left: 600px;">
					<form name="musicUploadForm" action="fileUploads" method="post"
						enctype="multipart/form-data">
						<input id="music" name="music" type="file" accept="audio/mp3"
							style="display: none;"
							onchange="musicUpload(this.value);">
						<img id="musicUploadBtn"
							src='resources/assets/img/musicUploadBtn.png'> <input
							type="text" size="30" id="musicFileName" readonly="readonly">
						<button type="submit" style="display: none;"></button>
					</form>
				</fieldset>
				<button id="nextBtn" style="margin-top: 170px; margin-left: 1200px;">Next</button>
			</div>
			<div id="imageUpload">
				<!-- ===== SECTION TITLE ===== -->
				<h2 class="title-default text-center">Insert Photo</h2>
				<fieldset class="row" style="margin-top: 100px;">


					<button id="previousBtn" style="margin-left: 200px;">Previous</button>
				</fieldset>
				<fieldset class="row" style="margin-left: 410px;">
					
					<form name="tes" action="fileUploads" method="post"
						enctype="multipart/form-data">
						
					</form>
					
					<form id="imageUploadForm" action="fileUploads" method="post"
						enctype="multipart/form-data">
						<input id="multiFile" name="files" type="file" multiple="multiple"
							style="display: none;"> <img
							src='resources/assets/img/photos.png'
							onclick='document.all.multiFile.click();'
							style="width: 43px; margin-bottom: 30px;">
						<button type="submit">전송</button>
					</form>

					<input type="image" src="resources/assets/img/facebook.png"
						onclick="facebook()" style="width: 43px;">
				</fieldset>
				<div
					style="white-space: nowrap; overflow: auto; width: 1200px; height: 500px;">
					<div class="row mb-30 image" style="margin-left: 85px; width: 1000px">
						<!-- 업로드된 다중 이미지가 들어가는 div -->
						<div id="imageArrayDiv">
						</div>
					</div>
				</div>
			</div>
		</div>
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
		src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript"
		src="resources/assets/slick/slick.min.js"></script>


	<script type="text/javascript"
		src="resources/assets/js/jquery.tablednd.js"></script>


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

	<!-- FILEUPLOAD -->
	<script src="resources/assets/js/fileupload.js"></script>

	<!-- Drag and Drop -->
	<script src="resources/assets/js/jquery-sortable-min.js"></script>

</body>

</html>