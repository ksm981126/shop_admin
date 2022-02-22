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
    <link rel="stylesheet" href="/assets/css/recommend.css">
    <script src="/assets/js/recommend.js"></script>
</head>
<body>
    <main>
        
        <div class="page_header">
            <h1>추천 제품 관리</h1>
            <div class="type_area">
                <button class="current">전체</button>
                <button>추천됨</button>
                <button>미추천</button>
            </div>
            <div class="search_area">
                <div class="search_box">
                    <select id="type">
                        <option value="name">제품명</option>
                        <option value="seller">판매자</option>
                        <option value="manufacturer">제조사</option>
                    </select>
                    <input type="text" id="keyword" value="${keyword}">
                    <button id="search">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
        <div class="recommend_list">
            <c:forEach items="${list}" var="item">
                <div class="recommend_item">
                    <div class="thumb" style="background-image:url(/image/product/${item.thumbnail})"></div>
                    <p class="prod_seller">${item.si_name}</p>
                    <p class="prod_name">
                        <span class="manufacturer">${item.mfi_name}</span>
                        <span class="name">${item.pi_name}</span>
                    </p>
                    <div class="price_area">
                        <p class="discount_rate">
                            <fmt:formatNumber value="${item.pi_discount_rate}" pattern="###.#"/>%
                        </p>
                        <p class="prod_price">
                            <fmt:formatNumber value="${item.pi_price}" pattern="###,###,###"/>원
                        </p>
                        <p class="discounted">
                            <fmt:formatNumber value="${item.discounted_price}" pattern="###,###,###"/>원
                        </p>
                    </div>
                    <button class="recommend_btn <c:if test='${item.recommend != null}'>active</c:if>" data-seq="${item.pi_seq}"></button>
                </div>
            </c:forEach>
        </div>
        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/product/recommend?keyword=${keyword}&offset=${(i-1)*10}" class="pager">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>