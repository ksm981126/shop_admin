package com.twogenesis.shoppingmall_admin.controller;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.DeliveryVO;
import com.twogenesis.shoppingmall_admin.mapper.DeliveryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DeliveryController {
    @Autowired DeliveryMapper mapper;
    @GetMapping("/manage/delivery")
    public String getManagerDelivery(@RequestParam@Nullable String keyword, Model model){
        model.addAttribute("keyword", keyword);

        if(keyword ==null)keyword ="%%";
        else keyword = "%"+keyword+"%";

        List<DeliveryVO> list = mapper.selectDeliveries(keyword);
        Integer cnt = mapper.selectDeliveryCnt(keyword);

        model.addAttribute("list", list);
        model.addAttribute("cnt", cnt);

        return "/manage/delivery";
    }
}
