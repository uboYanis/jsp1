<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Damier</title>
<style>
table {
	/* Fusionne les bordures des cellules adjacentes */
	border-collapse: collapse;
	/* Ajoute une bordure externe visible autour du tableau */
	border: 2px solid #333;
}

td {
	width: 50px; /* Largeur de chaque cellule */
	height: 50px; /* Hauteur de chaque cellule */
}
</style>
</head>
<body>
	<h2>Damier 10x10</h2>
	<table>
		<%
		int N = 10; // Définition de la taille du damier (10x10)
		for (int i = 0; i < N; i++) { // Boucle pour chaque ligne
			out.print("<tr>"); // Début d'une nouvelle ligne de la table
			for (int j = 0; j < N; j++) { // Boucle pour chaque cellule de la ligne
				// Détermine la couleur de fond (noir ou blanc) en fonction de la position
				String backgroundColor = ((i + j) % 2 == 0) ? "black" : "white";
				// Crée une cellule avec la couleur de fond déterminée
				out.print("<td style='background-color:" + backgroundColor + ";'></td>");
			}
			out.print("</tr>"); // Fin de la ligne
		}
		%>
	</table>
</body>
</html>
