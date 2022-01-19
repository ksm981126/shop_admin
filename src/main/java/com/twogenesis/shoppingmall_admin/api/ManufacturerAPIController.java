package com.twogenesis.shoppingmall_admin.api;

import com.twogenesis.shoppingmall_admin.data.ManufacturerVO;
import com.twogenesis.shoppingmall_admin.mapper.ManufacturerMapper;

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
@RequestMapping("/manufacturer")
public class ManufacturerAPIController {
    @Autowired ManufacturerMapper mapper;
    @GetMapping("/select_one")
    public ManufacturerVO selectManufacturerBySeq(@RequestParam Integer seq){
        return mapper.selectManufacturerBySeq(seq);
    }
    @PostMapping("/add")
    public String InsertManufacturer(@RequestBody ManufacturerVO data){
        mapper.insertManufacturer(data);
        return "제조사가 추가되었습니다.";
    }
    @PatchMapping("/update")
    public String updateManufacturer(@RequestBody ManufacturerVO data){
        mapper.updateManufacturer(data);
        return "제조사가 수정되었습니다.";
    }
    @DeleteMapping("/delete")
    public String deleteManufacturer(@RequestParam Integer seq){
        mapper.deleteManufacturer(seq);
        return "제조사가 삭제되었습니다.";
    }
}
