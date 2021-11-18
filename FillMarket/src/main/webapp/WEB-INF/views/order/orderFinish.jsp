<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료 페이지</title>
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
        }

        .title {
            font-size: 25px;
        }

        .order_tb {
            width: 1300px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }

        #orderList, #orderList2, #orderList3 {
            border-collapse: collapse;
            text-align: center;
        }

        #orderList th {
            height: 35px;
            border-top: 2px solid lightgray;
            border-bottom: 1px solid lightgray;
            background-color: #ececec;
        }

        #orderList td {
            border-bottom: 1px solid lightgray;
        }
        #orderList2 tr td:first-child {
            width: 200px;
            height: 30px;
            text-align: center;
        }

        #orderList2 tr td:last-child {
            width: 1030px
        }

        #orderList3 tr td:first-child {
            width: 200px;
            height: 30px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
        }

        #orderList3 tr td:last-child {
            width: 1030px;
            font-size: 22px;
            font-weight: bold;
            color : rgb(231, 133, 110);
        }

        #cancelBtn {
            height: 30px;
            border: 1px solid lightgray;
            border-radius: 5px;
            /* background-color: white; */
            background-color: #f5f5f5;
            font-size: 13px;
        }

        .orderMSG {
            color : rgb(231, 133, 110);
            text-align: center;
            font-size: 30px;
            font-weight: bold;
        }

        .btnArea {
            height: 40px;
            text-align: center;
        }

        #goProductList {
            width: 300px;
            height: 50px;
            border: 1px solid rgb(231, 133, 110);
            border-radius: 25px;
            color: rgb(231, 133, 110);
            font-size: 16px;
            font-weight: 700;
            background-color: white;
            cursor: pointer;
        }

        #goOrderList {
            width: 300px;
            height: 50px;
            border: 0px;
            border-radius: 5px;
            background-color: rgb(231, 133, 110);
            font-size: 16px;
            font-weight: 700;
            border-radius: 25px;
            color: white;
            cursor: pointer;
        }

        /* #goProductList:hover {
            width: 300px;
            height: 50px;
            border: 0px;
            border-radius: 25px;
            background-color: rgb(231, 133, 110);
            font-size: 16px;
            font-weight: 700;
            color: white;
            cursor: pointer;
        }

        #goOrderList:hover {
            width: 300px;
            height: 50px;
            border: 1px solid rgb(231, 133, 110);
            border-radius: 25px;
            color: rgb(231, 133, 110);
            font-size: 16px;
            font-weight: 700;
            background-color: white;
            cursor: pointer;
        } */
    </style>
</head>
<body>
    <header>
        <h1>header</h1>
    </header>
    <br><br><br><br><br>

    <section>
        <div class="orderMSG">
            <p>결제가 완료되었습니다. 주문해 주셔서 감사합니다.</p>
        </div>
        <br><br><br>
        <div class="top">
            <span class="title">결제내역</span>
        </div>
        <br>
        <div class="order_tb">
            <table id="orderList">
                <thead>
                    <tr>
                        <th width="100px">주문 일자</th>
                        <th width="900px">상품 정보</th>
                        <th width="100px">수량</th>
                        <th width="200px">주문 가격</th>

                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>20211116</td>
                        <td>
                            <h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5>
                        </td>
                        <td>2</td>
                        <td>140,000</td>
                        <!-- <td><button id="cancelBtn">주문취소</button></td> -->
                    </tr>
                    <tr>
                        <td>20211116</td>
                        <td>
                            <h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5>
                        </td>
                        <td>2</td>
                        <td>140,000</td>
                        <!-- <td><button id="cancelBtn">주문취소</button></td> -->
                    </tr>
                </tbody>
            </table>
            <br>

            <table id="orderList3">
                <tr>
                    <td>총 결제금액</td>
                    <td style="text-align: right;">280,000</td>
                </tr>
            </table>
            <br><br><br>

        </div>
        <br><br><br><br>
        <div class="btnArea">
            <button id="goOrderList">주문내역 확인</button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button id="goProductList">쇼핑 계속하기</button>    
        </div>
    </section>

    
    <br><br><br><br><br><br><br><br><br><br>
    <footer>
        <h1>Footer</h1>
    </footer>
</body>
</html>