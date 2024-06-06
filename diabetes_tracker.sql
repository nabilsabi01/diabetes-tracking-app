CREATE DATABASE IF NOT EXISTS diabetes_tracker;
USE diabetes_tracker;
CREATE TABLE IF NOT EXISTS glucose_readings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    time TIME NOT NULL,
    glucose_level DOUBLE NOT NULL,
    notes VARCHAR(255),
    meal_type ENUM('Breakfast', 'Lunch', 'Dinner', 'Snack') NOT NULL,
    insulin_dose DOUBLE,
    weight_in_kg DOUBLE
);

INSERT INTO glucose_readings (date, time, glucose_level, notes, meal_type, insulin_dose, weight_in_kg)
VALUES
    ('2023-05-01', '08:30:00', 120.5, 'Breakfast reading', 'BREAKFAST', 5.0, 70.0),
    ('2023-05-02', '12:00:00', 135.0, 'Lunch reading', 'LUNCH', 8.0, 71.2),
    ('2023-05-03', '19:00:00', 105.0, 'Dinner reading', 'DINNER', 6.5, 69.8),
    ('2023-05-04', '11:00:00', 92.0, 'Snack reading', 'SNACK', 6.5, 70.5),
    ('2023-05-05', '07:45:00', 155.0, 'Breakfast reading', 'BREAKFAST', 7.0, 71.0);