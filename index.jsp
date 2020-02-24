<!DOCTYPE html>
<%
	Boolean valide;
	if (request.getAttribute("valide")==null) {
		valide = true;
	} else {
		valide = (Boolean) request.getAttribute("valide");
	}
%>
<html lang='fr'>
	<head>
		<meta charset='utf-8'>
		<title>OK</title>
	</head>
	<body>
		<form method="post" action="authentication">
			<label>Identifiant : </label><input type="text" name="login"> <br>
			<label>Mot de passe : </label><input type="password" name="password"> <br>
			<input type="submit" value="Connexion">
			<% if (!valide) { %>
				<h1>Identifiant ou mot de passe incorrects</h1>
			<% }%>
		</form>
	</body>
</html>