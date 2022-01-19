package com.twogenesis.shoppingmall_admin.api;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.DeliveryVO;
import com.twogenesis.shoppingmall_admin.mapper.DeliveryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/delivery")
public class DeliveryAPIController {
    @Autowired DeliveryMapper mapper;
    @GetMapping ("/list")
    public List<DeliveryVO> getDeliveryList(@RequestParam @Nullable String keyword){
        if(keyword == null) keyword = "%%";
        else keyword = "%"+keyword+"%";

        return mapper.selectDeliveries(keyword);
    }
    @PostMapping("/add")
    public String postDeliveryAdd(@RequestBody DeliveryVO data){
        mapper.insertDelivery(data);
        return "배송사가 저장되었습니다.";
    }
    @PatchMapping("/update")
    public String patchDeliveryUpdate(@RequestBody DeliveryVO data){
        mapper.updateDelivery(data);
        return "배송사가 수정되었습니다.";
    }
    @DeleteMapping("/delete")
    public String deleteDelivery(@RequestParam Integer seq){
        mapper.deleteDelivery(seq);
        return "배송사가 삭제되었습니다.";
    }
    @GetMapping("/select_one")
    public DeliveryVO getDeliveryBySeq(@RequestParam Integer seq){
        return mapper.selectDeliveryBySeq(seq);
    }


}
