<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

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

<body itemscope itemtype="http://schema.org/WebSite" style="background-color: #110f16">

	

	<!-- ===== MAIN ===== -->
	<main class="main"> 
	<!-- ===== PAGE HEADER ===== --> 
	<header class="page-header" id="vpHeader" >
		<div class="page-header-inner">
			<div class="container" style="position: relative;">

			</div>
		</div>
	</header> 
	
	<!-- ===== UPLOAD IMAGES ===== -->
	<div class="container" style="text-align: center;">
	<div style="display: inline-block;">
		
	</div>
	
	<div style="display: inline-block;">

	</div>
	</div>
	</main>



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
	
	<link rel = "stylesheet" href="resources/assets/css/pace-theme-center-circle.css" />
	<script data-pace-options='{ "elements": { "selectors": ["#image"] }, "startOnPageLoad": false }' src= "resources/assets/js/pace.js"></script>
	<script src= "resources/assets/js/jquery-3.2.1.min.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
	        url: 'load',
	        type: 'GET',
	       
			beforeSend:function(){
				initDestroyTimeOutPace();
				Pace.start();
		    },
		    complete:function(){
		        $('.loadingScreen').addClass('display-none');
		    },
		    error:function(e){
		     	alert('fail');
		    },
 			success: function(result){
				location.href="loaded";
			},
		})
		
		
	});
	
	var initDestroyTimeOutPace = function() {
	    var counter = 0;

	    var refreshIntervalId = setInterval( function(){
	        var progress; 

	        if( typeof $( '.pace-progress' ).attr( 'data-progress-text' ) !== 'undefined' ) {
	            progress = Number( $( '.pace-progress' ).attr( 'data-progress-text' ).replace("%" ,'') );
	        }

	        if( progress === 99 ) {
	            counter++;
	        }

	        if( counter > 50 ) {
	            clearInterval(refreshIntervalId);
	            Pace.stop();
	        }
	    }, 100);
	}
	</script>
</body>

</html>