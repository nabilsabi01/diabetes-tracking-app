<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Glucose Reading</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 600px;
            background-color: #ffffff;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #6c757d;
            box-shadow: none;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <h1 class="mb-4 text-center">Add Glucose Reading</h1>
    <form action="${pageContext.request.contextPath}/readings/save" method="post" modelAttribute="glucoseReading">
        <div class="mb-3">
            <label for="date" class="form-label">Date:</label>
            <input type="date" class="form-control" id="date" name="date" required>
        </div>
        <div class="mb-3">
            <label for="time" class="form-label">Time:</label>
            <input type="time" class="form-control" id="time" name="time" required>
        </div>
        <div class="mb-3">
            <label for="glucoseLevel" class="form-label">Glucose Level:</label>
            <input type="number" class="form-control" id="glucoseLevel" name="glucoseLevel" required>
        </div>
        <div class="mb-3">
            <label for="notes" class="form-label">Notes:</label>
            <textarea class="form-control" id="notes" name="notes" rows="3"></textarea>
        </div>
        <div class="mb-3">
            <label for="mealType" class="form-label">Meal Type:</label>
            <select class="form-select" id="mealType" name="mealType">
                <c:forEach items="${mealTypes}" var="mealType">
                    <option value="${mealType}">${mealType}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="insulinDose" class="form-label">Insulin Dose:</label>
            <input type="number" class="form-control" id="insulinDose" name="insulinDose">
        </div>
        <div class="mb-3">
            <label for="weightInKg" class="form-label">Weight (kg):</label>
            <input type="number" class="form-control" id="weightInKg" name="weightInKg">
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary">Save</button>
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>