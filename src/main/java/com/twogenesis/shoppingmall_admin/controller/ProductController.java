package com.twogenesis.shoppingmall_admin.controller;

import com.twogenesis.shoppingmall_admin.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
    @Autowired ProductMapper mapper;
    @GetMapping("/product/list")
    public String getProductList(@RequestParam@Nullable String keyword,@RequestParam@Nullable Integer offset, Model model){
        
        if(keyword == null) keyword ="%%";
        else keyword ="%"+keyword+"%";

        if(offset==null) offset = null;

        model.addAttribute("list", mapper.selectProductList(keyword, offset));
        return "/product/list";
    }
}
