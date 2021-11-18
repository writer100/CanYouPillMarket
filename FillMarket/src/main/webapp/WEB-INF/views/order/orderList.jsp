<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 목록</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Secular+One&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Nanum Gothic', sans-serif;
        }
        
        header {
            height: 230px;
            background-color: cornsilk;
            text-align: center;
        }

        footer {
            height: 230px;
            background-color: cadetblue;
            text-align: center;
        }

        section {
            width: 1400px;
            /* background-color: crimson; */
            margin-right: auto;
            margin-left: auto;
        }

        .top {
            width: 1250px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        .title {
            font-size: 25px;
        }

        .myOrder {
            border : 2px solid lightgray;
            padding : 20px;
            width: 1100px;
            height: 170px;
            margin-left: auto;
            margin-right: auto;
            /* margin-left: 50px; */
        }

        #myOrder_tb {
            border-collapse: separate;
            border-spacing: 0 2px;
            /* border-collapse: collapse; */
            /* text-align: center; */
            margin-left: auto;
            margin-right: auto;
        }

        #myOrder_tb tr td:first-child {
            font-size: 20px;
            font-weight: bold;
        }

        #myOrder_tb tr td {
            height: 30px;
        }
        
    </style>
</head>
<body>
    <header>
        <h1>header</h1>
    </header>
    <br><br><br><br><br>

    <section>
        <div class="top">
            <span class="title">나의 주문내역</span>
        </div>
        <br>
        <hr>
        <br><br>
        <div class="myOrder">
            <table id="myOrder_tb">
                <tr>
                    <td width="300px">주문번호</td>
                    <td width="600px"><a href="../views/orderDetail.html">20211116_1234</a></td>
                </tr>
                <tr>
                    <td width="300px">주문일자</td>
                    <td width="600px">2021-11-16</td>
                </tr>
                <tr>
                    <td width="300px">주문상품</td>
                    <td width="600px">ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</td>
                </tr>
                <tr>
                    <td width="300px">수령인</td>
                    <td width="300px">홍길동</td>
                </tr>
                <tr>
                    <td width="300px">주문금액</td>
                    <td width="300px">280,000</td>
                </tr>
            </table>
        </div>
    </section>


    <br><br><br><br><br><br><br><br><br><br>
    <footer>
        <h1>Footer</h1>
    </footer>
</body>
</html>