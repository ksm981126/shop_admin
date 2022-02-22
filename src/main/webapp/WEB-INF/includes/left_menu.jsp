<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/assets/css/left_menu.css">
    <script>
        $(function(){
            let menu1 = "${menu1}";
            let menu2 = "${menu2}";
            $("#left_menu > li").removeClass("current");
            if(menu1 == "summary") {
                $("#left_menu > li").eq(0).addClass("current");
            }
            else if(menu1 == "manage") {
                $("#left_menu > li").eq(1).addClass("current");
                if(menu2 == "category") {
                    $(".manage li").eq(0).find("a").css("color", "#fe634d");
                }
                else if(menu2 == "delivery") {
                    $(".manage li").eq(1).find("a").css("color", "#fe634d");
                }
                else if(menu2 == "manufacturer") {
                    $(".manage li").eq(2).find("a").css("color", "#fe634d");
                }
            }
            else if(menu1 == "product") {
                $("#left_menu > li").eq(2).addClass("current");
                if(menu2 == "list") {
                    $(".product li").eq(0).find("a").css("color", "#fe634d");
                }
                else if(menu2 == "review") {
                    $(".product li").eq(1).find("a").css("color", "#fe634d");
                }
                else if(menu2 == "qna") {
                    $(".product li").eq(2).find("a").css("color", "#fe634d");
                }
            }
            else if(menu1 == "order") {
                $("#left_menu > li").eq(3).addClass("current");
                if(menu2 == "list") {
                    $(".order li").eq(0).find("a").css("color", "#fe634d");
                }
            }
        })
    </script>
</head>
<body>
    <nav id="left_nav">
        <ul id="left_menu">
            <li>
                <a href="/summary">
                    <i class="fas fa-chart-bar"></i>
                    <span>Summary</span>
                </a>
            </li>
            <li>
                <a href="/manage">
                    <i class="fas fa-tasks"></i>
                    <span>Manage</span>
                </a>
            </li>
            <ul class="sub manage">
                <li>
                    <a href="/manage/category"><i class="fas fa-ellipsis-h"></i> <span>Category</span></a>
                </li>
                <li>
                    <a href="/manage/delivery"><i class="fas fa-truck-loading"></i> <span>Delivery</span></a>
                </li>
                <li>
                    <a href="/manage/manufacturer"><i class="fas fa-industry"></i> <span>Manufacturer</span></a>
                </li>
            </ul>
            <c:if test="${adminuser != null}">
            <li>
                <a href="/account">
                    <i class="fas fa-user"></i>
                    <span>Accounts</span>
                </a>
            </li>
            <ul class="sub account">
                <li>
                    <a href="/account/member"><i class="fas fa-users"></i> <span>Members</span></a>
                </li>
                <li>
                    <a href="/account/seller"><i class="fab fa-shopify"></i> <span>Sellers</span></a>
                </li>
            </ul>
            </c:if>
            <li>
                <a href="/product">
                    <i class="fas fa-box"></i>
                    <span>Products</span>
                </a>
            </li>
            <ul class="sub product">
                <li>
                    <a href="/product/list"><i class="fas fa-list"></i> <span>Product List</span></a>
                </li>
                <li>
                    <a href="/product/review"><i class="fas fa-history"></i> <span>Product Review</span></a>
                </li>
                <li>
                    <a href="/product/qna"><i class="fas fa-question"></i> <span>Product QNA</span></a>
                </li>
            </ul>
            <li>
                <a href="/order">
                    <i class="fas fa-truck"></i>
                    <span>Order</span>
                </a>
            </li>
            <ul class="sub order">
                <li>
                    <a href="/order/list"><i class="fas fa-list"></i> <span>Order List</span></a>
                </li>
            </ul>
        </ul>
        <div class="left_menu_btn">
            <i class="fas fa-chevron-left"></i>
            <i class="fas fa-chevron-right"></i>
        </div>
    </nav>
</body>
</html>