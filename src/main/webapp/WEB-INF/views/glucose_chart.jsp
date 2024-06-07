<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diabetes Tracker Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Roboto', sans-serif;
        }

        .sidebar {
            height: 100vh;
            background-color: #343a40;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .sidebar-nav a {
            color: #fff;
            text-decoration: none;
            display: block;
            padding: 10px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .sidebar-nav a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateX(5px);
        }

        .sidebar-nav a.active {
            background-color: #007bff;
        }

        .main-content {
            padding: 40px;
            overflow-y: auto;
            max-height: 100vh;
        }

        .chart-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s ease;
        }

        .chart-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .chart-header h1 {
            font-size: 28px;
            font-weight: 700;
            color: #333333;
        }

        .chart-canvas {
            margin-top: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }

        .filter-form {
            margin-bottom: 30px;
            animation: slideInUp 0.5s ease;
        }

        .filter-form .form-group {
            margin-right: 20px;
        }

        .filter-form .form-label {
            font-size: 16px;
            font-weight: 600;
            color: #333333;
        }

        .filter-form .form-control {
            border-radius: 5px;
            border: 1px solid #ced4da;
            padding: 8px 12px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        .filter-form .form-control:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .filter-form .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            font-size: 16px;
            padding: 8px 16px;
            transition: all 0.3s ease;
            border-radius: 5px;
        }

        .filter-form .btn-primary:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
            }
            100% {
                opacity: 1;
            }
        }

        @keyframes slideInUp {
            0% {
                transform: translateY(20px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>
</head>
<body>
<div class="d-flex">
    <div class="sidebar">
        <h4 class="text-white mb-4">Diabetes Tracker</h4>
        <nav class="sidebar-nav">
            <a href="#" class="active">Dashboard</a>
            <a href="${pageContext.request.contextPath}/readings/list">Glucose Readings</a>
            <a href="${pageContext.request.contextPath}/readings/add">Add Glucose Reading</a>
        </nav>
    </div>
    <div class="main-content flex-grow-1">
        <div class="chart-container">
            <div class="chart-header">
                <h1>Glucose Chart</h1>
            </div>
            <canvas id="glucoseChart" class="chart-canvas"></canvas>
        </div>

        <div class="filter-form d-flex justify-content-center mb-4">
            <div class="form-group me-3">
                <label for="weekFilter" class="form-label">Filter by Week:</label>
                <form action="${pageContext.request.contextPath}/readings/chart/filter/week" method="get" class="d-flex">
                    <input type="number" class="form-control" id="weekFilter" name="week" value="${currentWeek}" min="1" max="53" required>
                    <input type="number" class="form-control mx-2" name="year" value="${currentYear}" min="2000" max="2050" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </form>
            </div>
            <div class="form-group">
                <label for="monthFilter" class="form-label">Filter by Month:</label>
                <form action="${pageContext.request.contextPath}/readings/chart/filter/month" method="get" class="d-flex">
                    <select class="form-control" id="monthFilter" name="month" required>
                        <option value="">Select Month</option>
                        <c:forEach var="i" begin="1" end="12">
                            <option value="${i}" ${i == currentMonth ? 'selected' : ''}>${i}</option>
                        </c:forEach>
                    </select>
                    <input type="number" class="form-control mx-2" name="year" value="${currentYear}" min="2000" max="2050" required>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    const glucoseData = [];
    const labels = [];
    <c:forEach var="reading" items="${glucoseReadings}">
    labels.push('${reading.date} ${reading.time}');
    glucoseData.push(${reading.glucoseLevel});
    </c:forEach>

    const ctx = document.getElementById('glucoseChart').getContext('2d');
    const glucoseChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [{
                label: 'Glucose',
                data: glucoseData,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 2,
                fill: false,
                tension: 0.4
            }]
        },
        options: {
            scales: {
                x: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Dateand Time',
                        font: {
                            weight: 'bold',
                            size: 14
                        }
                    }
                },
                y: {
                    display: true,
                    title: {
                        display: true,
                        text: 'Glucose (mg/dL)',
                        font: {
                            weight: 'bold',
                            size: 14
                        }
                    }
                }
            },
            plugins: {
                title: {
                    display: false
                },
                legend: {
                    position: 'bottom',
                    labels: {
                        boxWidth: 12,
                        padding: 20,
                        font: {
                            size: 14
                        }
                    }
                }
            },
            layout: {
                padding: {
                    top: 20,
                    right: 20,
                    bottom: 20,
                    left: 20
                }
            }
        }
    });
</script>

</body> </html>