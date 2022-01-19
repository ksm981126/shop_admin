<%@page language="java" contentType="text/html; encoding=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="/WEB-INF/includes/header.jsp"%>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        let offset = "${offset}";
    </script>
    <script src="/assets/js/manufacturer.js"></script>
    <link rel="stylesheet" href="/assets/css/manage.css">
</head>
<body>
    <main>
        <h1>제조사 관리</h1>
        <div class="manufacturer_summary summary_area">
        <h2>총 ${cnt}개 제조사</h2>
        <div class="search_area">
            <div class="search_box">
                <input type="text" id="keyword" value="${keyword}">
                <a href="#" id="search_btn">검색</a>
            </div>
            <button id="add_manufacturer" class="add_btn"><i class="fas fa-plus-square"></i>제조사 추가</button>
        </div>
    </div>
    <div class="manufacturer_list item_list">
        <c:forEach items="${list}" var="item">
            <div class="manufacturer_item list_item">
                <div class="manufacturer_text item_text">
                    <p>${item.mfi_name}</p>
                    <p>${item.mfi_phone}</p>
                    <p>${item.mfi_email}</p>
                </div>
                <div class="manufacturer_btns item_btns">
                    <button class="modify" data-seq="${item.mfi_seq}"><i class="fas fa-edit"></i></button>
                    <button class="delete" data-seq="${item.mfi_seq}"><i class="fas fa-trash-alt"></i></button>
                </div>
            </div>
        </c:forEach>
    </div>
    <div class="manufacturer_popup_wrap popup_wrap">
        <div class="manufacturer_popup popup">
            <h2>제조사<span>추가</span></h2>
                        <td><input type="text" id="mfi_name" placeholder="제조사 이름"></td>
                        <td><input type="text" id="mfi_phone" placeholder="제조사 전화번호"></td>
                        <td><input type="text" id="mfi_email" placeholder="제조사 메일주소"></td>
            <div class="buttons">
                <button id="save">저장</button>
                <button id="update">수정</button>
                <button id="cancel">취소</button>
            </div>
        </div>
    </div>
    <div class="pager_area">
        <c:forEach begin="1" end="${page}" var="i">
            <a href="/manage/manufacturer?offset=${(i-1)*24}&keyword =${keyword}">${i}</a>
        </c:forEach>
    </div>
    </main>
</body>
</html>