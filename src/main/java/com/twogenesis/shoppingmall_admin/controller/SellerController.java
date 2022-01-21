package com.twogenesis.shoppingmall_admin.controller;

import com.twogenesis.shoppingmall_admin.mapper.SellerMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellerController {
    @Autowired SellerMapper mapper;
    @GetMapping("/account/seller")
    public String getAccountSeller(@RequestParam @Nullable String keyword, @RequestParam @Nullable Integer offset, Model model){
        model.addAttribute("keyword", keyword);
        if(keyword == null) keyword ="%%";
        else keyword ="%"+keyword+"%";

        if(offset == null) offset =0;

        model.addAttribute("offset", offset);
        model.addAttribute("list", mapper.selectSellerList(keyword, offset));

        Integer cnt =mapper.selectSellerCnt(keyword);
        Integer page = (cnt/10) + (cnt%10>0?1:0);

        model.addAttribute("cnt", cnt);
        model.addAttribute("page", page);
        
        return "/account/seller";

    }
}
