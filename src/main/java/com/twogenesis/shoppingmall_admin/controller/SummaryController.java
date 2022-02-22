package com.twogenesis.shoppingmall_admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SummaryController {
    @GetMapping("/summary")
    public String getSummary(Model model) {
        model.addAttribute("menu1", "summary");
        return "/summary/main";
    }
}
