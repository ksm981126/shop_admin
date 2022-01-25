<%@page language="java" contentType="text/html; encoding=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="/WEB-INF/includes/header.jsp"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/assets/js/product_list.js"></script>
</head>
<body>
    <main>
        <h1>판매 제품 관리</h1>
        <div class="product_list_ara">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>썸네일</th>
                        <th>제품명</th>
                        <th>가격</th>
                        <th>할인율</th>
                        <th>적립율</th>
                        <th>등록일</th>
                        <th>재고</th>
                        <th>배송사</th>
                        <th>판매자</th>
                        <th>제조사</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.pi_seq}</td>
                            <td><img src="/image/product/${item.thumbnail}"></td>
                            <td>${item.pi_name}</td>
                            <td>${item.pi_price}</td>
                            <td>${item.pi_discount_rate}%</td>
                            <td>${item.pi_point_rate}%</td>
                            <td>
                                <fmt:formatDate value="${item.pi_release_date}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>${item.pi_stock}</td>
                            <td>${item.di_name}</td>
                            <td><span style="background-image: url('/image/seller/${item.si_img_url}')"></span>${item.si_name}</td>
                            <td>${item.mfi_name}</td>
                            <td>
                                <button class="detail" data-seq="${item.pi_seq}">상세정보</button>
                                <button class="delete" data-seq="${item.pi_seq}">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="popup_wrap">
            <div class="popup">
                <h1>제품<span>등록</span></h1>
                <div class="prod_basic_info">
                    <span>제품명</span>
                    <input type="text" id="pi_name">
                    <br>
                    <span>가격</span>
                    <input type="text" id="pi_price">
                    <br>
                    <span>부제목</span>
                    <input type="text" id="pi_sub_title">
                    <br>
                    <span>할인율</span>
                    <input type="text" id="pi_discount_rate">
                    <br>
                    <span>적립율</span>
                    <input type="text" id="pi_point_rate">
                    <br>
                    <span>재고</span>
                    <input type="text" id="pi_stock">
                    <br>
                    <span>카테고리</span>
                    <!-- <input type="text" id="pi_category"> -->
                    <div class="category_box">
                        <select name="" id="root_cate">
                            <option value="0">대분류 선택</option>
                            <c:forEach items="${root_cate}" var="item">
                                <option value="${item.cate_seq}">${item.cate_name}</option>
                            </c:forEach>
                        </select>
                        <select id="mid_cate" disabled>
                            <option value="0">중분류 선택</option>
                        </select>
                        <select id="small_cate" disabled>
                            <option value="0">소분류 선택</option>
                        </select>
                    </div>
                    <br>
                    <span>판매자</span>
                    <input type="text" id="pi_seller">
                    <br>
                    <span>배송사</span>
                    <input type="text" id="pi_delivery">
                    <br>
                    <span>제조사</span>
                    <input type="text" id="pi_manufacturer">
                    <br>
                    <span>상태</span>
                    <select id="pi_status">
                        <option value="0">판매중</option>
                        <option value="1">일시품절</option>
                        <option value="2">품절</option>
                        <option value="3">판매중단</option>
                    </select>
                </div>
                <div class="btns">
                    <button id="save">등록</button>
                    <button id="update">변경</button>
                    <button id="cancel">취소</button>
                </div>
            </div>
        </div>
        <div class="delivery_popup">
            <h1>배송사 검색</h1>
            <div class="delivery_list">
                <input type="text" id="delivery_keyword">
                <button id="delivery_search_btn">검색</button>
                <table>
                    <thead>
                        <tr>
                            <th>배송사 명</th>
                            <th>배송비</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                        
                            
                </table>
            </div>
            <div class="delivery_btns">
                <button id="delivery_save">저장</button>
                <button id="delivery_cancel">취소</button>
            </div>
        </div>
    </main>

    
</body>
</html>