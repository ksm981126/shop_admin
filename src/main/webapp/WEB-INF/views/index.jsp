<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script>
        if("${login_status}" != 'normal' && "${login_status}" !=''){
            alert("${login_msg}");
        }
        if("${adminuser}" != '' || '${login_seller}' !=''){
            location.href ="summary"
        }
    </script>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="/assets/css/login.css">
</head>
<body>
    <div class="login_form">
        <h1>판매자 로그인</h1>
        <p>Seller Login</p>
        <form action="/login" method="post">
            <p>Seller ID</p>
            <input type="text" id="user_id" placeholder="아이디" name="user_id">
            <p>Password</p>
            <input type="password" id="user_pwd" placeholder="비밀번호" name="user_pwd">
            <button type="submit">로그인</button>
        </form>
        <p></p>
        <a href="/admin">관리자 로그인</a>
    </div>
</body>
</html>