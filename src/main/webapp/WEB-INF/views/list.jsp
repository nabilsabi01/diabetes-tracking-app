<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Glucose Readings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"></head>
<body>
<div class="container my-5">
    <h1>Glucose Readings</h1>

    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Date</th>
            <th>Time</th>
            <th>Glucose Level</th>
            <th>Notes</th>
            <th>Meal Type</th>
            <th>Insulin Dose</th>
            <th>Weight (kg)</th>
            <th>Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${glucoseReadings}" var="reading">
            <tr>
                <td>${reading.date}</td>
                <td>${reading.time}</td>
                <td>${reading.glucoseLevel}</td>
                <td>${reading.notes}</td>
                <td>${reading.mealType}</td>
                <td>${reading.insulinDose}</td>
                <td>${reading.weightInKg}</td>
                <td>
                    <a href="/readings/edit/${reading.id}" class="btn btn-primary btn-sm">Edit</a>
                    <a href="/readings/delete/${reading.id}" class="btn btn-danger btn-sm">Delete</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/readings/add" class="btn btn-success">Add Glucose Reading</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>