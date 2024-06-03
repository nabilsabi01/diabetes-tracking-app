package com.diabetes.tracker.model;


import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "glucose_readings")
public class GlucoseReading {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;

    private LocalTime time;

    private double glucoseLevel;

    @Column
    private String notes;

    @Column
    private String mealType;

    @Column
    private double insulinDose;

    @Column
    private double weightInKg;

    public GlucoseReading() {
    }

    public GlucoseReading(Long id, LocalDate date, LocalTime time, double glucoseLevel, String notes, String mealType, double insulinDose, double weightInKg) {
        this.id = id;
        this.date = date;
        this.time = time;
        this.glucoseLevel = glucoseLevel;
        this.notes = notes;
        this.mealType = mealType;
        this.insulinDose = insulinDose;
        this.weightInKg = weightInKg;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public String getMealType() {
        return mealType;
    }

    public void setMealType(String mealType) {
        this.mealType = mealType;
    }

    public double getInsulinDose() {
        return insulinDose;
    }

    public void setInsulinDose(double insulinDose) {
        this.insulinDose = insulinDose;
    }

    public double getWeightInKg() {
        return weightInKg;
    }

    public void setWeightInKg(double weightInKg) {
        this.weightInKg = weightInKg;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTime() {
        return time;
    }

    public void setTime(LocalTime time) {
        this.time = time;
    }

    public double getGlucoseLevel() {
        return glucoseLevel;
    }

    public void setGlucoseLevel(double glucoseLevel) {
        this.glucoseLevel = glucoseLevel;
    }
}
