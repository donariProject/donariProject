<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>Donari - Make your video at once!</title>

<!-- =================================== -->
<!--          MORDERNIZR               -->
<!-- =================================== -->

<script src="resources/assets/js/modernizr.js"></script>

<!-- =================================== -->
<!--            STYLES              -->
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
<!--           THEME COLOR           -->
<!-- =================================== -->

<meta name="theme-color" content="#fff" />

<!-- =================================== -->
<!--           VIEWPORT              -->
<!-- =================================== -->

<meta name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />


<!-- =================================== -->
<!--           ROBOTS              -->
<!-- =================================== -->

<meta name="GOOGLEBOT" content="INDEX, FOLLOW" />
<meta name="robots" content="index, follow">
<meta name="msnbot" content="NOODP" />

<!-- =================================== -->
<!--           FACEBOOK              -->
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
<script src="resources/assets/js/jquery-ui.min.js"
   type="text/javascript"></script>
<script src="resources/assets/js/jquery.bgiframe.js"
   type="text/javascript"></script>
<script type="text/javascript">
   function facebook() {

      var win = window.open("albumWindow", "", "fullscreen");
      var winClosed = setInterval(function() {

         if (win.closed) {
            clearInterval(winClosed);
            location.assign("faceUploads"); //Execute your code here
         }

      }, 250);
   }

   $(function() {
      initSwap();
      //$("#changeposition").sortable();
      $('#nextBtn').attr("disabled", "disabled");

      $('.slide').slick({
         dots : false,
         nextArrow : $('#nextBtn'),
         prevArrow : $('#previousBtn'),
         draggable : false,
         infinite : false
      });

      $("#submitBtn").click(function() {
         $.post("fileUploads", $(".form").serialzie(), function(data) {
         });
      });

      $("#ok").click(function() {
         imageUpload(fileList);
      });

      $('#musicUploadBtn').click(function(e) {
         e.preventDefault();
         $('#music').click();
      });

      $("#multiFile").change(function() {
         readURL(this);
      });

      $('*[draggable!=true]', '.slick-track').unbind('dragstart');

   });

   var fileList;

   //이미지 파일 가져오는 곳
   function readURL(input) {
      var div = document.getElementById('imageArrayDiv');
      var html = "";
      var count = 0;
      fileList = input;

      for (var i = 0; i < fileList.files.length; i++) {
         var reader = new FileReader();
         reader.onload = function(e) {
            var picFile = e.target;
            html += "<div style= 'width: 134px;display=inline-block'><img id='"+count+"' src='" + picFile.result + "'width='134px' height='100px'></img></div>";
            div.innerHTML = html;
            initSwap();
            count++;
         }
         reader.readAsDataURL(fileList.files[i]);
      }
   }

   function initDivs() {
      var count = 0;
      var myVar = document.querySelectorAll('#imageArrayDiv img');
      w
      for (var i = 0; i < fileList.files.length; i++) {
         var reader = new FileReader();
         reader.onload = function(e) {
            var div = myVar[count];
            var picFile = e.target;
            if (picFile.result != div.src) {
               var temp = fileList.files[count];
               for (var j = 0; j < fileList.files.length; j++) {
                  var div2 = myVar[j];
                  if (picFile.result == div2.src) {
                     fileList.files[count] = fileList.files[j];
                     fileList.files[j] = temp;
                  }
               }
            }
            count++;
         }
         reader.readAsDataURL(fileList.files[i]);
      }

      for (var i = 0; i < fileList.files.length; i++) {
         var reader = new FileReader();
         reader.onload = function(e) {
            var picFile = e.target;
         }
         reader.readAsDataURL(fileList.files[i]);
      }
   }

   function imageUpload(mfiles) {
      var files = mfiles.files;
      var ajaxData = new FormData();
      $.ajax({
         url : './fileUploads',
         processData : false,
         contentType : false,
         data : mfiles,
         type : 'POST',
         success : function(result) {
            alert('성공');
         },
         error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:"
                  + request.responseText + "\n" + "error:" + error);
         }
      });
   }

   function musicUpload(val) {
      document.getElementById('musicFileName').value = val;
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
         appendTo : "body",
         helper : "clone",
         cursor : "move",
         revert : "invalid"
      });
   }

   function initDroppable($elements) {
      $elements.droppable({
         activeClass : "ui-state-default",
         hoverClass : "ui-drop-hover",
         accept : ":not(.ui-sortable-helper)",

         over : function(event, ui) {
            var $this = $(this);
         },
         drop : function(event, ui) {
            var $this = $(this);

            var linew1 = $(this).after(ui.draggable.clone());
            var linew2 = $(ui.draggable).after($(this).clone());
            $(ui.draggable).remove();
            $(this).remove();
            initSwap();
            initDivs();
         }
      });
   }

   function initSwap() {
      initDroppable($("#imageArrayDiv img"));
      initDraggable($("#imageArrayDiv img"));
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


         <div id="musicUpload" class="container">
            <!-- ===== SECTION TITLE ===== -->
            <div id="stepSection" style="margin-top: 30px;">
               <p class="title-default text-center"
                  style="text-decoration: underline; font-size: 36pt">Step 1</p>
            </div>
            <!-- <fieldset class="row mt-60 mb-30"> -->
            <div id="musicSection" class="container">
               <div style="width: 500px; float: left; margin-left: 55px;">
                  <img src='resources/assets/img/Step1.png'
                     style="width: 700px; height: 600px; max-height: 600px;">
               </div>
               <div id="background">
                  <div id="insertMusic" style="margin-top: 80px;">
                     <h1 class="title-default text-center">-Insert Music-</h1>
                  </div>
                  <form name="musicUploadForm" action="fileUploads" method="post"
                     enctype="multipart/form-data" style="float: left;">
                     <input id="music" name="music" type="file" accept="audio/mp3"
                        style="display: none;" onchange="musicUpload(this.value);">
                     <div>
                        <img id="musicUploadBtn"
                           src='resources/assets/img/musicUploadBtn.png'
                           style="float: left; margin-top: 90px;">
                     </div>
                     <div>
                        <input type="text" size="30" id="musicFileName"
                           readonly="readonly"
                           style="border: solid black thin 3px; margin-top: 20px;">
                     </div>
                     <button type="submit" style="display: none; float: left;"></button>
                  </form>
               </div>
               <button id="nextBtn"
                  style="margin-top: 130px; margin-left: 450px;margin-bottom:30px; background-color: #f1f1f1; display: none;">
                  <i class="fa fa-arrow-right fa-4x"></i>
               </button>
            </div>

            <!--    </fieldset> -->
         </div>

            <!-- ===== SECTION TITLE ===== -->
            <div>
            <div id="stepSection" style="margin-top: 10px;" calss="container">
               <p class="title-default text-center"
                  style="text-decoration: underline; font-size: 36pt">Step2</p>
            </div>
            <!-- <fieldset class="row mt-60 mb-30"> -->

            <div class="imageSection" style="margin-top: 30px;">
               <button id="previousBtn"
                  style="margin-left: 200px; background: #f1f1f1; float: left; margin-top: 450px;">
                  <i class="fa fa-arrow-left fa-4x"></i>
               </button>
               </fieldset>

               <div id="musicSection" class="container">
                  <div style="width: 500px; float: left; margin-left: 55px;">
                     <img src='resources/assets/img/Step2.png'
                        style="width: 700px; height: 600px; max-height: 600px;">
                  </div>
                  <h1 class="title-default text-center">-Insert Photo-</h1>
                  <fieldset class="row" style="margin-left: 410px;"></fieldset>
                  <!-- <div
               style="white-space: nowrap; overflow: auto; width: 1200px; height: 500px;"> -->
                  <div class="row mb-30 image"
                     style="margin-left: 85px; width: 1000px;" align="left">
                     <!-- 업로드된 다중 이미지가 들어가는 div -->
                     <div id="scroll"
                        style="height: 480px; width: 450px; margin-left: 20px; margin-top: 20px; overflow-y: auto">
                        <div id="imageArrayDiv"
                           style="display: inline-block; width: 400px"></div>
                     </div>
                  <div id="imageUpload">
                        <form id="imageUploadForm" action="fileUploads" method="post"
                           enctype="multipart/form-data" style="width: 44px; float: left;">
                           <input id="multiFile" name="files" type="file" multiple
                              accept="image/*" style="display: none;"> <img
                              src='resources/assets/img/photos.png'
                              onclick='document.all.multiFile.click();'
                              style="width: 43px; margin-bottom: 30px;">
                              <button type="submit" style="">전송</button>
                        </form>
                        <div>
                           <input type="image" src="resources/assets/img/facebook.png"
                              onclick="facebook()" style="width: 43px; float: left;">
                        </div>
                     </div>
                  </div>
                  <div class="col-sm-2 mb-30 podcast-meta-element">
                     <span id="ok" class="podcast-meta-item"><i
                        class="fa fa-paper-plane"></i></span>
                  </div>
                  <!-- <button id="ok">진짜전송</button>
                   -->
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
   <!--            SCRIPTS              -->
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