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
                            <td><img src="http://placehold.it/100x100"></td>
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
    </main>

    
</body>
</html>