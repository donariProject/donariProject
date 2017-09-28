<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel = "stylesheet" href="resources/assets/css/pace-theme-center-atom.css" />
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


<script data-pace-options='{ "elements": { "selectors": ["#image"] }, "startOnPageLoad": false }' src= "resources/assets/js/pace.js"></script>


<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<body>


   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

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
            appId : '1859281367719194',
            cookie : true, // enable cookies to allow the server to access 
            // the session
            xfbml : true, // parse social plugins on this page
            version : 'v2.10' // use graph api version 2.8
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

            console.log("data : " + JSON.stringify(data));

            var idList = new Array();
            var nameList = new Array();
            var countList = new Array();

            for (var i = 0; i < data.length; i++) {
               var obj = data[i];

               idList.push(obj.id);
               console.log("id : " + obj.id);

               nameList.push(obj.name);
               console.log("name : " + obj.name);

               countList.push(obj.count);
               console.log("count : " + obj.count);

            }

            //?붾㈃???⑤쾾由ъ뒪??異쒕젰
            var html = "";
            for (var i = 0; i < idList.length; i++) {
               html += '<a id="button"' + i + ' onclick="getPhotoFromAlbum(\'' + idList[i] + '/photos?fields=picture,images&limit=100\');">' + nameList[i] +'</a>'
                  

               //html += '<a href="albumList?albumName='+idList[i]+'&count='+countList[i]+'">'+ nameList[i]+'</a><br>';
            }
            document.getElementById("albumlist").innerHTML = html;
         });
      }
      

      var imgCount = 0;
      var html = "";
      
      function getPhotoFromAlbum(url) {
         
         FB.api(url, function(response) {
                var data = response["data"]; //=object 諛곗뿴

                  console.log(JSON.stringify(response));   
                  console.log("data : "+data.toString());   
                //after 肄붾뱶 媛 ?몄삤湲?                  
                  var paging = response["paging"];
                  var next = paging["next"]; //=object 諛곗뿴
                     
                     urls = getPic(data, 1080);
                     //異쒕젰???ъ쭊 諛곗뿴
                     var picUrls = urls[0];
                     //?꾩넚???ъ쭊 諛곗뿴(?ъ씠利?媛곴컖 ?ㅻ쫫)
                     var pushUrls = urls[1];
                     
                     //?대?吏  ??移댁슫??                     
                     imgCount += picUrls.length;

                     //?붾㈃???대?吏  異쒕젰
                     drawPics(picUrls,pushUrls);
                     
                     if(next){
                        alert(next);
                        getPhotoFromAlbum(next);
                        /* allPhoto(pushUrls); */
                     }
                     else{
                        /* for (var i = 0; i < pushUrls.length; i++) {
                        html += '<button onclick="javascript:allPhoto(\''+pushUrls[i]+'\')">전체전송</button>';
                        }    */
                        html += "<br>picUrls count : "+imgCount+"<br>";
                        document.getElementById("photos").innerHTML=html;
                     }
                     
                           
            }); 
      }   

      function drawPics(picUrls,pushUrls) {
          for (var i = 0; i < picUrls.length; i++) {
            html += '<div style="display: inline;"><image id="imageplz" src="'+picUrls[i]+'" width="100px" height="100px"></a></div>';
         } 
         

          length += picUrls.length;
         
         document.getElementById("photos").innerHTML=html;
         
         $('#allPhoto').on('click',function(){
            
            alert("나는 들어왔도다!!!!!!!!!!!!!!!!");
            allPhoto(pushUrls);
            
         });
      
      }

      
      var successCount = 0;
      var length=0;
      function allPhoto(pushUrls){
         
         $.ajax({
            
            url :"selectImg",
            method :"POST",
            data: {pushUrls:pushUrls},
            success : function(result){
               successCount=successCount+1;
               if(parseInt((length-1) / 100) == (successCount - 1 )){
                  self.opener = self;
                  window.close();
               }
            } ,beforeSend:function(){

                  
               Pace.start();

             }

             ,complete:function(){

                 $('.loadingScreen').addClass('display-none');

             }

             ,error:function(e){


             }
                                      
            
         });
         
         
      }
      
      
      
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

      
      
      /* function selectImg(img){
         
         
         
         
         $.ajax({
            
            url :"selectImg",
            method :"GET",
            data : {img:img},
            success : function(result){
               
               alert(result);
            }                                       
            
         });
         
         
      } */
      
      
      function getPic(data, size) {
         var picUrls = new Array(); //?붾㈃???꾩썙以??ъ쭊
         var pushUrls = new Array(); //?쒕쾭濡??꾩넚???ъ쭊
         //?ъ쭊 url留?異붿텧
         for (var i = 0; i < data.length; i++) {
            var pic = data[i]; //picture ? ?쒖궗吏꾨뱾??諛곗뿴
            var picUrl = pic["picture"]; //picture ?쒓컻 二쇱냼
            picUrls.push(picUrl);//?ъ쭊 二쇱냼留?諛곗뿴???닿린

            var images = pic["images"]; //images 諛곗뿴 : ?ъ씠利?蹂꾨줈 ?덉쓬
            //   console.log("images: "+images);
            for (var t = 0; t < images.length; t++) {
               var img = images[t];
               if (img["width"] === size) {
                  pushUrls.push(img["source"]);
                  break;
               } else if (img != null) {
                  var img0 = images[0];
                  pushUrls.push(img0["source"]);
                  break;
               }
            }
         }
         return [ picUrls, pushUrls ];
      }
   </script>
   
   
   <section class="section-positive" >
            <div class="container">
               
               <div class="row mt-60 mb-30" >
                  
                  <!-- ===== SITEMAP ===== -->
                  <div class="col-sm-3 mb-30" ">
                     <h2 class="title-separator white">Album</h2>
                     <ul class="footer-list">
                        <li id="albumlist"></li>
                        
                        <!-- <li><a id="1" href="index.html">Home</a></li>
                        <li><a id="2" href="podcasts.html">Podcasts</a></li>
                        <li><a id="3" href="single-page.html">Pages</a></li>
                        <li><a id="4" href="about-us.html">About Us</a></li>
                        <li><a id="5" href="contact.html">Contact</a></li> -->
                     </ul>
                  <fb:login-button scope="public_profile,email,user_photos" onlogin="checkLoginState();" />
                  </div>
                  
                  <div class="col-sm-9 mb-40">
                  <div id="photos"></div>
                  </div>
                  
               </div>
                  
                  <div class="row mt-60 mb-30" >
      <div class="col-sm-6 mb-30"></div>
      <div class="col-sm-2 mb-30 podcast-meta-element">
            <span id="allPhoto" class="podcast-meta-item"><i class="fa fa-paper-plane"></i></span>
         </div>
      <div class="col-sm-4 mb-30"></div>
   </div>
                  </div>
               </section>
               
               <!-- <div id="photoList" style="background-color: white; width: 500px;height: auto; margin-left: 200px;"  >
                     </div> -->
      
      
   
   <div id="status"></div>
   
   
      

</body>
</html>