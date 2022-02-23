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
</head>
<body>
    <main>
        <h1>리뷰 관리</h1>
        <div class="summary_area">
            <div class="summary">
                <h2>총 등록 리뷰 수 :${cnt}개</h2>
                <p>페이지 : <span id="current_page">1/</span>/${page}</p>
            </div>
            <div class="search_area">
                <div class="search_box">
                    <input type="text" id="keyword" value="${keyword}">
                    <a href="#" id="search_btn">검색</a>
                </div>
            </div>
        </div>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>내용</th>
                    <th>별점</th>
                    <th>아이디</th>
                    <th>등록일</th>
                    <th></th>
                </tr>
            </thead>
            <div class="review_list">
                <c:forEach items="${list}" var="item">
                    <tbody>
                        <tr>
                            <td>${item.ri_seq}</td>
                            <td>${item.ri_content}</td>
                            <td>${item.ri_score}</td>
                            <td>${item.email}</td>
                            <td>
                                <fmt:formatDate value="${item.ri_reg_dt}" pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </div>
        </table>
        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/product/review?offset=${(i-1)*10}&keyword=${keyword}">${i}</a>
            </c:forEach>
        </div>
    </main>

    
</body>
</html>