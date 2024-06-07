package com.diabetes.tracker.service;

import com.diabetes.tracker.model.GlucoseReading;
import java.util.List;

import java.time.LocalDate;

public interface GlucoseReadingService {
    List<GlucoseReading> getAllReadings();
    GlucoseReading saveReading(GlucoseReading reading);
    void deleteReading(Long id);
    List<GlucoseReading> findAll();
    List<GlucoseReading> findByDateRange(LocalDate startDate, LocalDate endDate);
}