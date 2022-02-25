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
    <script>
        let keyword = "${keyword}";
        let offset = "${offset}";
        let align_type = "${align_type}";
        let review_status = "${review_status}";
        let search_type ="${search_type}";
    </script>
    <script src="/assets/js/review.js"></script>
</head>
<body>
    <main>
        <h1>리뷰 관리</h1>
        <div class="review_header">
            <div class="align_type">
                <span>정렬 기준</span>
                <button id="align_default" data-align="default">번호 순서</button>
                <button id="align_report" data-align="report">신고누적 수</button>
                <button id="align_date" data-align="date">날짜</button>
            </div>
            <div class="blind_status">
                <span>블라인드 여부</span>
                <button id="all" data-blind="all">모든 리뷰</button>
                <button id="blind" data-blind="blind">블라인드 된 리뷰</button>
                <button id="not_blind" data-blind="not_blind">정상 노출 리뷰</button>
            </div>
            <div class="search_area">
                <select id="search_type">
                    <option value="all">전체</option>
                    <option value="prod">제품명</option>
                    <option value="review">리뷰내용</option>
                </select>
                <input type="text" id="keyword" value="${keyword}">
                <button id="search_btn">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
        <table>
            <thead>
                <tr>
                    <th>리뷰번호</th>
                    <th>제품명</th>
                    <th>리뷰내용</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>신고수</th>
                    <th>버튼</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${list}" var="item">
                    <tr>
                        <td>${item.ri_seq}</td>
                        <td>${item.pi_name}</td>
                        <td>${item.ri_content}</td>
                        <td>${item.mi_name}</td>
                        <td>
                            <fmt:formatDate value="${item.ri_reg_dt}" pattern="yyyy-MM-dd"/>
                        </td>
                        <td>${item.ri_report_cnt}</td>
                        <td>
                            <c:if test="${item.ri_status !=1}">
                                <button class="status_btn review_blind" data-seq="${item.ri_seq}" data-status="1">블라인드 처리</button>
                            </c:if>
                            <c:if test="${item.ri_status ==1}">
                                <button class="status_btn review_blind_cancel" data-seq="${item.ri_seq}" data-status="0">블라인드 해제</button>
                            </c:if>
                            <c:if test="${item.ri_status !=2}">
                                <button class="status_btn review_delete" data-seq="${item.ri_seq}" data-status="2">삭제 처리</button>
                            </c:if>
                            <c:if test="${item.ri_status ==2}">
                                <button class="status_btn review_delete_cancel" data-seq="${item.ri_seq}" data-status="0">삭제 취소</button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/product/review?align_type=${align_type}&review_status=${review_status}&keyword=${keyword}&offset=${(i-1)*10}&search_type=${search_type}">${i}</a>
            </c:forEach>
        </div>
    </main>

    
</body>
</html>