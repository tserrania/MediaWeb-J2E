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

%>
<html lang='fr'>
	<head>
<meta charset='utf-8'>
<title>Bibliothèque - Accueil</title>
		
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
	<h1>Bonjour, <%=u.name()%></h1>
	<h2>Que souhaitez-vous faire ?</h2>
	<% if (u.isBibliothecaire()) {
	%>
	<a class="btn btn-success" href="./ajouter">Ajouter un Document</a>
	<%} else {%>
	<a class="btn btn-success" href="./reserver">Réserver un Document</a>
	<br>
	<br>
	<a class="btn btn-success" href="./emprunter">Emprunter un Document</a>
	<br>
	<br>
	<a class="btn btn-success" href="./rendre">Rendre un Document</a>
	<%} %>
	<br>
	<br>
	<a class="btn btn-danger" href="./deconnexion">Se Déconnecter</a>
	</body>
</html>