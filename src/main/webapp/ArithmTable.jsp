<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table Arithmétique</title>
<style>
table {
	border-collapse: collapse; /* Fusionne les bordures des cellules */
	margin-top: 20px; /* Espace en haut de la table */
}

td, th {
	padding: 10px; /* Espacement interne dans les cellules */
	border: 1px solid #333; /* Bordure autour des cellules */
	text-align: center; /* Centrer le texte dans les cellules */
}
</style>
</head>
<body>
	<h2>Table Arithmétique</h2>
	<%
	// Initialisation des variables pour gérer les erreurs
	boolean erreurTable = false;
	boolean erreurOperateur = false;
	String messageErreur = "";

	// Récupération des paramètres 'table' et 'operateur' depuis la requête
	String tableParam = request.getParameter("table");
	String operateurParam = request.getParameter("operateur");

	int table = 0;
	String operateur = "";

	try {
		// Vérification et conversion du paramètre 'table' en entier
		table = Integer.parseInt(tableParam);
		if (table < 1 || table > 10) { // Vérifie si la table est entre 1 et 10
			erreurTable = true;
			messageErreur += "Le nombre 'table' doit être un entier compris entre 1 et 10.<br>";
		}
	} catch (Exception e) {
		// Gère le cas où 'table' n'est pas un entier valide
		erreurTable = true;
		messageErreur += "Le paramètre 'table' doit être un entier valide.<br>";
	}

	// Vérification de la validité du paramètre 'operateur'
	if (operateurParam != null) {
		switch (operateurParam) {
		case "addition":
		case "soustraction":
		case "multiplication":
		case "division":
			operateur = operateurParam; // Opérateur valide
			break;
		default:
			erreurOperateur = true;
			messageErreur += "L'opérateur doit être 'addition', 'soustraction', 'multiplication' ou 'division'.<br>";
		}
	} else {
		// Gère le cas où 'operateur' est manquant
		erreurOperateur = true;
		messageErreur += "Le paramètre 'operateur' est requis.<br>";
	}

	// Affichage des messages d'erreur si une erreur a été détectée
	if (erreurTable || erreurOperateur) {
	%>
	<p style="color: red;"><%=messageErreur%></p>
	<%
	} else {
	%>
	<table>
		<tr>
			<th>Opération</th>
			<th>Résultat</th>
		</tr>
		<%
		// Boucle pour générer la table arithmétique de 1 à 10
		for (int i = 1; i <= 10; i++) {
			int resultat = 0;
			String operation = "";

			// Détermine le résultat et la représentation de l'opération en fonction de l'opérateur
			switch (operateur) {
			case "addition":
				resultat = table + i;
				operation = table + " + " + i;
				break;
			case "soustraction":
				resultat = table - i;
				operation = table + " - " + i;
				break;
			case "multiplication":
				resultat = table * i;
				operation = table + " * " + i;
				break;
			case "division":
				if (i != 0) {
			resultat = table / i;
			operation = table + " / " + i;
				} else {
			operation = table + " / " + i;
			messageErreur += "Division par zéro n'est pas permise.<br>";
				}
				break;
			}
		%>
		<tr>
			<td><%=operation%></td>
			<td><%=resultat%></td>
		</tr>
		<%
		}
		%>
	</table>
	<%
	}
	%>
</body>
</html>