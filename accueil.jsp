<%@ page import="mediatek2020.items.Utilisateur" %>
<!DOCTYPE html>
<%
	Utilisateur u = null;
	if (session.getAttribute("utilisateur")!=null) {
		u = (Utilisateur) session.getAttribute("utilisateur");
	}
%>
<html lang='fr'>
	<head>
		<meta charset='utf-8'>
		<title>OK</title>
	</head>
	<body>
	<h1>Bonjour <%=u.name()%></h1>
	</body>
</html>