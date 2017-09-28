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

	<style type="text/css" >
	.wrap-loading{ /*화면 전체를 어둡게 합니다.*/
	    position: fixed;
	    left:0;
	    right:0;
	    top:0;
	    bottom:0;
	    background: rgba(0,0,0,0.2); /*not in ie */
	    filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');    /* ie */
	}
	    .wrap-loading div{ /*로딩 이미지*/
	        position: fixed;
	        top:50%;
	        left:50%;
	        margin-left: -21px;
	        margin-top: -21px;
	    }
	    .display-none{ /*감추기*/
	        display:none;
	    }
	</style>

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
	
	<div class="wrap-loading display-none">
	    <div><img src="resources/assets/img/loading1.svg" /></div>
	</div>


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
	
	
	<script type="text/javascript">
	
	$(document).ready(function() {
		//어느 템플릿 용 사진이 올라왔는지 확인
		var cmds = '${cmd}';
		var width = '${width}';
		var height = '${height}';
		alert(cmds);
		
		//ajax로 메소드 실행하는 동안 로딩 gif 띄워주기
		$.ajax({
			url: 'load',
	        type: 'GET',
	       	data:{
	       		cmd : cmds,
	       		width : width,
	       		height : height
	       	},
			beforeSend:function(){
				$('.wrap-loading').removeClass('display-none');
		    },
		    complete:function(){
		    	$('.wrap-loading').addClass('display-none');
		    },
		    error:function(e){
		     	alert('fail');
		    },
			success: function(result){
			location.href="loaded?cmd="+result;
			}
		    ,timeout:100000
		});

		
	});
	
	/* var initDestroyTimeOutPace = function() {
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
	} */
	</script>
</body>

</html>