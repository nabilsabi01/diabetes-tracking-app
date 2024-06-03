-- Création de la base de données
CREATE DATABASE IF NOT EXISTS diabetes_tracker;
USE diabetes_tracker;

-- Création de la table glucose_readings
CREATE TABLE IF NOT EXISTS glucose_readings (
  id INT AUTO_INCREMENT PRIMARY KEY,
  date DATE NOT NULL,
  time TIME NOT NULL,
  glucose_level DOUBLE NOT NULL,
  notes VARCHAR(255),
  meal_type VARCHAR(50),
  insulin_dose DOUBLE,
  weight_in_kg DOUBLE
);