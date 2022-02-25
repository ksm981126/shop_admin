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
    @Autowired ProductMapper mapper;
    @Autowired CategoryMapper cate_mapper;
    @GetMapping("/product/list")
    public String getProductList(
        @RequestParam @Nullable String keyword, 
        @RequestParam @Nullable Integer offset, 
        Model model, HttpSession session
    ) {
        SellerVO seller = (SellerVO)session.getAttribute("login_seller");
        Integer seller_seq = 0;
        if(seller != null) seller_seq = seller.getSi_seq();
        model.addAttribute("keyword", keyword);
        if(keyword == null) keyword = "%%";
        else keyword = "%"+keyword+"%";
        if(offset == null) offset = 0;
        model.addAttribute("offset", offset);
        model.addAttribute("list", mapper.selectProductList(keyword, offset, seller_seq));
        model.addAttribute("root_cate", cate_mapper.selectRootCategories());

        Integer cnt = mapper.selectProductCnt(keyword, seller_seq);
        Integer page = (cnt/10)+(cnt%10>0 ? 1 : 0);

        model.addAttribute("cnt", cnt);
        model.addAttribute("page", page);
        model.addAttribute("menu1", "product");
        model.addAttribute("menu2", "list");
        return "/product/list";
    }

    @GetMapping("/product/recommend")
    public String getProductRecommend(Model model,
        @RequestParam @Nullable String keyword, 
        @RequestParam @Nullable Integer offset
    ) {
        model.addAttribute("keyword", keyword);
        if(keyword == null) keyword = "%%";
        else keyword = "%"+keyword+"%";

        if(offset == null) offset = 0;

        Integer cnt = mapper.selectProductCnt(keyword, 0);
        Integer page = (cnt/10)+(cnt%10>0 ? 1 : 0);

        model.addAttribute("cnt", cnt);
        model.addAttribute("page", page);

        model.addAttribute("list", mapper.selectRecommendProductList(keyword, offset));
        model.addAttribute("menu1", "product");
        model.addAttribute("menu2", "recommend");
        return "/product/recommend";
    }
    @GetMapping("/product/review")
    public String getProductReview(
        HttpSession session,
        @RequestParam @Nullable Integer offset,
        @RequestParam @Nullable String align_type,
        @RequestParam @Nullable String review_status,
        @RequestParam @Nullable String keyword,
        @RequestParam @Nullable String search_type,
        Model model
        ){
            SellerVO seller =(SellerVO)session.getAttribute("login_seller");
            Integer si_seq =0;
            model.addAttribute("keyword",keyword);
            if(seller != null) si_seq = seller.getSi_seq();
            if(offset == null) offset =0;
            if(align_type == null) align_type ="default";
            if(review_status == null) review_status ="all";
            if(keyword == null) keyword="%%";
            else keyword = "%"+keyword+"%";
            if(search_type == null) search_type = "all";

            model.addAttribute("list",mapper.selectProductReview(si_seq, offset,align_type,review_status,keyword,search_type));
            model.addAttribute("offset",offset);
            model.addAttribute("align_type",align_type);
            model.addAttribute("review_status",review_status);
            model.addAttribute("search_type",search_type);

            Integer cnt =mapper.selectProductReviewCount(si_seq, review_status, keyword, search_type);
            Integer page = (cnt/10)+(cnt%10>0?1:0);

            model.addAttribute("page",page);

        return "/product/review";
    }
}
