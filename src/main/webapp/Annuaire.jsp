<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="com.example.Personne, com.example.Adresse, java.util.ArrayList, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Annuaire</title>
<style>
/* Style de la table */
table {
	border-collapse: collapse; /* Fusionne les bordures des cellules */
	width: 100%; /* Utilise toute la largeur disponible */
	margin-top: 20px; /* Espace en haut de la table */
}

th, td {
	padding: 10px; /* Espacement interne dans les cellules */
	border: 1px solid #333; /* Bordure autour des cellules */
	text-align: left; /* Aligne le texte à gauche dans les cellules */
}
</style>
</head>
<body>
	<h2>Annuaire</h2>
	<%
	// Création et initialisation de la liste des personnes dans l'annuaire
	List<Personne> annuaire = new ArrayList<>();
	annuaire.add(new Personne("Dupont", "Jean", 30, new Adresse("123 Rue de Paris", "Paris", "75001")));
	annuaire.add(new Personne("Martin", "Marie", 25, new Adresse("45 Avenue des Champs", "Lyon", "69000")));
	annuaire.add(new Personne("Durand", "Luc", 40, new Adresse("78 Boulevard Saint-Michel", "Marseille", "13000")));
	%>

	<table>
		<!-- Entêtes de colonnes -->
		<tr>
			<th>Nom</th>
			<th>Prénom</th>
			<th>Age</th>
			<th>Adresse</th>
		</tr>
		<%
		// Parcours de la liste des personnes pour afficher chaque entrée
		for (Personne personne : annuaire) {
			Adresse adresse = personne.getAdresse(); // Récupération de l'adresse de chaque personne
		%>
		<!-- Affichage des informations de chaque personne dans une ligne de tableau -->
		<tr>
			<td><%=personne.getNom()%></td>
			<!-- Nom de la personne -->
			<td><%=personne.getPrenom()%></td>
			<!-- Prénom de la personne -->
			<td><%=personne.getAge()%> ans</td>
			<!-- Âge de la personne -->
			<td><%=adresse.getRue()%>, <%=adresse.getVille()%> - <%=adresse.getCodePostal()%></td>
			<!-- Adresse complète -->
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>
