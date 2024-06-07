package com.diabetes.tracker.service;

import com.diabetes.tracker.model.GlucoseReading;
import com.diabetes.tracker.repository.GlucoseReadingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;

@Service
@Transactional
public class GlucoseReadingServiceImpl implements GlucoseReadingService {
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
    public GlucoseReading saveReading(GlucoseReading reading) {
        return glucoseReadingRepository.save(reading);
    }

    @Override
    public void deleteReading(Long id) {
        glucoseReadingRepository.deleteById(id);
    }

    @Override
    public List<GlucoseReading> findAll() {
        return glucoseReadingRepository.findAll();
    }

    @Override
    public List<GlucoseReading> findByDateRange(LocalDate startDate, LocalDate endDate) {
        return glucoseReadingRepository.findByDateBetween(startDate, endDate);
    }
}
