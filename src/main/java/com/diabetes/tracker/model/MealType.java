package com.diabetes.tracker.model;

public enum MealType {
    Breakfast("Breakfast"),
    Lunch("Lunch"),
    Dinner("Dinner"),
    Snack("Snack");

    private final String label;

    MealType(String label) {
        this.label = label;
    }

    public String getLabel() {
        return label;
    }
}