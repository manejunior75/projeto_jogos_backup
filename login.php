<!DOCTYPE html>

<html lang="pt-br">

	<head>
		<meta charset="utf-8">
		<title>Streamig - Login</title>
		<script src="https://apis.google.com/js/platform.js" async defer></script>
		<meta name="google-signin-client_id" content=
		"139736262249-245tq6mvjsso76s796jlagi9v0o1mjns.apps.googleusercontent.com">
	</head>
	<body>
		<div class="g-signin2" data-onsuccess="onSignIn"></div>	
		
		<p id = 'msg'> </p>
		
		<script>
		
		function onSignIn(googleUser) {
		  var profile = googleUser.getBasicProfile();
		  var userID = profile.getId();
		  var userName = profile.getName();
		  var userImagem = profile.getImageUrl();
		  var userEmail = profile.getEmail();
		  var userToken = googleUser.getAuthResponse().id_token;
		  
		  if(userEmail !== '') {
			  var dados = {
				userID:userID,
				userName:userName,
				userImagem:userImagem,
				userEmail:userEmail 
			  };
				$.post('valida.php', dados, function(retorna){
					if(retorna === '"erro"'){
						var msg = "Usuário não encontrado com esse e-mail";
						document.getElementById('msg').innerHTML = msg;
					}else{
						window.location.href = retorna;
					}
					
				});
		  }else{
			  var msg = "Usuário não encontrado!";
			  document.getElementById('msg').innerHTML = msg;
		  }			  
		
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	</body>
</html>	
	