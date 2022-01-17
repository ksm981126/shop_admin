package com.twogenesis.shoppingmall_admin.api;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.twogenesis.shoppingmall_admin.data.CategoryVO;
import com.twogenesis.shoppingmall_admin.mapper.CategoryMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CategoryAPIController {
    @Autowired CategoryMapper mapper;
    // http://localhost:8756/category/get/root
    // http://localhost:8756/category/get/child?parent_seq=1
    @GetMapping("/category/get/{type}")
    public List<CategoryVO> getCategoryList(@PathVariable String type, @RequestParam @Nullable Integer parent_seq) {
        if(type.equals("root"))
            return mapper.selectRootCategories();
        if(type.equals("child") && parent_seq != null)
            return mapper.selectChildCategories(parent_seq);

        return null;
    }
    @PostMapping("/category/add")
    public String postCategoryAdd(@RequestBody CategoryVO data) {
        mapper.insertCategory(data);
        return "카테고리가 추가되었습니다.";
    }
    @DeleteMapping("/category/delete")
    public String deleteCategory(@RequestParam Integer seq){
        mapper.deleteCategory(seq);
        return "카테고리가 삭제되었습니다.";
    }
    @PatchMapping("/category/update")
    public String patchCategory(@RequestBody CategoryVO data){
        mapper.updateCategory(data);
        return "카테고리가 수정되었습니다.";
    }
    @GetMapping("/category/select_one")
    public Map<String, Object> getCategorySelectOne(@RequestParam Integer seq){
        List<Integer> parentList = new ArrayList<Integer>();
        Map<String,Object> resultMap = new LinkedHashMap<String, Object>();
        CategoryVO data = mapper.selectCategoryBySeq(seq);

        resultMap.put("data",data);
        
        while(data.getCate_parent() !=null) {
            parentList.add(data.getCate_parent());
            data = mapper.selectCategoryBySeq(data.getCate_parent());
            if(data == null) break;
        }
        resultMap.put("parents", parentList);
        return resultMap;
    }

}
