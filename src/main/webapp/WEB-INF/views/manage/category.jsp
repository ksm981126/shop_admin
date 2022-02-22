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
    <link rel="stylesheet" href="/assets/css/category.css">
    <script>
        let type = '${type}';
        let keyword = '${keyword}';
        let offset ='${offset}';
        </script>
        <script src="/assets/js/category.js"></script>
</head>
<body>
    <main>
        <h1>
            <a href="/manage">관리</a>
            <span>&gt;</span>
            <a href="/manage/category">카테고리 관리</a>
        </h1>
        <div class="summary">
            <div class="summary_item">
                <div class="summary_item_text">
                    <p class="count">총 ${cnt}개 카테고리 </p>
                    <p class="type_p"><span class="type">전체</span>등록 카테고리</p>
                </div>
            </div>
            <div class="category_types">
                <a href="#" data-type="all">전체</a>
                <a href="#" data-type="root">최상위분류</a>
                <a href="#" data-type="child">하위분류</a>
            </div>
            <div class="search_area">
                <div class="search_box">
                    <input type="text" id="search_keyword">
                    <a href="#">검색</a>
                </div>
                <button id="add_category">
                    <img src="http://placehold.it/25x25">
                    <span>카테고리 추가</span>
                </button>
            </div>
        </div>

        <div class="category_list">
            <c:forEach items="${list}" var="item">
                <div class="category_item">
                    <div class="category_item_left">
                        <h2>상위 카테고리 : 
                            <%--
                            <c:if test="${item.parent_name != null}">
                            ${item.parent_name}
                            </c:if>
                            <c:if test="${item.parent_name == null}">
                            최상위 카테고리
                            </c:if>
                            --%>
                            ${ item.parent_name == null? "최상위" : item.parent_name }
                        </h2>
                        <p>${item.cate_name} 제품 수</p>
                        <p class="item_cnt">
                            <%--
                            <c:if test="${item.count != null}">${item.count}</c:if>
                            <c:if test="${item.count == null}">0</c:if>
                            --%>
                            ${ item.count==null ? 0 : item.count }
                        </p>
                    </div>
                    <div class="category_item_right">
                        <button class="category_modify" data-seq="${item.cate_seq}">수정</button>
                        <button class="category_delete" data-seq="${item.cate_seq}">삭제</button>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="add_category_wrap">
            <div class="add_category_popup">
                <h2 class="popup_title">카테고리<span>추가</span></h2>
                <input type="checkbox" id="is_root">
                <label for="is_root">최상위 카테고리</label>
                <div class="category_select_area">
                    <span>대분류</span>
                    <select id="root_category"></select>
                    <br>
                    <span>중분류</span>
                    <select id="child_category_1">
                        <option value="0">카테고리 선택</option>
                    </select>
                </div>
                <div class="category_content">
                    <input type="text" placeholder="카테고리명 입력" id="category_name">
                    <br>
                    <button id="save">저장</button>
                    <button id="modify" style="display: none;">수정</button>
                    <button id="cancel">취소</button>
                </div>
            </div>
        </div>
        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/manage/category?offset=${(i-1)*12}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>