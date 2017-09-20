/**
 * 
 */

//This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
	console.log('statusChangeCallback');
	console.log(response);
	if (response.status === 'connected') {
		// Logged into your app and Facebook.
		//testAPI();
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
	
