<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 03/06/2024
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ajouter une nouvelle lecture de glycémie</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<h1>Ajouter une nouvelle lecture de glycémie</h1>
<form action="/glucose-readings" method="post">
    <label for="date">Date:</label>
    <input type="date" id="date" name="date" required><br><br>

    <label for="time">Heure:</label>
    <input type="time" id="time" name="time" required><br><br>

    <label for="glucoseLevel">Niveau de Glycémie:</label>
    <input type="number" id="glucoseLevel" name="glucoseLevel" required><br><br>

    <label for="notes">Notes:</label>
    <textarea id="notes" name="notes"></textarea><br><br>

    <label for="mealType">Type de Repas:</label>
    <input type="text" id="mealType" name="mealType"><br><br>

    <label for="insulinDose">Dose d'Insuline (UI):</label>
    <input type="number" id="insulinDose" name="insulinDose"><br><br>

    <label for="weightInKg">Poids (kg):</label>
    <input type="number" id="weightInKg" name="weightInKg"><br><br>

    <button type="submit">Ajouter</button>
</form>
</body>
</html>
