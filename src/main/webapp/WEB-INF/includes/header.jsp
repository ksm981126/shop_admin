<%@page language="java" contentType="text/html; encoding=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/reset.css">
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
    <link rel="stylesheet" href="/assets/css/header.css">
    <script src="/assets/plugins/jquery-3.4.1.min.js"></script>
</head>
<body>
    <header>
        <a href="#" id="logo">
            <img src="http://placehold.it/150x50">
        </a>
        <nav id="gnb">
            <a href="#" id="alarm">
                <img src="http://placehold.it/35x35">
                <span class="new_badge"></span>
            </a>
            <a href="#" id="msg">
                <img src="http://placehold.it/35x35">
                <span class="new_badge"></span>
            </a>

            <a href="#">
                <img src="http://placehold.it/35x35">
                <span>사용자(user01)</span>
            </a>
        </nav>
    </header>
    <%@include file="/WEB-INF/includes/left_menu.jsp"%>
</body>
</html>