<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Glucose Readings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border: none;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        .card:hover {
            transform: scale(1.03);
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.2);
        }
        .card-body {
            display: flex;
            flex-direction: row;
            align-items: center;
            padding: 1.5rem;
        }
        .card-text {
            margin-right: 1rem;
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }
        .card-text strong {
            color: #555;
        }
        .btn-delete {
            background-color: #f44336;
            border-color: #f44336;
            transition: background-color 0.3s ease, border-color 0.3s ease;
            color: white;
        }
        .btn-delete:hover {
            background-color: #e53935;
            border-color: #e53935;
        }
    </style>
</head>
<body>
<div class="container my-5">
    <h1 class="mb-4 text-center">Glucose Readings</h1>

    <div class="row">
        <c:forEach items="${glucoseReadings}" var="reading">
            <div class="col-md-6">
                <div class="card mb-3">
                    <div class="card-body">
                        <div>
                            <h5 class="card-title">${reading.date} | ${reading.time}</h5>
                            <p class="card-text"><strong>Glucose Level:</strong> ${reading.glucoseLevel}</p>
                            <p class="card-text"><strong>Meal Type:</strong> ${reading.mealType}</p>
                            <p class="card-text"><strong>Insulin Dose:</strong> ${reading.insulinDose}</p>
                        </div>
                        <div class="ms-auto">
                            <p class="card-text"><strong>Notes:</strong> ${reading.notes}</p>
                            <p class="card-text"><strong>Weight:</strong> ${reading.weightInKg} kg</p>
                            <a href="${pageContext.request.contextPath}/readings/delete/${reading.id}" class="btn btn-delete btn-sm">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="text-center">
        <a href="${pageContext.request.contextPath}/readings/add" class="btn btn-success btn-lg">Add Glucose Reading</a>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>