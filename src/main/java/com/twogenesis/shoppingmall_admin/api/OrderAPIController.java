package com.twogenesis.shoppingmall_admin.api;

import com.twogenesis.shoppingmall_admin.mapper.OrderMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/order")
public class OrderAPIController {
    @Autowired OrderMapper order_mapper;
    @PatchMapping("/delivery")
    public String patchOrderDelivery(
        @RequestParam Integer seq,
        @RequestParam String delivery_no
    ){
        order_mapper.updateOrderStatus(seq, delivery_no);
        return "송장번호가 등록되었습니다.";
    }
}
