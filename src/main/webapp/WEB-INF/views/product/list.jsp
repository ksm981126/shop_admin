<%@page language="java" contentType="text/html; charset=UTF-8"
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
    <link rel="stylesheet" href="/assets/css/product_list.css">
    <script>
        $(function(){
            let offset ="${offset}";
            $("#current_page").html(offset/10+1);
        })
    </script>
</head>
<body>
    <main>
        <h1>판매 제품 관리</h1>
        <div class="summary_area">
            <div class="summary">
                <h2>총 등록 제품 수 :${cnt}개</h2>
                <p>페이지 : <span id="current_page">1/</span>/${page}</p>
            </div>
            <div class="search_area">
                <div class="search_box">
                    <input type="text" id="keyword" value="${keyword}">
                    <a href="#" id="search_btn">검색</a>
                </div>
                <button id="add_product" class="add_btn">
                    <i class="fas fa-plus-square"></i>제품 추가
                </button>
            </div>
        </div>
        <div class="product_list_area">
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
                        <th> </th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.pi_seq}</td>
                            <td>
                                <span class="prod_thumb" style="background-image: url(/image/product/${item.thumbnail})"></span>
                            </td>
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
                                <button class="detail" data-seq="${item.pi_seq}" title="상세정보"><i class="fas fa-info-circle"></i></button>
                                <button class="delete" data-seq="${item.pi_seq}" title="삭제"><i class="fas fa-trash"></i></button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/product/list?keyword=${keyword}&offset=${(i-1)*10}" class="pager">${i}</a>
            </c:forEach>
        </div>
        <div class="popup_wrap">
            <div class="popup">
                <h1>제품<span>등록</span></h1>
                <div class="prod_basic_info">
                    <div class="category_box">
                        <span>카테고리</span>
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
                        
                        <span>상태</span>
                        <select id="pi_status">
                            <option value="0">판매중</option>
                            <option value="1">일시품절</option>
                            <option value="2">품절</option>
                            <option value="3">판매중단</option>
                        </select>
                    </div>
                    <table>
                        <tbody>
                            <tr>
                                <td>제품명</td>
                                <td><input type="text" id="pi_name"></td>
                                <td>가격</td>
                                <td><input type="text" id="pi_price"></td>
                                <td>재고</td>
                                <td><input type="text" id="pi_stock"></td>
                            </tr>
                            <tr>
                                <td>부제목</td>
                                <td><input type="text" id="pi_sub_title"></td>
                                <td>할인율</td>
                                <td><input type="text" id="pi_discount_rate" value="0"></td>
                                <td>적립율</td>
                                <td><input type="text" id="pi_point_rate" value="0"></td>
                            </tr>
                            <tr>
                                <td>판매자</td>
                                <td><input type="text" id="pi_seller" value="${login_seller.si_name}" data-seq="${login_seller.si_seq}" disabled></td>
                                <td>배송사</td>
                                <td><input type="text" id="pi_delivery"></td>
                                <td>제조사</td>
                                <td><input type="text" id="pi_manufacturer"></td>
                            </tr>
                        </tbody>
                    </table>

                </div>
                <div class="product_img_area">
                    <h2>제품 이미지<span>(첫 번째로 등록하는 이미지는 대표 이미지로 사용됩니다.</span></h2>
                    <div class="product_imgs">
                    </div>
                    <div class="product_img_add">
                        <div class="icon">
                            <i class="far fa-image"></i>
                            <i class="fas fa-plus-square"></i> 
                        </div>
                        <form id="prod_img_form">
                            <input type="file" name="file" id="prod_img_input">
                            <button id="prod_img_add" type="button">
                                <i class="fas fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>
                    <div class="product_description_area">
                        <h2>제품 설명</h2>
                        <textarea id="prod_description"></textarea>
                    </div>
                <div class="product_desc_img_area">
                    <h2>제품 상세 이미지</h2>
                    <div class="product_desc_imgs">
                    </div>
                    <div class="product_desc_img_add">
                        <div class="icon">
                            <i class="far fa-image"></i>
                            <i class="fas fa-plus-square"></i> 
                        </div>
                        <form id="prod_desc_img_form">
                            <input type="file" name="file" id="prod_desc_img_input">
                            <button id="prod_desc_img_add" type="button">
                                <i class="fas fa-plus"></i>
                            </button>
                        </form>
                    </div>
                </div>

                <div class="btns">
                    <button id="save">등록</button>
                    <button id="update">변경</button>
                    <button id="cancel">취소</button>
                </div>
        </div>
        </div>
        <div class="delivery_popup search_popup">
            <h1>배송사 검색</h1>
            <div class="delivery_list">
                <input type="text" id="delivery_keyword" placeholder="검색할 배송사 명을 입력하세요">
                <button id="delivery_search_btn">검색</button>
                <div class="table_area">
                    <table>
                        <thead>
                            <tr>
                                <th>배송사 명</th>
                                <th>배송비</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="delivery_btns">
                <button id="delivery_save">저장</button>
                <button id="delivery_cancel">취소</button>
            </div>
        </div>

        <div class="manufacturer_popup search_popup">
            <h1>제조사 검색</h1>
            <div class="manufacturer_list">
                <input type="text" id="manufacturer_keyword" placeholder="검색할 제조사 명을 입력하세요">
                <button id="manufacturer_search_btn">검색</button>
                <div class="table_area">
                    <table>
                        <thead>
                            <tr>
                                <th>제조사명</th>
                                <th>전화번호</th>
                                <th>이메일</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <div class="mf_pager_area">
            </div>
                    
            </div>
            <div class="manufacturer_btns">
                <button id="manufacturer_save">저장</button>
                <button id="manufacturer_cancel">취소</button>
            </div>
        </div>
    </main>

    
</body>
</html>