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
    <script src="/assets/js/seller.js"></script>
    <link rel="stylesheet" href="/assets/css/seller.css">   
</head>
<body>
    <main>
        <h1>판매자 관리</h1>
        <div class="summary_area">
            <p>총 ${cnt}판매자</p>
            <div class="search_area">
                <div class="search_box">
                    <input type="text" id="keyword" value="${keyword}">
                    <a href="#" id="search_btn"><i class ="fas fa-search"></i></a>
                </div>
                <button id="add_seller"><i class="fas fa-plus-square"></i>판매자 추가</button>
            </div>
        </div>
        <div class="seller_list">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>아이디</th>
                        <th>판매자명</th>
                        <th>이메일</th>
                        <th>전화번호</th>
                        <th>주소</th>
                        <th>등록일</th>
                        <th>상태</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.si_seq}</td>
                            <td>
                                <span class="profile_img" style="background-image:url('/image/seller/${item.si_img_url}')"></span>
                                <span>${item.si_id}</span>
                            </td>
                            <td>${item.si_name}</td>
                            <td>${item.si_email}</td>
                            <td>${item.si_phone}</td>
                            <td>${item.si_address}</td>
                            <td>
                                <fmt:formatDate value="${item.si_reg_dt}" pattern="yyyy-MM-dd" />
                            </td>
                            <td>

                                <c:if test="${item.si_status == 1}"><span class="status st1">정상</span></c:if>
                                <c:if test="${item.si_status == 2}"><span class="status st2">판매정지</span></c:if>
                                <c:if test="${item.si_status == 3}"><span class="status st3">가입대기</span></c:if>
                                <c:if test="${item.si_status == 4}"><span class="status st4">탈퇴대기</span></c:if>
                                <c:if test="${item.si_status == 5}"><span class="status st5">영구정지</span></c:if>
                            </td>
                            <td>
                            <button class="modify" data-seq="${item.si_seq}">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="delete" data-seq="${item.si_seq}">
                                <i class="fas fa-trash-alt"></i>
                            </button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="popup_wrap">
            <div class="popup">
                <h2>판매자<span>추가</span></h2>
                <div class="seller_info">
                    <div class="seller_basic_info">
                        <div class="profile_img_area">
                            <img src="/image/seller/default.jpg" id="profile_img">
                            <div class="cover">
                                <i class="fas fa-upload"></i>
                                <p>사진업로드</p>
                            </div>
                        </div>
                            <form id="profile_img_form">
                                <input type="file" id="img_file" name="file">
                                <button type="button" id="img_upload">업로드</button>
                                <button type="button" id="img_delete">
                                    <i class="fas fa-times"></i>
                                </button>
                            </form>
                        <input type="text" id="si_id" placeholder="아이디">
                        <input type="text" id="si_name" placeholder="이름">
                        <input type="password" id="si_pwd" placeholder="비밀번호">
                        <input type="password" id="si_pwd_confirm" placeholder="비밀번호 확인">
                    </div>
                    <div class="seller_additional_info">
                        <input type="text" id="si_email" placeholder="이메일">
                        <input type="text" id="si_phone" placeholder="전화번호">
                        <textarea type="text" id="si_address" placeholder="주소"></textarea>
                        <select id="si_status">
                            <option value="0">선택</option>
                            <option value="1">정상</option>
                            <option value="2">판매정지</option>
                            <option value="3">가입대기</option>
                            <option value="4">탈퇴대기</option>
                            <option value="5">영구정지</option>
                        </select>
                        <div class="btns">
                            <button id="save">저장</button>
                            <button id="update">수정</button>
                            <button id="cancel">취소</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="pager_area">
            <c:forEach begin="1" end="${page}" var="i">
                <a href="/account/seller?offset=${(i-1)*10}&keyword=${keyword}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>