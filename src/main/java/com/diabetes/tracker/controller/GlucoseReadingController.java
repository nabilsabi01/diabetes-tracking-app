package com.diabetes.tracker.controller;

import com.diabetes.tracker.model.GlucoseReading;
import com.diabetes.tracker.service.GlucoseReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/glucose-readings")
public class GlucoseReadingController {

    private final GlucoseReadingService glucoseReadingService;

    @Autowired
    public GlucoseReadingController(GlucoseReadingService glucoseReadingService) {
        this.glucoseReadingService = glucoseReadingService;
    }

    @GetMapping
    public ResponseEntity<List<GlucoseReading>> getAllGlucoseReadings() {
        List<GlucoseReading> glucoseReadings = glucoseReadingService.getAllReadings();
        return new ResponseEntity<>(glucoseReadings, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<GlucoseReading> getGlucoseReadingById(@PathVariable Long id) {
        GlucoseReading glucoseReading = glucoseReadingService.getReadingById(id);
        if (glucoseReading != null) {
            return new ResponseEntity<>(glucoseReading, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PostMapping
    public ResponseEntity<GlucoseReading> addGlucoseReading(@RequestBody GlucoseReading glucoseReading) {
        GlucoseReading newGlucoseReading = glucoseReadingService.saveReading(glucoseReading);
        return new ResponseEntity<>(newGlucoseReading, HttpStatus.CREATED);
    }

    @PutMapping("/{id}")
    public ResponseEntity<GlucoseReading> updateGlucoseReading(@PathVariable Long id, @RequestBody GlucoseReading glucoseReading) {
        GlucoseReading updatedGlucoseReading = glucoseReadingService.getReadingById(id);
        if (updatedGlucoseReading != null) {
            glucoseReading.setId(id);
            updatedGlucoseReading = glucoseReadingService.saveReading(glucoseReading);
            return new ResponseEntity<>(updatedGlucoseReading, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteGlucoseReading(@PathVariable Long id) {
        glucoseReadingService.deleteReading(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
}
