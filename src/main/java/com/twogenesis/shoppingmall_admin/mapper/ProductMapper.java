package com.twogenesis.shoppingmall_admin.mapper;

import java.util.List;

import com.twogenesis.shoppingmall_admin.data.ProductDataVO;
import com.twogenesis.shoppingmall_admin.data.ProductDescImageVO;
import com.twogenesis.shoppingmall_admin.data.ProductDescVO;
import com.twogenesis.shoppingmall_admin.data.ProductImageVO;
import com.twogenesis.shoppingmall_admin.data.ProductVO;
import com.twogenesis.shoppingmall_admin.data.ReviewInfoVO;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {
    List<ProductVO> selectProductList(String keyword, Integer offset, Integer seller_seq);
    List<ProductVO> selectRecommendProductList(String keyword, Integer offset);

    ProductVO selectProductBySeq(Integer seq);
    String selectProductDescription(Integer seq);

    Integer selectProductCnt(String keyword, Integer seller_seq);
    void insertProductInfo(ProductDataVO data);
    void insertProductImage(ProductImageVO data);
    void insertProductDescription(ProductDescVO data);
    void insertProductDescImage(ProductDescImageVO data);

    List<String> selectProductImgNames(Integer seq);
    List<String> selectProductDescImgNames(Integer seq);

    void deleteProduct(Integer seq);
    void deleteProductImage(String filename);
    void deleteDetailProductImage(String filename);

    void updateProductInfo(ProductDataVO data);
    void updateProdDetailDesc(String desc, Integer seq);
    void deleteProductImageBySeq(Integer seq);
    void deleteProductDetailImageBySeq(Integer seq);

    void insertProductRecommend(Integer seq);
    void deleteProductRecommend(Integer seq);

    List<ReviewInfoVO> selectReviewList(String keyword,Integer offset);
    Integer getReviewCnt(String keyword);
}
