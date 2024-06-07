package com.diabetes.tracker.repository;

import com.diabetes.tracker.model.GlucoseReading;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface GlucoseReadingRepository extends JpaRepository<GlucoseReading, Long> {
    List<GlucoseReading> findByDateBetween(LocalDate startDate, LocalDate endDate);
}