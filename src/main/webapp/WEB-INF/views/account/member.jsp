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
    <script src="/assets/js/member.js"></script>
    <link rel="stylesheet" href="/assets/css/member.css">
</head>
<body>
    <main>
        <h1>회원관리</h1>
        <div class="summary_area">
            <p>총${cnt} 회원</p>
            <div class="search_area">
                <div class="search_box">
                    <select id="search_type">
                        <option <c:if test="${type == 'email'}">selected</c:if> value="email">이메일</option>
                        <option <c:if test="${type == 'name'}">selected</c:if> value="name">이름</option>
                        <option <c:if test="${type == 'birth'}">selected</c:if> value="birth">생년월일</option>
                        <option <c:if test="${type == 'address'}">selected</c:if> value="address">주소</option>
                        <option <c:if test="${type == 'phone'}">selected</c:if> value="phone">전화번호</option>
                    </select>
                    <input type="text" id="keyword" value="${keyword}">
                    <a href="#" id="search_btn"><i class="fas fa-search"></i></a>
                </div>
                    <button id="add_member"><i class="fas fa-plus-square"></i>회원 추가</button>
            </div>
        </div>
        <div class="member_list">
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>이메일</th>
                        <th>회원이름</th>
                        <th>생년월일</th>
                        <th>성별</th>
                        <th>주소</th>
                        <th>전화번호</th>
                        <th>회원등급</th>
                        <th>상태</th>
                        <th>계정유형</th>
                        <th>등록일</th>
                        <th>탈퇴일</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="item">
                        <tr>
                            <td>${item.mi_seq}</td>
                            <td>${item.mi_email}</td>
                            <td>${item.mi_name}</td>
                            <td>${item.mi_birth}</td>
                            <td>
                                <c:if test="${item.mi_gen == 0}"><span>선택안함</span></c:if>
                                <c:if test="${item.mi_gen == 1}"><span>남성</span></c:if>
                                <c:if test="${item.mi_gen == 2}"><span>여성</span></c:if>
                            </td>
                            <td>${item.mi_address}</td>
                            <td>${item.mi_phone}</td>
                            <td>
                                <c:if test="${item.mi_grade == 0}"><span class="grade gd1">신규</span></c:if>
                                <c:if test="${item.mi_grade == 1}"><span class="grade gd2">일반</span></c:if>
                                <c:if test="${item.mi_grade == 2}"><span class="grade gd3">우수</span></c:if>
                                <c:if test="${item.mi_grade == 3}"><span class="grade gd4">VIP</span></c:if>
                                <c:if test="${item.mi_grade == 4}"><span class="grade gd5">VVIP</span></c:if>
                            </td>
                            <td>
                                <c:if test="${item.mi_status == 1}"><span class="status st1">정상</span></c:if>
                                <c:if test="${item.mi_status == 2}"><span class="status st2">사용정지</span></c:if>
                                <c:if test="${item.mi_status == 3}"><span class="status st3">가입대기</span></c:if>
                                <c:if test="${item.mi_status == 4}"><span class="status st4">탈퇴대기</span></c:if>
                                <c:if test="${item.mi_status == 5}"><span class="status st5">영구정지</span></c:if>
                            </td>
                            <td>
                                <c:if test="${item.mi_role == 1}"><span class="role r1">일반사용자</span></c:if>
                                <c:if test="${item.mi_role == 2}"><span class="role r2">관리자</span></c:if>
                                <c:if test="${item.mi_role == 99}"><span class="role r99">슈퍼유저</span></c:if>
                            </td>
                            <td>                          
                                <fmt:formatDate value="${item.mi_reg_dt}" pattern="yyyy-MM-dd" />
                            </td>
                            <td>      
                                <c:if test="${item.mi_leave_dt != null}">                 
                                    <fmt:formatDate value="${item.mi_leave_dt}" pattern="yyyy-MM-dd" />
                                </c:if>  
                                <c:if test="${item.mi_leave_dt == null}">
                                    -
                                </c:if>
                            </td>
                            <td>
                            <button class="modify" data-seq="${item.mi_seq}">
                                <i class="fas fa-edit"></i>
                            </button>
                            <button class="delete" data-seq="${item.mi_seq}">
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
                <h2>회원<span>추가</span></h2>
                <div class="member_info">
                    <div class="seller_basic_info">
                        <input type="text" id="mi_email" placeholder="이메일">
                        <input type="text" id="mi_name" placeholder="이름">
                        <input type="password" id="mi_pwd" placeholder="비밀번호">
                        <input type="password" id="mi_pwd_confirm" placeholder="비밀번호 확인">
                        <input type="text" id="mi_phone" placeholder="전화번호">
                        <input type="text" id="mi_birth" placeholder="생년월일">
                        <select id="mi_gen">
                            <option value="0">선택안함</option>
                            <option value="1">남성</option>
                            <option value="2">여성</option>
                        </select>
                    </div>
                    <div class="member_additional_info">
                        <textarea type="text" id="mi_address" placeholder="주소"></textarea>
                        <select id="mi_grade">
                            <option value="0">신규</option>
                            <option value="1">일반</option>
                            <option value="2">우수</option>
                            <option value="3">VIP</option>
                            <option value="4">VVIP</option>
                        </select>
                        <select id="mi_status">
                            <option value="0">선택</option>
                            <option value="1">정상</option>
                            <option value="2">판매정지</option>
                            <option value="3">가입대기</option>
                            <option value="4">탈퇴대기</option>
                            <option value="5">영구정지</option>
                        </select>
                        <select id="mi_role">
                            <option value="1">일반사용자</option>
                            <option value="2">관리자</option>
                            <option value="99">슈퍼유저</option>
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
                <a href="/account/member?offset=${(i-1)*10}&keyword=${keyword}">${i}</a>
            </c:forEach>
        </div>
    </main>
</body>
</html>