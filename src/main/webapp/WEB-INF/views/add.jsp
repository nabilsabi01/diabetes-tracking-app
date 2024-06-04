<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Add Glucose Reading</title>
</head>
<body>
<h1>Add Glucose Reading</h1>

<form:form modelAttribute="glucoseReading" action="/readings/save" method="post">
    <div>
        <label for="date">Date:</label>
        <form:input path="date" type="date" />
        <form:errors path="date" />
    </div>
    <div>
        <label for="time">Time:</label>
        <form:input path="time" type="time" />
        <form:errors path="time" />
    </div>
    <div>
        <label for="glucoseLevel">Glucose Level:</label>
        <form:input path="glucoseLevel" type="number" step="0.01" />
        <form:errors path="glucoseLevel" />
    </div>
    <div>
        <label for="mealType">Meal Type:</label>
        <form:select path="mealType" items="${mealTypes}" itemValue="name" itemLabel="label" />
        <form:errors path="mealType" />
    </div>
    <div>
        <label for="insulinDose">Insulin Dose:</label>
        <form:input path="insulinDose" type="number" step="0.01" />
        <form:errors path="insulinDose" />
    </div>
    <div>
        <label for="weightInKg">Weight (kg):</label>
        <form:input path="weightInKg" type="number" step="0.01" />
        <form:errors path="weightInKg" />
    </div>
    <div>
        <label for="notes">Notes:</label>
        <form:textarea path="notes" />
        <form:errors path="notes" />
    </div>
    <button type="submit">Save</button>
</form:form>

<c:if test="${not empty success}">
    <div>${success}</div>
</c:if>
</body>
</html>
