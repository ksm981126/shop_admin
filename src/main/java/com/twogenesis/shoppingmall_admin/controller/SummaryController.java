package com.twogenesis.shoppingmall_admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SummaryController {
    @GetMapping("/summary")
    public String getSummary() {
        return "/summary/main";
    }
}
