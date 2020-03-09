<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2020.items.Utilisateur" %>
<!DOCTYPE html>
<%
	Utilisateur u = null;
	if (session.getAttribute("utilisateur")!=null) {
		u = (Utilisateur) session.getAttribute("utilisateur");
	} else {
		getServletContext().getRequestDispatcher("/").forward(request, response);
	}
	if (!u.isBibliothecaire()) {
		getServletContext().getRequestDispatcher("/").forward(request, response);
	}
	
	Boolean valide = (Boolean) request.getAttribute("valide");
%>
<html lang='fr'>
<head>
<meta charset='utf-8'>
<title>Bibliothèque - Ajouter</title>

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
			<h2>Que souhaitez-vous ajouter ?</h2>
			<form method="post" action="ajouter" class="form-group">
				<label>Type : </label>
				<br> 
				<select class="form-control" name="type">
					<option value='0'>Livre</option>
					<option value='1'>DVD</option>
					<option value='2'>Jeu Vidéo</option>
				</select>
				<br>
				<label>Titre : </label>
				<br>
				<input class="form-control" type="text" name="titre">
				<br>
				<label>Auteur : </label>
				<br>
				<input class="form-control" type="text" name="auteur">
				<br>
				<label>Description : </label>
				<br>
				<textarea class="form-control" rows="5" name="description"></textarea>
				<br>
				<input type="submit" value="Ajouter" class="btn btn-info">
				<%
					if (valide!=null) {
						if (!valide) {
				%>
							<p style="color:red;">Ajout invalide !</p>
				<%
						} else {
				%>
							<p style="color:green;">Ajout réussi !</p>
				<%
						}
					}
				%>
			</form>
			<a class="btn btn-info" href="./accueil">Retour</a>
		</div>
	</div>
</body>
</html>