<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src="https://apis.google.com/js/platform.js" async defer></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>   
  <meta name="google-signin-client_id" content="50376313406-hp2i1too98fc8nbgpd9cd0bvs0j4s0qj.apps.googleusercontent.com">

</head>
<body>

<div class="g-signin2" data-onsuccess="onSignIn"></div>

<script>
function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  console.log('ID: ' + profile.getId());
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail());
  
  var id_token = googleUser.getAuthResponse().id_token;
   console.log("ID Token: " + id_token);
  
   var redirectUrl = 'login';

   
   var form = $('<form action="' + redirectUrl + '" method="post">' +
                    '<input type="text" name="id_token" value="' +
                     googleUser.getAuthResponse().id_token + '" />' +
                                                          '</form>');
   $('body').append(form);
   form.submit();


}


</script>
 
<a href="#" onclick="signOut();">Sign out</a>
<script>
  function signOut() {
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
  }
</script>

</body>
</html>