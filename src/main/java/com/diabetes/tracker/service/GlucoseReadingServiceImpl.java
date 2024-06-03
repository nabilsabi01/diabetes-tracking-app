package com.diabetes.tracker.service;

import com.diabetes.tracker.model.GlucoseReading;
import com.diabetes.tracker.repository.GlucoseReadingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GlucoseReadingServiceImpl implements GlucoseReadingService{
    private final GlucoseReadingRepository glucoseReadingRepository;

    @Autowired
    public GlucoseReadingServiceImpl(GlucoseReadingRepository glucoseReadingRepository) {
        this.glucoseReadingRepository = glucoseReadingRepository;
    }

    @Override
    public List<GlucoseReading> getAllReadings() {
        return glucoseReadingRepository.findAll();
    }

    @Override
    public GlucoseReading getReadingById(Long id) {
        return glucoseReadingRepository.findById(id).orElse(null);
    }

    @Override
    public GlucoseReading saveReading(GlucoseReading reading) {
        return glucoseReadingRepository.save(reading);
    }

    @Override
    public void deleteReading(Long id) {
        glucoseReadingRepository.deleteById(id);
    }
}
