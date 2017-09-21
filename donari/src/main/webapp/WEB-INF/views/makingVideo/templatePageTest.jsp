<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Slick Test</title>

    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
    <link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />

</head>
<body>

<div class="multiple-items">

  <div><h3>1<img alt="slickTest" src="resources/assets/img/gallery/large/image-1.jpg"></h3></div>

  <div><h3>2<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>3<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>4<img alt="slickTest" src="resources/assets/img/gallery/large/image-1.jpg"></h3></div>

  <div><h3>5<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>6<img alt="slickTest" src="resources/assets/img/gallery/large/image-3.jpg"></h3></div>

</div>
<div class="multiple-items-nav">

  <div><h3>1<img alt="slickTest" src="resources/assets/img/gallery/large/image-1.jpg"></h3></div>

  <div><h3>2<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>3<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>4<img alt="slickTest" src="resources/assets/img/gallery/large/image-1.jpg"></h3></div>

  <div><h3>5<img alt="slickTest" src="resources/assets/img/gallery/large/image-2.jpg"></h3></div>

  <div><h3>6<img alt="slickTest" src="resources/assets/img/gallery/large/image-3.jpg"></h3></div>

</div>

<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="resources/assets/js/slick.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
       $('.multiple-items').slick({
          autoplay: true, //자동슬라이드
          slidesToShow: 1, //큰이미지 몇개 보여줄것인지
          slidesToScroll: 1,
          arrows: true,
          fade: false,
          asNavFor: '.multiple-items-nav',
       });
       $('.multiple-items-nav').slick({
          slidesToShow: 5, //작은이미지 몇개 보여줄것인지..
          slidesToScroll: 1,
          asNavFor: '.multiple-items',
          focusOnSelect: true,
       });
    });
 </script> 
</body>
</html>