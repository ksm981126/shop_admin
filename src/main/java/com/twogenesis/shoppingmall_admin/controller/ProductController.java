package com.twogenesis.shoppingmall_admin.controller;

import javax.servlet.http.HttpSession;

import com.twogenesis.shoppingmall_admin.data.SellerVO;
import com.twogenesis.shoppingmall_admin.mapper.CategoryMapper;
import com.twogenesis.shoppingmall_admin.mapper.ProductMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
    @Autowired CategoryMapper cate_mapper;
    @Autowired ProductMapper mapper;
    @GetMapping("/product/list")
    public String getProductList(@RequestParam@Nullable String keyword,@RequestParam@Nullable Integer offset, Model model, HttpSession session){
        SellerVO seller = (SellerVO)session.getAttribute("login_seller");
        Integer seller_seq =0;
        if(seller != null) seller_seq = seller.getSi_seq();
        model.addAttribute("keyword", keyword);
        
        if(keyword == null) keyword ="%%";
        else keyword ="%"+keyword+"%";
        
        
        if(offset==null) offset = null;
        model.addAttribute("offset", offset);
        
        model.addAttribute("list", mapper.selectProductList(keyword, offset,seller_seq));
        model.addAttribute("root_cate", cate_mapper.selectRootCategories());
        
        Integer cnt =mapper.selectProductCnt(keyword, seller_seq);
        Integer page = (cnt/10)+(cnt%10>0? 1:0);
        model.addAttribute("cnt", cnt);
        model.addAttribute("page", page);
        return "/product/list";
    }
}
