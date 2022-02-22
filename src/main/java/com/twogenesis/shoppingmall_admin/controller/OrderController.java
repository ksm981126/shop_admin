package com.twogenesis.shoppingmall_admin.controller;

import com.twogenesis.shoppingmall_admin.mapper.OrderMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {
    @Autowired OrderMapper order_mapper;
    @GetMapping("/order/list")
    public String getOrderList(
        @RequestParam @Nullable Integer seq,
        @RequestParam @Nullable Integer offset,
        Model model
    ) {
        if(seq == null) seq = 0;
        if(offset == null) offset = 0;

        Integer cnt = order_mapper.selectOrderManageInfoCount(seq);
        Integer page = (cnt / 10) + (cnt%10>0 ? 1 : 0);

        model.addAttribute("list", order_mapper.selectOrderManageInfo(seq, offset));
        model.addAttribute("page", page);
        model.addAttribute("offset", offset);
        model.addAttribute("menu1", "order");
        model.addAttribute("menu2", "list");
        return "/order/list";
    }
}
