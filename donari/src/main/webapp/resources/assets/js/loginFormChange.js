/**
 * 
 */

function login(){
	alert('들어왔니...?');
	var login ='<div class="field-wrap">'
		login+=	'<label> Email Address<span class="reqs">*</span>'
		login+=	'</label> <input type="email" required autocomplete="off" /></div>'
		login+=	'<div class="field-wrap">'				
		login+=	'<label> Password<span class="reqs">*</span>'	
		login+=	'	</label> <input type="password" required autocomplete="off" /></div>'						
		login+=	'<p class="forgot">'							
		login+=	'<a href="#">Forgot Password?</a></p>'						
		login+=	'<button class="button button-block" />'			
		login+='Log In'
		login+=	'</button>'		
		
		$('#jofinForm').html('');
		$('#loginForm').html(login);
		alert('들어왔따!!!')					

							
							
							
	
}

