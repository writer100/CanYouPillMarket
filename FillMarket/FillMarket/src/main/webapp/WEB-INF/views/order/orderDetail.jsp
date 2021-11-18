<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세 조회</title>
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

        .top2 {
            width: 1180px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 30px;
        }

        .title2 {
            font-size: 18px;
            font-weight: bold;
        }

        .myOrderDetail, .paymentDetail, .deliveryInfo {
            /* padding : 10px 0px 0px 20px; */
            margin-left: auto;
            margin-right: auto;
        }

        #myOrderDetail_tb, #paymentDetail_tb, #deliveryInfo_tb {
            /* border-collapse: separate; */
            /* border-spacing: 0 2px; */
            border-collapse: collapse;
            margin-left: auto;
            margin-right: auto;
        }

        #myOrderDetail_tb tr td:first-child,
        #paymentDetail_tb tr td:first-child,
        #deliveryInfo_tb tr td:first-child {
            width : 250px;
            padding: 11px 13px 10px;
            border-bottom: 1px solid lightgray;
            background-color: rgb(245, 245, 245);
        }

        #myOrderDetail_tb tr td:last-child,
        #paymentDetail_tb tr td:last-child,
        #deliveryInfo_tb tr td:last-child {
            width : 920px;
            margin-left: 30px;
            padding: 11px 13px 10px;
            border-bottom: 1px solid lightgray;
        }

        #orderProductInfo_tb {
            border-collapse: collapse;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
        }

        #orderProductInfo_tb thead tr {
            background-color: #ececec;
        }

        #orderProductInfo_tb th {
            font-size: 14px;
            height: 35px;
            border-bottom: 1px solid lightgray;
        }

        #orderProductInfo_tb tbody td {
            border-bottom: 1px solid lightgray;
        }

        #orderProductInfo_tb tr td img {
            width: 200px;
            height: 180px;
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
    </style>
</head>
<body>
    <header>
        <h1>header</h1>
    </header>
    <br><br><br><br><br>
    
    <section>
        <div class="top">
            <span class="title">주문상세정보</span>
        </div>
        <div class="top2">
            <span class="title2">주문정보</span>
        </div>
        <br>
        <div class="myOrderDetail">
            <table id="myOrderDetail_tb">
                <tr>
                    <td>주문정보</td>
                    <td>20211116-1234</td>
                </tr>
                <tr>
                    <td>주문일자</td>
                    <td>2021-11-16 20:15:59</td>
                </tr>
                <tr>
                    <td>주문자</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>주문처리상태</td>
                    <td>배송중</td>
                </tr>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">결제정보</span>
        </div>
        <br>
        <div class="paymentDetail">
            <table id="paymentDetail_tb">
                <tr>
                    <td>총 주문금액</td>
                    <td>280,000원</td>
                </tr>
                <tr>
                    <td>배송비</td>
                    <td>무료배송</td>
                </tr>
                <tr>
                    <td>총 결제금액</td>
                    <td>280,000</td>
                </tr>
                <tr>
                    <td>결제수단</td>
                    <td>카드 결제</td>
                </tr>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">주문 상품 정보</span>
        </div>
        <br>
        <div class="orderProductInfo">
            <table id="orderProductInfo_tb">
                <thead>
                    <tr>
                        <th width="200px">이미지</th>
                        <th width="590px">상 품</th>
                        <th width="50px">수 량</th>
                        <th width="140px">합 계</th>
                        <th width="130px">처리상태</th>
                        <th width="100px">취소/교환/반품</th>
                    </tr>
                    <tbody>
                        <tr>
                            <td><img src="../images/childLife.png"></td>
                            <td><h5>ChildLife 차일드라이프 비타민D3 천연 베리맛 30ml</h5></td>
                            <td>2</td>
                            <td>140,000</td>
                            <td>배송중</td>
                            <td>-</td>
                        </tr>
                    </tbody>
                </thead>
            </table>
        </div>
        <br>
        <div class="top2">
            <span class="title2">배송지 정보</span>
        </div>
        <br>
        <div class="deliveryInfo">
            <table id="deliveryInfo_tb">
                <tr>
                    <td>받으시는 분</td>
                    <td>홍길동</td>
                </tr>
                <tr>
                    <td>우편번호</td>
                    <td>54221</td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>서울 강남구 테헤란로14길 6 남도빌딩</td>
                </tr>
                <tr>
                    <td>휴대전화</td>
                    <td>010-1111-2222</td>
                </tr>
            </table>
        </div>
        <br><br><br><br><br><br>
        <div class="btnArea">
            <button id="goOrderList">주문 내역 목록</button>
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