<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mediatek2020.Mediatheque" %>
<%@ page import="mediatek2020.items.Utilisateur" %>
<%@ page import="mediatek2020.items.Document" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%
	Utilisateur u = null;
	if (session.getAttribute("utilisateur")!=null) {
		u = (Utilisateur) session.getAttribute("utilisateur");
	} else {
		getServletContext().getRequestDispatcher("/").forward(request, response);
	}
	if (u.isBibliothecaire()) {
		getServletContext().getRequestDispatcher("/").forward(request, response);
	}
	
	String iddoc = request.getParameter("iddoc");
	Boolean valide = false;
	if (iddoc!=null) {
		valide = (Boolean) request.getAttribute("valide");
	}
%>
<html lang='fr'>
	<head>
<meta charset='utf-8'>
<title>Bibliothèque - Réserver</title>
		
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
			<h2>Que souhaitez-vous réserver ?</h2>
			<table class="table">
				<thead>
					<tr>
						<th scope="col">Type</th>
						<th scope="col">Titre</th>
						<th scope="col">Auteur</th>
						<th scope="col">Description</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<% if (iddoc!=null) { 
						if (!valide) { %>
							<p style="color:red;">Cette opération n'est pour le moment pas implémentée.</p>
					<%	} else { %>
							<p style="color:green;">Document réservé !</p>
					<%}
					}%>
					<% for (Document d:Mediatheque.getInstance().tousLesDocuments()) {
						Object[] data = d.data();
						if (!((Boolean)data[5]) && ((Integer)data[6])==null) {
					%>
					<tr>
						<td><%=data[1]%></td>
						<td><%=data[2]%></td>
						<td><%=data[3]%></td>
						<td><%=data[4]%></td>
						<td><a class="btn btn-success" href="./reserver?iddoc=<%=data[0]%>">Réserver</a></td>
					</tr>
					<%	}
					}%>
				</tbody>
			</table>
			<a class="btn btn-info" href="./accueil">Retour</a>
		</div>
	</body>
</html>