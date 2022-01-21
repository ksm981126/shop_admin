package com.twogenesis.shoppingmall_admin.api;

import java.util.LinkedHashMap;
import java.util.Map;

import com.twogenesis.shoppingmall_admin.data.SellerVO;
import com.twogenesis.shoppingmall_admin.mapper.SellerMapper;
import com.twogenesis.shoppingmall_admin.util.AESAlgorithm;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/seller")
public class SellerAPIController {
    @Autowired SellerMapper mapper;
    @PostMapping("/add")
    public Map<String, Object>postSellerAdd(@RequestBody SellerVO data)throws Exception{
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();

        data.setSi_pwd(AESAlgorithm.Encrypt(data.getSi_pwd()));

        if(mapper.isExistSellerId(data.getSi_id()) == 1){
            resultMap.put("status", false);
            resultMap.put(("message"), data.getSi_id()+"은/는 이미 존재하는 ID 입니다.");
            return resultMap;
        }
        mapper.insertSeller(data);
        resultMap.put("status", true);
        resultMap.put("message", "판매자가 등록되었습니다.");

        return resultMap;
    }
    @GetMapping("/select_one")
    public SellerVO getSellerSelectOne(@RequestParam Integer seq){
        
        return mapper.selectSellerBySeq(seq);
    }

    @PatchMapping("/update")
    public Map<String,Object> patchSellerInfo(@RequestBody SellerVO data){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        if(mapper.isExistSellerId(data.getSi_id()) == 1){
            mapper.updateSeller(data);
            resultMap.put("status", true);
            resultMap.put("message", "판매자 정보가 수정되었습니다.");
        }
        else {
            resultMap.put("status", false);
            resultMap.put("message",data.getSi_id()+"은/는 존재하니 않는 아이디 입니다");
        }
        return resultMap;
    }

    @DeleteMapping("/delete")
    public String deleteSeller(@RequestParam Integer seq){
        mapper.deleteSeller(seq);
        return "판매자가 삭제되었습니다.";
    }
}   
