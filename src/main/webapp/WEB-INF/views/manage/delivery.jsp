<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/includes/header.jsp"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="/assets/js/delivery.js"></script>
    <link rel="stylesheet" href="/assets/css/manage.css">
</head>
<body>
    <main>
        <h1>배송사 관리</h1>
        <div class="delivery_summary summary_area">
            <h2>총 ${cnt} 배송사</h2>
            <div class="search_area">
                <div class="search_box">
                    <input type="text" id="keyword" value="${keyword}">
                    <a href="#" id="search_btn">검색</a>
                </div>
                <button id="add_delivery" class="add_btn">배송사 추가</button>
                </div>
            </div>
        <div class="delivery_list item_list">
            <c:forEach items="${list}" var ="item">
            <div class="delivery_item list_item">
                <div class="delivery_text item_text">
                    <p>${item.di_name}</p>
                    <p><fmt:formatNumber value="${item.di_price}" maxFractionDigits="3"/>원</p>
                </div>
                <div class="delivery_btns item_btns">
                    <button class="modify" data-seq="${item.di_seq}">수정</button>
                    <button class="delete" data-seq="${item.di_seq}">삭제</button>
                </div>
            </div>
        </c:forEach>
        </div>
        <div class="delivery_popup_wrap popup_wrap">
            <div class="delivery_popup popup">
                <h2>배송사 <span>추가</span></h2>
                <span>배송사 명</span>
                <input type="text" id="delivery_name">
                <br>
                <span>배송비</span>
                <input type="text" id="delivery_price">
                <div class="buttons">
                    <button id="save">저장</button>
                    <button id="update">수정</button>
                    <button id="cancel">취소</button>
                </div>
            </div>

        </div>
    </main>
</body>
</html>