package com.diabetes.tracker.controller;

import com.diabetes.tracker.model.GlucoseReading;
import com.diabetes.tracker.model.MealType;
import com.diabetes.tracker.service.GlucoseReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.time.temporal.WeekFields;
import java.util.List;

import java.time.LocalDate;
import java.util.Locale;

@Controller
@RequestMapping("/readings")
public class GlucoseReadingController {
    private final GlucoseReadingService glucoseReadingService;

    @Autowired
    public GlucoseReadingController(GlucoseReadingService glucoseReadingService) {
        this.glucoseReadingService = glucoseReadingService;
    }

    @GetMapping("/list")
    public String getAllReadings(Model model) {
        List<GlucoseReading> glucoseReadings = glucoseReadingService.findAll();
        model.addAttribute("glucoseReadings", glucoseReadings);
        return "record-glucose-list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("glucoseReading", new GlucoseReading());
        model.addAttribute("mealTypes", MealType.values());
        return "record-glucose-add";
    }

    @PostMapping("/save")
    public String saveReading(@Valid @ModelAttribute("glucoseReading") GlucoseReading glucoseReading) {
        glucoseReadingService.saveReading(glucoseReading);
        return "redirect:/readings/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteReading(@PathVariable("id") Long id) {
        glucoseReadingService.deleteReading(id);
        return "redirect:/readings/list";
    }

    // GlucoseReadingController.java
    @GetMapping("/chart")
    public String showGlucoseChart(Model model) {
        LocalDate currentDate = LocalDate.now();
        int currentWeek = currentDate.get(WeekFields.of(Locale.getDefault()).weekOfWeekBasedYear());
        int currentYear = currentDate.getYear();
        int currentMonth = currentDate.getMonthValue();

        List<GlucoseReading> glucoseReadings = glucoseReadingService.findAll();
        model.addAttribute("glucoseReadings", glucoseReadings);
        model.addAttribute("currentWeek", currentWeek);
        model.addAttribute("currentYear", currentYear);
        model.addAttribute("currentMonth", currentMonth);
        return "glucose_chart";
    }

    @GetMapping("/chart/filter/week")
    public String filterGlucoseChartByWeek(@RequestParam("week") int weekNumber,
                                           @RequestParam("year") int year,
                                           Model model) {
        LocalDate startDate = LocalDate.ofYearDay(year, (weekNumber - 1) * 7 + 1);
        LocalDate endDate = startDate.plusDays(6);
        List<GlucoseReading> glucoseReadings = glucoseReadingService.findByDateRange(startDate, endDate);
        model.addAttribute("glucoseReadings", glucoseReadings);
        model.addAttribute("currentWeek", weekNumber);
        model.addAttribute("currentYear", year);
        return "glucose_chart";
    }

    @GetMapping("/chart/filter/month")
    public String filterGlucoseChartByMonth(@RequestParam("month") int month,
                                            @RequestParam("year") int year,
                                            Model model) {
        LocalDate startDate = LocalDate.of(year, month, 1);
        LocalDate endDate = startDate.plusMonths(1).minusDays(1);
        List<GlucoseReading> glucoseReadings = glucoseReadingService.findByDateRange(startDate, endDate);
        model.addAttribute("glucoseReadings", glucoseReadings);
        model.addAttribute("currentMonth", month);
        model.addAttribute("currentYear", year);
        return "glucose_chart";
    }
}