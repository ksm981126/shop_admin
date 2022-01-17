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
    <script src="/assets/js/category.js"></script>
    <style>
        .category_item{border: 1px solid #000; margin: 10px;}
        .category_item h2 {font-size: 12px; font-weight: 100;}
    </style>
</head>
<body>
    <main>
        <h1>카테고리 관리</h1>
        <div class="summary">
            <div class="summary_item">
                <img src="http://placehold.it/35x35">
                <div class="summary_item_text">
                    <p class="item_title">등록 카테고리 수</p>
                    <p><span class="count">${cnt}</span>개</p>
                </div>
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
                            ${ item.parent_name == null? "최상위 카테고리" : item.parent_name }
                        </h2>
                        <p>${item.cate_name} 카테고리 제품 수</p>
                        <p>
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
                <input type="checkbox" id="is_root">
                <label for="is_root">최상위 카테고리</label>
                <div class="category_select_area">
                    <select id="root_category"></select>
                    <select id="child_category_1">
                        <option value="0">카테고리 선택</option>
                    </select>
                </div>
                <div class="category_content">
                    <input type="text" placeholder="카테고리명 입력" id="category_name">
                    <button id="save">저장</button>
                    <button id="cancel">취소</button>
                </div>
            </div>
        </div>
    </main>
</body>
</html>