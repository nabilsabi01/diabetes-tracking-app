package com.diabetes.tracker.repository;

import com.diabetes.tracker.model.GlucoseReading;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GlucoseReadingRepository extends JpaRepository<GlucoseReading, Long> {

}
