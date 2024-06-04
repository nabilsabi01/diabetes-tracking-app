package com.diabetes.tracker.controller;

import com.diabetes.tracker.model.GlucoseReading;
import com.diabetes.tracker.model.MealType;
import com.diabetes.tracker.service.GlucoseReadingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

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
        List<GlucoseReading> glucoseReadings = glucoseReadingService.getAllReadings();
        model.addAttribute("glucoseReadings", glucoseReadings);
        return "list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("glucoseReading", new GlucoseReading());
        model.addAttribute("mealTypes", MealType.values());
        return "add";
    }

    @PostMapping("/save")
    public String saveReading(@Valid @ModelAttribute("glucoseReading") GlucoseReading glucoseReading, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
        if (bindingResult.hasErrors()) {
            return "list";
        }

        GlucoseReading savedReading = glucoseReadingService.saveReading(glucoseReading);
        redirectAttributes.addFlashAttribute("success", "Glucose reading saved successfully.");
        return "redirect:/readings/list";
    }

    @GetMapping("/delete/{id}")
    public String deleteReading(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        glucoseReadingService.deleteReading(id);
        redirectAttributes.addFlashAttribute("success", "Glucose reading deleted successfully.");
        return "redirect:/readings/list";
    }
}