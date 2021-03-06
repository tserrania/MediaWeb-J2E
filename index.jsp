<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<%
	if (session.getAttribute("utilisateur")!=null) {
		getServletContext().getRequestDispatcher("/accueil").forward(request, response);
	}
	
	Boolean valide;
	if (request.getAttribute("valide") == null) {
		valide = true;
	} else {
		valide = (Boolean) request.getAttribute("valide");
	}
%>
<html lang='fr'>
<head>
<meta charset='utf-8'>
<title>Bibliothèque - Authentification</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css"
	integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"
	integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="content-fluid">
		<div class="col-sm-4 col-sm-offset-4">
			<h1>Bienvenue dans la médiathèque</h1>
			<h2>Connexion</h2>
			<form method="post" action="authentication" class="form-group">
				<label>Identifiant : </label> <br> 
				<input class="form-control" type="text" name="login">
				<br>
				<label>Mot de passe : </label>
				<br>
				<input class="form-control" type="password" name="password">
				<br>
				<input type="submit" value="Connexion" class="btn btn-info">
				<%
					if (!valide) {
				%>
				<p style="color:red;">Identifiant ou mot de passe incorrects</p>
				<%
					}
				%>
			</form>
		</div>
	</div>
</body>
</html>