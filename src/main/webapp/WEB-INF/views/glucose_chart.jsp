<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Glucose Chart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background-color: #f8f9fa;
        }

        .chart-container {
            max-width: 800px;
            margin: 40px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
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
    </style>
</head>
<body>
<div class="container">
    <div class="chart-container">
        <div class="chart-header">
            <h1>Glycemia Chart</h1>
        </div>
        <canvas id="glucoseChart" class="chart-canvas"></canvas>
    </div>
</div>

<script>
    const glucoseData = [];
    const labels = [];
    <c:forEach var="reading" items="${glucoseReadings}">
        labels.push('${reading.date}');
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
                        text: 'Date',
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
                        text: 'Glucose',
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
</body>
</html>