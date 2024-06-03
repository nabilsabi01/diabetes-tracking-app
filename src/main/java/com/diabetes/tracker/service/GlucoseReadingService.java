package com.diabetes.tracker.service;

import com.diabetes.tracker.model.GlucoseReading;

import java.util.List;

public interface GlucoseReadingService {
    List<GlucoseReading> getAllReadings();
    GlucoseReading getReadingById(Long id);
    GlucoseReading saveReading(GlucoseReading reading);
    void deleteReading(Long id);
}
